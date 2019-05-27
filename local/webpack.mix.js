let mix = require('laravel-mix');
mix.setPublicPath('../');
mix.setResourceRoot('../');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/assets/js/app.js', 'js/app.js')
    .styles('resources/assets/js/backend.js', '../js/backend.js')
    .sass('resources/assets/sass/app.scss', 'css/app.css')
    .sass('resources/assets/sass/backend/backend.scss','css/backend.css').options({processCssUrls: false});
