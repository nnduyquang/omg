<?php

namespace App\Repositories\Backend\Post;

interface PostRepositoryInterface
{
    public function index();
    public function storePost($request);
    public function updatePost($request,$id);
    public function deletePost($id);
}


