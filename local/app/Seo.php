<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Seo extends Model
{
    protected $fillable = [
        'seo_title','seo_description','seo_keyword','seo_image','created_at','updated_at'
    ];
    public function isSeoParameterEmpty($parameters)
    {
        $seo_keywords = $parameters->input('seo_keywords');
        $seo_title = $parameters->input('seo_title');
        $seo_description = $parameters->input('seo_description');
        $seo_image = $parameters->input('seo_image');
        if(is_null($seo_keywords)&&is_null($seo_title)&&is_null($seo_description)&&is_null($seo_image))
            return true;
        else
            return false;
    }
    public function prepareParameters($parameters)
    {
        $pathImage=$parameters->input('seo_image');
        if(!IsNullOrEmptyString($pathImage)){
            if (hasHttpOrHttps($pathImage)){
                $pathImage=substr($pathImage, strpos($pathImage, 'images'), strlen($pathImage) - 1);
            }
            $parameters->request->add(['seo_image' => $pathImage]);
        }else {
            $parameters->request->add(['seo_image' => null]);
        }
        return $parameters;
    }
}
