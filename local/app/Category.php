<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'title', 'slug', 'description', 'img_primary', 'image_mobile', 'img_sub_list', 'img_primary_mobile', 'parent_id', 'type', 'order', 'level', 'is_active', 'user_id', 'created_at', 'updated_at'
    ];
    protected $table = 'categories';
    public function posts()
    {
        return $this->belongsToMany('App\Post', 'many_category_items', 'category_id', 'item_id')->withTimestamps();
    }

    public function children()
    {
        return $this->hasMany('App\Category', 'parent_id')->orderBy('order')->with('children');
    }

    public function products()
    {
        return $this->belongsToMany('App\Product', 'many_category_items', 'category_id', 'item_id')->withTimestamps();
    }
    public function getCategoriesByType($type){
        $newArray = array();
        $categories = $this->where('type', $type)->where('parent_id', NULL)->orderBy('order')->get();

        foreach ($categories as $key => $item) {
            array_push($newArray, $item);
            if (!$item->children->isEmpty()) {

                $newArray = self::getChildren($item->children, $newArray);
            }
        }
        return $newArray;
    }

    public function getChildren($childrens, &$newArray)
    {
        foreach ($childrens as $key => $item) {
            array_push($newArray, $item);
            if (!$item->children->isEmpty()) {
                self::getChildren($item->children, $newArray);
            }
        }
        return $newArray;

    }
    public function prepareParameters($parameters){
        return $parameters;
    }
}
