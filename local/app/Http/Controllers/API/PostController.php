<?php

namespace App\Http\Controllers\API;

use App\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Repositories\Backend\Post\PostRepositoryInterface;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
//    public function __construct()
//    {
//        $this->middleware('auth:api');
//    }
    protected $postRepository;

    public function __construct(PostRepositoryInterface $postRepository)
    {
        $this->postRepository = $postRepository;
    }

    public function index(Request $request)
    {
        return $this->postRepository->index($request);
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
        $this->postRepository->storePost($request);
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
        $post=Post::findOrFail($id);
        $customMessages = [
            'title.required' => 'Mời bạn nhập tiêu đề',
            'slug.required'=>'Bạn chưa nhập tiêu đề.',
            'slug.unique'=>'Đường dẫn đã tồn tại',
            'list_id_category.required'=>'Mời bạn chọn danh mục bài viết'
        ];
        $this->validate($request, [
            'title' => 'required|string',
            'slug' => 'required|string|unique:posts,slug,'.$post->id,
            'list_id_category' => 'required',
        ],$customMessages);
        $this->postRepository->updatePost($request, $id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->postRepository->deletePost($id);
    }
}
