<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class FrontendServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        view()->composer('*', 'App\Http\ViewComposers\FrontendComposer');
//        view()->composer([
//            'frontend.07_service-detail.index',
//            'frontend.04_blogs.index'
//        ], 'App\Http\ViewComposers\Sidebar_Service_Composer');
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(\App\Repositories\Frontend\FrontendRepositoryInterface::class, \App\Repositories\Frontend\FrontendRepository::class);
    }
}
