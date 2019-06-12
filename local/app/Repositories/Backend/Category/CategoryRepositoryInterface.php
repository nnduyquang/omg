<?php

namespace App\Repositories\Backend\Category;

interface CategoryRepositoryInterface
{
    public function index($request);
    public function storeCategory($request);
    public function updateCategory($request,$id);
    public function deleteCategory($id);
    public function sort($request);
    public function doSortItem(array $sortItems, $parentId, $level);
}


