<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'title', 'slug', 'description', 'content', 'img_primary', 'img_sub_list', 'is_active', 'post_type','has_promotion', 'user_id', 'seo_id', 'is_hot'
    ];

    public function users()
    {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function manaycategoryitems($type)
    {
        return $this->belongsToMany('App\Category', 'many_category_items', 'item_id', 'category_id')->withPivot('type')->wherePivot('type', $type)->withTimestamps();
    }

    public function productattribute()
    {
        return $this->belongsToMany('App\AttributeValue', 'product_attributes', 'product_id', 'attribute_value_id')->withTimestamps();
    }

    public function seos()
    {
        return $this->belongsTo('App\Seo', 'seo_id');
    }

    public function prepareParameters($parameters)
    {
        $parameters->request->add(['user_id' => auth('api')->user()->id]);
        $pathImage = $parameters->input('img_primary');
        if (!IsNullOrEmptyString($pathImage)) {
            if (hasHttpOrHttps($pathImage)) {
                $pathImage = substr($pathImage, strpos($pathImage, 'images'), strlen($pathImage) - 1);
            }
            $parameters->request->add(['img_primary' => $pathImage]);
        } else {
            $parameters->request->add(['img_primary' => null]);
        }
        $listImageInfo = $parameters->input('img_sub_list');
        if(isset($listImageInfo)){
            if (count($listImageInfo) != 0) {
                $sub_image=[];
                foreach ($listImageInfo as $key => $item) {
                    $itemToArray=json_decode($item);
                    if (hasHttpOrHttps($itemToArray->path))
                        $itemToArray->path = substr($itemToArray->path, strpos($itemToArray->path, 'images'), strlen($itemToArray->path) - 1);
                    else {
                        $itemToArray->path =  $itemToArray->path;
                    }
                    array_push( $sub_image,$itemToArray);
                }
                $parameters->request->add(['img_sub_list' => str_replace("\\/", "/", json_encode($sub_image))]);
            }
        }else {
            $parameters->request->add(['img_sub_list' => null]);
        }
        return $parameters;
    }

    public function getAllProduct()
    {
        $datas = $this->orderBy('created_at', 'DESC')->with('seos')->get();
        foreach ($datas as $key => $item) {
            $listCategory = $item->manaycategoryitems(1)->get()->implode('id', ',');
            $item->listCategory = $listCategory;
        }
        return $datas;
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function ($product) { // before delete() method call this
            if (!is_null($product->seo_id)) {
                $product->seos->delete();
            }
            $product->productattribute()->detach();
            $product->manaycategoryitems(CATEGORY_PRODUCT)->detach();
        });

    }
}
