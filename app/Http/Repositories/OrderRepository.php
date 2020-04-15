<?php
/**
 * Created by PhpStorm.
 * User: Ripper
 * Date: 6/30/2019
 * Time: 12:10 PM
 */

namespace App\Interfaces;


use App\Http\Repositories\Repository;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class OrderRepository implements Repository
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

    public function allWithProducts()
    {
        return $this->model->with('product')->get();
    }

    public function deliverOrder($id)
    {
        $order = $this->model->where('id', $id)->update(['is_delivered' => '1']);
        $orderData = $this->model->where('id', $id)->first();
        return $orderData;
    }

    public function updateOrder($data)
    {
        $order = $this->model->where('product_id', $data['product_id'])->where('user_id', $data['user_id'])->update(['is_payed' => '1']);
        return $order;
    }

    // create a new record in the database
    public function create(array $data)
    {
        return $this->model->create([
            'product_id' => $data['product_id'],
            'user_id' => Auth::id(),
            'quantity' => $data['quantity'],
            'address' => $data['address']
        ]);
    }

    // update record in the database
    public function update(array $data, $id)
    {
        $record = $this->find($id);
        return $record->update($data);
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