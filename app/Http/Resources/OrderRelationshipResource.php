<?php
/**
 * Created by PhpStorm.
 * User: Ripper
 * Date: 9/21/2019
 * Time: 10:57 AM
 */

namespace App\Http\Resources;


use Illuminate\Http\Resources\Json\JsonResource;

class OrderRelationshipResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'product' => (new OrderProductResourceRelationship($this->products))->additional(['product' => $this]),
        ];
    }
}