<!DOCTYPE Html>
<html lang="en-US" class="lang-en_US" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<meta http-equiv="content-type" content="text/Html;charset=UTF-8"/>
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# article: http://ogp.me/ns/article#">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>@yield('title')</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="keywords" content="@yield('keyword')">
    <meta name="description" content="@yield('description')">
    <meta name="viewport" content="width=device-width">
    <meta property="og:title" content="@yield('title')"/>
    <meta property="og:url" content="@yield('url-og')"/>
    <meta property="og:image" content="@yield('image-og')"/>
    <meta property="og:image:alt" content=""/>
    <meta property="og:type" content="website"/>
    <meta property="og:description" content="@yield('description')"/>
    <meta property="og:locale" content="vi_VN"/>
    {{--<link rel="shortcut icon" href="images/icon/favicon.ico" type="image/x-icon">--}}
    {{--<meta property="og:site_name" content="Site Name, i.e. Moz" />--}}
    {{--{{ Html::style('css/core.common.css') }}--}}
    {{--{{ Html::style('css/core.frontend.css') }}--}}
    {{ Html::style('css/common.css') }}
    @yield('styles')
</head>
<body>
@include('frontend.00_common.menu.menu_desktop')
@include('frontend.00_common.menu.menu_mobile')
@yield('slider')

@yield('container')

<div class="footer">
    {{--@include('frontend.00_common.footer')--}}
    {{--@include('frontend.00_common.footer_2')--}}
</div>

{{ Html::script('js/core.common.js') }}



{{--<script src="{{URL::to("js/soft.js")}}"></script>--}}
@yield('scripts')

</body>

</html>