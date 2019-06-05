<?php

namespace App\Repositories\Backend\Product;

interface ProductRepositoryInterface
{
    public function index();
    public function storeProduct($request);
    public function updateProduct($request,$id);
    public function deleteProduct($id);
}


