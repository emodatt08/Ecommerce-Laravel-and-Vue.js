<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
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
            "product_id" => (string) $this->product_id,
            "user_id" => $this->user_id,
            "quantity" => $this->quantity,
            "id"    => $this->id
            //'relationship' => new ProductRelationshipResource($this)
        ];
    }

    public function with($request){
        return [
            "version" => "1.0.0",
            "author" => "Hillary Kollan",
            "author_url" => url("https://www.github.com/emodatt08")

        ];
    }
}
