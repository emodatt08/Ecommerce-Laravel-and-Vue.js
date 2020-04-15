<?php

namespace App\Http\Controllers;

use App\Http\Resources\OrderResource;
use App\Http\Resources\ProductResource;
use App\Interfaces\OrderRepository;
use App\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    private $orderRepository;
    public function __construct()
    {
        $this->orderRepository = new OrderRepository(new Order());
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */
    public function index()
    {
        return response()->json($this->orderRepository->allWithProducts());
    }

    public function deliverOrder($id)
    {
        return new OrderResource($this->orderRepository->deliverOrder($id));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return OrderResource
     */
    public function create(Request $request)
    {
        return new OrderResource($this->orderRepository->create($request->all()));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return OrderResource
     */
    public function store(Request $request)
    {
        //dd($request->all());
        return new OrderResource($this->orderRepository->create($request->all()));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */
    public function show($id)
    {
        return OrderResource::collection($this->model->show($id));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return OrderResource
     */
    public function update(Request $request, $id)
    {
        return new OrderResource($this->orderRepository->update($request->only(['quantity']), $id));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return OrderResource
     */
    public function destroy($id)
    {
        return new OrderResource($this->orderRepository->delete($id));
    }
}
