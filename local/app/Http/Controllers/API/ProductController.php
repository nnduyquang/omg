<?php

namespace App\Http\Controllers\API;

use App\Product;
use App\Repositories\Backend\Product\ProductRepositoryInterface;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProductController extends Controller
{
    protected $productRepository;

    public function __construct(ProductRepositoryInterface $productRepository)
    {
        $this->productRepository = $productRepository;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->productRepository->index();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $customMessages = [
            'title.required' => 'Mời bạn nhập tên sản phẩm',
            'slug.required'=>'Bạn chưa nhập tên sản phẩm.',
            'slug.unique'=>'Đường dẫn đã tồn tại',
            'list_id_category.required'=>'Mời bạn chọn danh mục sản phẩm'
        ];
        $this->validate($request, [
            'title' => 'required|string',
            'slug' => 'required|string|unique:posts',
            'list_id_category' => 'required',
        ],$customMessages);
        $this->productRepository->storeProduct($request);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $product=Product::findOrFail($id);
        $customMessages = [
            'title.required' => 'Mời bạn nhập tên sản phẩm',
            'slug.required'=>'Bạn chưa nhập tên sản phẩm.',
            'slug.unique'=>'Đường dẫn đã tồn tại',
            'list_id_category.required'=>'Mời bạn chọn danh mục sản phẩm'
        ];
        $this->validate($request, [
            'title' => 'required|string',
            'slug' => 'required|string|unique:posts,slug,'.$product->id,
            'list_id_category' => 'required',
        ],$customMessages);
        $this->productRepository->updateProduct($request, $id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->productRepository->deleteProduct($id);
    }
}
