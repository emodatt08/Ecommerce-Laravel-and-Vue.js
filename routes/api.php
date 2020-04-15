<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', 'UserController@login');
Route::post('register', 'UserController@register');
Route::get('/products', 'ProductController@index');
Route::post('/upload-file', 'ProductController@uploadFile');
Route::get('/products/{product}', 'ProductController@show');

Route::group(['middleware' => 'auth:api'], function(){
    Route::get('users','UserController@index');
    Route::get('users/{user}','UserController@show');
    Route::patch('users/{user}','UserController@update');
    Route::get('users/{user}/orders','UserController@showOrders');

    Route::group(['prefix'=>'payments'], function(){
        Route::post('/stripe', 'PaymentController@create');
    });





    Route::patch('products/{product}/units/add','ProductController@updateUnits');


    Route::resource('orders', 'OrderController');
    Route::patch('orders/{order}/deliver','OrderController@deliverOrder');

    Route::resource('/products', 'ProductController')->except(['index','show']);


});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
