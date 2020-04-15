<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable =  [
        'card_no',
        'ccExpiryMonth',
        'ccExpiryYear',
        'cvvNumber',
        'currency',
        'amount',
        'order_id'
    ];
    public function orders()
    {
        return $this->belongsTo(Order::class);
    }
}
