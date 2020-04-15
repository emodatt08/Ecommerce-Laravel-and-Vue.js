<?php
/**
 * Created by PhpStorm.
 * User: Ripper
 * Date: 6/16/2019
 * Time: 8:29 AM
 */

namespace App\Interfaces;


interface ProductsInterface
{
    public function all();

    public function create(array $data);

    public function update(array $data, $id);

    public function delete($id);

    public function show($id);

}