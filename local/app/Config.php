<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Config extends Model
{
    protected $fillable = [
        'name', 'content', 'created_at', 'updated_at'
    ];


    public function getAllConfig()
    {
        return $this->pluck('content', 'name');
    }

    public function updateConfig($key, $val)
    {
        if ($setting = self::getAllSettings()->where('name', $key)->first()) {
            return $setting->update([
                'name' => $key,
                'content' => $val]) ? $val : false;
        }
    }

    public static function getAllSettings()
    {
        return self::all();
    }

    public function getConfigByName($name)
    {
        return $this->whereName($name)->first()->content;
    }

    public function getConfigByListName($array)
    {
        return $this->whereIn('name', $array)->get();
    }

    public function prepareParameters($parameters)
    {
        $pathLogo = $parameters->input('config_logo');
        if (!IsNullOrEmptyString($pathLogo)) {
            if (hasHttpOrHttps($pathLogo)) {
                $pathLogo = substr($pathLogo, strpos($pathLogo, 'images'), strlen($pathLogo) - 1);
            }
            $parameters->request->add(['config_logo' => $pathLogo]);
        } else {
            $parameters->request->add(['config_logo' => null]);
        }
        $listImageSlider = $parameters->input('config_slider');
        if (isset($listImageSlider)) {
            if (count($listImageSlider) != 0) {
                $sub_image = [];
                foreach ($listImageSlider as $key => $item) {
                    $itemToArray = json_decode($item);
                    if (hasHttpOrHttps($itemToArray->path))
                        $itemToArray->path = substr($itemToArray->path, strpos($itemToArray->path, 'images'), strlen($itemToArray->path) - 1);
                    else {
                        $itemToArray->path = $itemToArray->path;
                    }
                    array_push($sub_image, $itemToArray);
                }
                $parameters->request->add(['config_slider' => str_replace("\\/", "/", json_encode($sub_image))]);
            }
        } else {
            $parameters->request->add(['config_slider' => null]);
        }
        $configHotlineShow = $parameters->input('config_hotline_show');
        if (!IsNullOrEmptyString($configHotlineShow)) {
            $parameters->request->add(['config_hotline_show' => $configHotlineShow]);
            $parameters->request->add(['config_hotline_call' => clean_phone($configHotlineShow)]);
        } else {
            $parameters->request->add(['config_hotline_call' => null]);
            $parameters->request->add(['config_hotline_show' => null]);
        }
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
