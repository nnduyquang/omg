<?php

namespace App\Repositories\Backend\Product;

use App\CategoryItem;
use App\Repositories\EloquentRepository;
use App\Seo;

class ProductRepository extends EloquentRepository implements ProductRepositoryInterface
{
    public function getModel()
    {
        return \App\Product::class;
    }

    public function index()
    {
        return $this->_model->getAllProduct();
    }

    public function storeProduct($request)
    {
        $parameters = $this->_model->prepareParameters($request);
        $seo = new Seo();
        if (!$seo->isSeoParameterEmpty($request)) {
            $paramSeo = $seo->prepareParameters($request);
            $seo = Seo::create($paramSeo->all());
            $request->request->add(['seo_id' => $seo->id]);
        } else {
            $request->request->add(['seo_id' => null]);
        }
        $result = $this->_model->create($parameters->all());
        $attachData = array();
        foreach ($parameters['list_id_category'] as $key => $item) {
            $attachData[$item] = array('type' => CATEGORY_PRODUCT);
        }
        $result->manaycategoryitems(CATEGORY_PRODUCT)->attach($attachData);
    }

    public function updateProduct($request, $id)
    {
        $parameters = $this->_model->prepareParameters($request);
        $result = $this->update($id, $parameters->all());
        $seo = new Seo();
        if (!$seo->isSeoParameterEmpty($request)) {
            $paramSeo = $seo->prepareParameters($request);

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


        $syncData = array();
        foreach ($parameters['list_id_category'] as $key => $item) {
            $syncData[$item] = array('type' => CATEGORY_PRODUCT);
        }
        $result->manaycategoryitems(CATEGORY_PRODUCT)->sync($syncData);

    }

    public function deleteProduct($id)
    {
        $this->delete($id);
        return true;
    }


}