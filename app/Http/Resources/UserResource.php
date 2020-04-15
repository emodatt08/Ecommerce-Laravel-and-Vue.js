<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            "email" => $this->email,
            "created_at" => $this->created_at,
            'relationship' => new UserRelationshipResource($this),
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
