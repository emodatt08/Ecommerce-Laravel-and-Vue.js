<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequest;
use App\Http\Resources\UserResource;
use App\Http\Repositories\UserRepository;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{

    private $model;

    public function  __construct()
    {
        $this->model = new UserRepository(new User());
    }

    /**
     *  returns all users with their orders.
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */
    public function index()
    {
        //dd($this->model->all());
        return  UserResource::collection($this->model->all());
    }

    /**
     * authenticates a user and generates an access token for that user. The createToken method is one of the methods Laravel Passport adds to our user model.
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        //dd($request);
        $status = 401;
        $response = ['error' => 'Unauthorised'];
        //$response = ['user' => '401','error' => 'Unauthorised', 'token' => null];

        if (Auth::attempt($request->only(['email', 'password']))) {
            $status = 200;
            $response = [
                'user' => Auth::user(),
                'token' => Auth::user()->createToken('sellify')->accessToken,
            ];
        }

        return response()->json($response, $status);
    }

    /**
     * creates a user account, authenticates it and generates an access token for it.
     * @param UserRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(UserRequest $request)
    {
        $data = $request->only(['name', 'email', 'password']);
        $data['password'] = bcrypt($data['password']);

        $user = $this->model->create($data);
        $user->is_admin = 0;

        return response()->json([
            'user' => $user,
            'token' => $user->createToken('sellify')->accessToken,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * show a user
     * @param $id
     * @return UserResource
     */
    public function show($id)
    {
        return new UserResource($this->model->show($id));
    }

    /**
     * @param User $user
     * @return UserResource
     */
    public function showOrders(User $user)
    {

        return response()->json($this->model->orders($user));
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
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
