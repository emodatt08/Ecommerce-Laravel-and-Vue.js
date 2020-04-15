<?php

namespace App\Http\Controllers;

use App\Http\Repositories\PaymentRepository;
use App\Http\Requests\PaymentRequest;

use App\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Stripe\Stripe;

class PaymentController extends Controller
{

    private $payRepository;
    public function __construct()
    {
        $this->payRepository = new PaymentRepository(new Payment());
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(PaymentRequest $request)
    {
        dd($request->all());

            $stripe = Stripe::setApiKey(env('STRIPE_SECRET'));
            try {
                $token = $stripe->tokens()->create([
                    'card' => [
                        'number' => $request->get('card_no'),
                        'exp_month' => $request->get('ccExpiryMonth'),
                        'exp_year' => $request->get('ccExpiryYear'),
                        'cvc' => $request->get('cvvNumber'),
                    ],
                ]);
                Log::info('response from token '. json_encode([$token]));

                $pay = $this->payRepository->create($request->all());
                if (!isset($token['id'])) {
                return response()->json([]);
                }


                $charge = $stripe->charges()->create([
                    'card' => $token['id'],
                    'currency' => 'USD',
                    'amount' => $request->get('amount'),
                    'description' => 'wallet',
                ]);



                Log::info('response from charge '. json_encode([$charge]));
                if($charge['status'] == 'succeeded') {
                 $fulfillOrder = $this->payRepository->update($pay->id,['status' => '1']);
                    Log::info('Success');
                    return response()->json([]);
                } else {
//                    \Session::put('error','Money not add in wallet!!');
                    Log::error('Money was not added to wallet');
                    return response()->json([]);
                }
            } catch (\Exception $e) {
                Log::error($e->getMessage());
                return response()->json([]);
            } catch(\Cartalyst\Stripe\Exception\CardErrorException $e) {
                Log::error($e->getMessage());
                return response()->json([]);
            } catch(\Cartalyst\Stripe\Exception\MissingParameterException $e) {
                Log::error($e->getMessage());
                return response()->json([]);
            }

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
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
