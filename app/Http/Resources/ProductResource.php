<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
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
            "id" => (string) $this->id,
            "name" => $this->name,
            "description" => $this->description,
            "price" => $this->price,
            "units" => $this->units,
            "image" => $this->image,
            'relationship' => new ProductRelationshipResource($this),
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
