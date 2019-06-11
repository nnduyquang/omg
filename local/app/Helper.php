<?php
function isLocalhost($whitelist = ['127.0.0.1', '::1'])
{
    return in_array($_SERVER['REMOTE_ADDR'], $whitelist);
}

function get_base_url()
{
    if (isLocalhost())
        return '/start';
    else
        return '/';
}

function IsNullOrEmptyString($string)
{
    return (!isset($string) || trim($string) === '');
}

function hasHttpOrHttps($str)
{
    $parsed = parse_url($str);
    return (isset($parsed['scheme'])) ? true : false;
}

function set_active($path)
{
    return Request::is($path . '*') ? ' active' : '';
}

function set_open_active_child_menu($listPath)
{
    foreach ($listPath as $key => $item)
        if (Request::is($item . '*'))
            return Request::is($item . '*') ? ' block' : '';
}

function set_open_is_open_menu($listPath)
{
    foreach ($listPath as $key => $item)
        if (Request::is($item . '*'))
            return Request::is($item . '*') ? ' menu-open' : '';
}
function clean_phone($string) {
    $string = str_replace(' ', '', $string); // Replaces all spaces with hyphens.

    return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
}