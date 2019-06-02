<?php

namespace App\Http\Controllers\API;

use App\Post;
use App\Seo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index()
    {
        $post = new Post();
        return $post->getAllPost(IS_POST);
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
            'title.required' => 'Mời bạn nhập tiêu đề',
            'slug.required'=>'Bạn chưa nhập tiêu đề.',
            'slug.unique'=>'Đường dẫn đã tồn tại',
            'list_id_category.required'=>'Mời bạn chọn danh mục bài viết'
        ];
        $this->validate($request, [
            'title' => 'required|string',
            'slug' => 'required|string|unique:posts',
            'list_id_category' => 'required',
        ],$customMessages);
        $post=new Post();
        $parameters = $post->prepareParameters($request);
        $seo = new Seo();
        if (!$seo->isSeoParameterEmpty($request)) {
            $paramSeo=$seo->prepareParameters($request);
            $seo = Seo::create($paramSeo->all());
            $request->request->add(['seo_id' => $seo->id]);
        } else {
            $request->request->add(['seo_id' => null]);
        }

        $result = Post::create($parameters->all());
        if ($parameters->type == IS_POST) {
            $attachData = array();
            foreach ($parameters['list_id_category'] as $key => $item) {
                $attachData[$item] = array('type' => CATEGORY_POST);
            }
            $result->manaycategoryitems(CATEGORY_POST)->attach($attachData);
        }

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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
