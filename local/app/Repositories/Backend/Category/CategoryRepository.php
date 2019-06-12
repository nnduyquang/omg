<?php

namespace App\Repositories\Backend\Category;


use App\Repositories\EloquentRepository;


class CategoryRepository extends EloquentRepository implements CategoryRepositoryInterface
{
    public function getModel()
    {
        return \App\Category::class;
    }

    public function index($request)
    {
        return $this->_model->getCategoriesByType($request->category_type);
    }

    public function storeCategory($request)
    {
        $parameters =  $this->_model->prepareParameters($request);
        $this->_model->create($parameters->all());
    }

    public function updateCategory($request, $id)
    {
        $parameters = $this->_model->prepareParameters($request);
        $this->update($id,$parameters->all());
    }

    public function deleteCategory($id)
    {
        $this->delete($id);
        return true;
    }

    public function sort($request)
    {
        $sortItems = json_decode($request->listSort);
        $this->doSortItem($sortItems, null, 0);
        return ['message' => 'Update the category info'];
    }

    public function doSortItem(array $sortItems, $parentId, $level)
    {
        foreach ($sortItems as $index => $sortItem) {
            $item = $this->_model->find($sortItem->id);
            $item->order = $index + 1;
            $item->parent_id = $parentId;
            $item->level = $level;
            $item->save();
            if (isset($sortItem->children)) {
                self::doSortItem($sortItem->children, $item->id, $item->level + 1);
            }
        }
    }


}