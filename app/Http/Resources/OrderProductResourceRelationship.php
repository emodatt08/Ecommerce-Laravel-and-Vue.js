<?php
/**
 * Created by PhpStorm.
 * User: Ripper
 * Date: 9/21/2019
 * Time: 12:53 PM
 */

namespace App\Http\Resources;
use Illuminate\Http\Resources\Json\ResourceCollection;

class OrderProductResourceRelationship extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return parent::toArray($request);
    }
}