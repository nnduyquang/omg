<?php

namespace App\Http\Controllers\API;

use App\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CategoryPostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $category = new Category();
        return $category->getCategoriesByType($request->category_type);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|string|max:255',
            'slug' => 'unique:categories',
        ]);
        $category = new Category();
        $parameters = $category->prepareParameters($request);
        return Category::create($parameters->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $category = Category::findOrFail($id);
        $this->validate($request, [
            'title' => 'required|string|max:255',
            'slug' => 'sometimes|unique:categories,slug,' . $category->id,
        ]);
        $parameters = $category->prepareParameters($request);
        $category->update($parameters->all());

        return ['message' => 'Update the category info'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::findOrFail($id);
        $category->delete();
        return ['message' => 'Category deleted'];
    }

    public function sort(Request $request)
    {
        $sortItems = json_decode($request->listSort);
        $this->doSortItem($sortItems, null, 0);
        return ['message' => 'Update the category info'];
    }

    public function doSortItem(array $sortItems, $parentId, $level)
    {

        foreach ($sortItems as $index => $sortItem) {
            $item = Category::find($sortItem->id);
            $item->order = $index + 1;
            $item->parent_id = $parentId;
            $item->level = $level;
            $item->save();
            if (isset($sortItem->children)) {
                self::doSortItem($sortItem->children, $item->id, $item->level+1);
            }
        }
    }
}
