<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::group(['middleware' => ['auth']], function () {
    Route::get('dashboard', function () {
        return view('backend.admin.dashboard.index');
    })->name('dashboard');
    Route::get('category-post', function () {
        return view('backend.admin.category-post.index');
    })->name('category-post');
    Route::get('post', function () {
        return view('backend.admin.post.index');
    })->name('post');
    Route::get('user', function () {
        return view('backend.admin.user.index');
    })->name('user.active');
});
