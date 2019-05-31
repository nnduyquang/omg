<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Post extends Model
{
    protected $fillable = [
        'title', 'slug', 'description', 'content', 'img_primary','img_sub_list', 'is_active', 'post_type', 'user_id', 'seo_id','is_hot'
];
    public function users()
    {
        return $this->belongsTo('App\User', 'user_id');
    }
    public function manaycategoryitems($type)
    {
        return $this->belongsToMany('App\ManyCategoryItem', 'many_category_items', 'item_id', 'category_id')->withPivot('type')->wherePivot('type',$type)->withTimestamps();
    }
    public function seos(){
        return $this->belongsTo('App\Seo','seo_id');
    }
    public function prepareParameters($parameters)
    {
        $parameters->request->add(['slug' => '']);
        dd(Auth::user()->name);
        $parameters->request->add(['user_id' => Auth::user()->id]);

        $pathImage=$parameters->input('img_primary');
        if(!IsNullOrEmptyString($pathImage)){
            if (hasHttpOrHttps($pathImage)){
                $pathImage=substr($pathImage, strpos($pathImage, 'images'), strlen($pathImage) - 1);
            }
            $parameters->request->add(['img_primary' => $pathImage]);
        }else {
            $parameters->request->add(['img_primary' => null]);
        }
        return $parameters;
    }
    public function getAllPost($post_type){
        return $this->where('post_type', $post_type)->orderBy('created_at','DESC')->get();
    }
}
