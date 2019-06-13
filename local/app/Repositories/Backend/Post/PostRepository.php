<?php

namespace App\Repositories\Backend\Post;

use App\CategoryItem;
use App\Repositories\EloquentRepository;
use App\Seo;

class PostRepository extends EloquentRepository implements PostRepositoryInterface
{
    public function getModel()
    {
        return \App\Post::class;
    }

    public function index($request)
    {
        return $this->_model->getAllPost($request->post_type);
    }

    public function storePost($request)
    {
        $parameters = $this->_model->prepareParameters($request);
        $seo = new Seo();
        if (!$seo->isSeoParameterEmpty($request)) {
            $paramSeo=$seo->prepareParameters($request);
            $seo = Seo::create($paramSeo->all());
            $request->request->add(['seo_id' => $seo->id]);
        } else {
            $request->request->add(['seo_id' => null]);
        }

        $result = $this->_model->create($parameters->all());
        if ($parameters->post_type == IS_POST) {
            $attachData = array();
            foreach ($parameters['list_id_category'] as $key => $item) {
                $attachData[$item] = array('type' => CATEGORY_POST);
            }
            $result->manaycategoryitems(CATEGORY_POST)->attach($attachData);
        }
    }

    public function updatePost($request, $id)
    {
        $parameters = $this->_model->prepareParameters($request);
        $result = $this->update($id,$parameters->all());
        $seo = new Seo();
        if (!$seo->isSeoParameterEmpty($request)) {
            $paramSeo=$seo->prepareParameters($request);

            if (is_null($result->seo_id)) {
                $data = Seo::create($paramSeo->all());
                $result->update(['seo_id' => $data->id]);
            } else {
                $result->seos->update($paramSeo->all());
            }
        } else {
            if (!is_null($result->seo_id)) {
                $result->seos->delete();
            }
        }

        if ($parameters->post_type == IS_POST) {
            $syncData = array();
            foreach ($parameters['list_id_category'] as $key => $item) {
                $syncData[$item] = array('type' => CATEGORY_POST);
            }
            $result->manaycategoryitems(CATEGORY_POST)->sync($syncData);
        }
    }

    public function deletePost($id)
    {
        $this->delete($id);
        return true;
    }


}