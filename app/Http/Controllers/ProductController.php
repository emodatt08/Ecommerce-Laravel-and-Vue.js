<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProductResource;
use App\Repositories\ProductsRepository;
use Illuminate\Http\Request;
use App\Product;
class ProductController extends Controller
{
    private $model;

    public function  __construct()
    {
        $this->model = new ProductsRepository(new Product());
    }

    /**
     * Display a listing of the products with all orders.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */
    public function index()
    {
        return ProductResource::collection($this->model->all());
    }

    /**
     * creates a product record.
     *
     * @return ProductResource
     */
    public function create(Request $request)
    {
        dd($request->all());
        return new ProductResource($this->model->create($request->only(['name', 'description', 'units', 'price', 'image'])));
    }

    /**
     * uploads the image for a product we created and returns the url for the product.
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function uploadFile(Request $request)
    {
        //dd($request->image);
        if($request->hasFile('image')){
            $name = time()."_".$request->file('image')->getClientOriginalName();
            $request->file('image')->move(public_path('images'), $name);
        }
        //dd('here');
        return response()->json(["link" => asset("images/$name")],201);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return ProductResource
     */
    public function store(Request $request)
    {
        //dd($request->all());
        return new ProductResource($this->model->create($request->all()));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return ProductResource
     */
    public function show($id)
    {
        return new ProductResource($this->model->show($id));
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
     * updates the product record.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return ProductResource
     */
    public function update(Request $request, $id)
    {
        $data = $request->all();
        return $this->model->update($data, $id);
    }

    /**
     * adds new units to a product.
     * @param Request $request
     * @param Product $product
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateUnits(Request $request, Product $product)
    {
        $product->units = $product->units + $request->get('units');
        $status = $product->save();

        return response()->json([
            'status' => $status,
            'message' => $status ? 'Units Added!' : 'Error Adding Product Units'
        ]);
    }

    /**
     * Remove the specified product from storage.
     *
     * @param  int  $id
     * @return ProductResource
     */
    public function destroy($id)
    {
        return new ProductResource($this->model->delete($id));
    }
}
