<?php

namespace App\Repositories\Frontend;


use App\Config;

class FrontendRepository implements FrontendRepositoryInterface
{
    public function getFrontend()
    {
        $data = [];

        return $data;
    }




    public function getFrontendCommon()
    {
        $data = [];
        $config = new Config();
        $dataConfig = $config->getConfigByListName(['config_phone', '	
config_describe_contact', 'config_hotline_show', 'config_hotline_call', 'config_info_email', 'config_title', 'config_address', 'config_logo', 'config_script_header', 'config_script_body', 'config_slider', 'seo_title', 'seo_description', 'seo_image','config_descrtiption']);
        foreach ($dataConfig as $key => $item) {
            if ($item->name == 'config_phone')
                $data['config_phone'] = $item->content;
            if ($item->name == 'config_hotline_call')
                $data['config_hotline_call'] = $item->content;
            if ($item->name == 'config_hotline_show')
                $data['config_hotline_show'] = $item->content;
            if ($item->name == 'config_descrtiption')
                $data['config_descrtiption'] = $item->content;
            if ($item->name == 'config_info_email')
                $data['config_info_email'] = $item->content;
            if ($item->name == 'config_address')
                $data['config_address'] = $item->content;
            if ($item->name == 'config_title')
                $data['config_title'] = $item->content;
            if ($item->name == 'config_logo')
                $data['config_logo'] = $item->content;
            if ($item->name == 'config_script_header')
                $data['config_script_header'] = $item->content;
            if ($item->name == 'config_script_body')
                $data['config_script_body'] = $item->content;
            if ($item->name == 'map-config')
                $data['map-config'] = $item->content;
            if ($item->name == 'seo_title')
                $data['seo_title'] = $item->content;
            if ($item->name == 'seo_description')
                $data['seo_description'] = $item->content;
            if ($item->name == 'seo_image')
                $data['seo_image'] = $item->content;
            if ($item->name == 'config_slider')
                $data['config_slider'] = $item->content;
        }
        return $data;
    }



}