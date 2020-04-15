<?php
/**
 * Created by PhpStorm.
 * User: Ripper
 * Date: 6/16/2019
 * Time: 8:28 AM
 */

namespace App\Repositories;
use App\Http\Repositories\Repository;
use Illuminate\Database\Eloquent\Model;


class ProductsRepository implements Repository
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    // Get all instances of model
    public function all()
    {
        return $this->model->all();
    }

    public function allWithOrders()
    {
        return $this->model->with('orders');
    }

    // create a new record in the database
    public function create(array $data)
    {
        unset($data['index']);
        return $this->model->create($data);
    }

    // update record in the database
    public function update(array $data, $id)
    {
        unset($data['index']);
        $record = $this->model->where('id',$id)->update($data);
        return $record;
    }

    // remove record from the database
    public function delete($id)
    {
        return $this->model->destroy($id);
    }

    // show the record with the given id
    public function show($id)
    {
        return $this->model->findOrFail($id);
    }

    // Get the associated model
    public function getModel()
    {
        return $this->model;
    }

    // Set the associated model
    public function setModel($model)
    {
        $this->model = $model;
        return $this;
    }

    // Eager load database relationships
    public function with($relations)
    {
        return $this->model->with($relations);
    }
}