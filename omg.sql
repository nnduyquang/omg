-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 12, 2019 lúc 04:20 AM
-- Phiên bản máy phục vụ: 10.1.31-MariaDB
-- Phiên bản PHP: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `omg`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `img_primary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_sub_list` longtext COLLATE utf8mb4_unicode_ci,
  `img_primary_mobile` longtext COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `level` tinyint(3) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `description`, `img_primary`, `img_sub_list`, `img_primary_mobile`, `is_active`, `order`, `parent_id`, `level`, `type`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'tinh te 2', 'tinh-te-2', NULL, NULL, NULL, NULL, 1, 3, NULL, 0, 0, 1, '2019-05-11 18:16:23', '2019-05-27 23:44:25'),
(2, 'tinh te 3', 'tinh-te-3', NULL, NULL, NULL, NULL, 1, 4, NULL, 0, 0, 1, '2019-05-11 18:28:16', '2019-05-27 23:44:25'),
(3, 'tinh te 4', 'tinh-te-4', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 1, '2019-05-11 18:57:02', '2019-05-16 00:54:45'),
(4, 'tinh te 5', 'tinh-te-5', NULL, NULL, NULL, NULL, 0, 1, 3, 1, 0, 1, '2019-05-11 21:56:30', '2019-05-16 00:33:34'),
(5, 'tinh te 6', 'tinh-te-6', NULL, NULL, NULL, NULL, 0, 1, 4, 2, 0, 1, '2019-05-12 07:59:07', '2019-05-16 19:00:39'),
(6, 'tinh te 7', 'tinh-te-7', NULL, NULL, NULL, NULL, 0, 5, NULL, 0, 0, 1, '2019-05-12 07:59:28', '2019-06-05 00:32:29'),
(7, 'tinh te 8', 'tinh-te-8', NULL, NULL, NULL, NULL, 0, 2, NULL, 0, 0, 1, '2019-05-12 08:00:06', '2019-05-27 23:44:25'),
(8, 'tinh te 2000', 'tinh-te-2000', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 1, '2019-06-05 00:58:53', '2019-06-05 00:58:53'),
(9, 'gamek 2000', 'gamek-2000', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 1, '2019-06-05 00:59:12', '2019-06-05 01:00:03'),
(10, 'game k100', 'game-k100', NULL, NULL, NULL, NULL, 1, 1, 9, 1, 1, 1, '2019-06-05 00:59:52', '2019-06-05 01:00:18'),
(11, 'gamek 9000', 'gamek-9000', NULL, NULL, NULL, NULL, 0, 1, 10, 2, 1, 1, '2019-06-05 01:00:00', '2019-06-05 01:00:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configs`
--

CREATE TABLE `configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `configs`
--

INSERT INTO `configs` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'config_logo', 'images/upload/origins/image-81.png', NULL, '2019-06-11 03:00:30'),
(2, 'config_title', 'Công Ty Smartlinks', NULL, '2019-06-11 18:29:59'),
(3, 'config_descrtiption', 'Mô Tả Ngắn Về DN s d  f', NULL, '2019-06-11 03:02:12'),
(4, 'config_address', 'Địa Chỉ Doanh Nghiệp', NULL, '2019-06-11 02:03:21'),
(5, 'config_info_email', 'nnduyquang@gmail.com', NULL, '2019-06-11 02:03:21'),
(6, 'config_describe_contact', '<p>Chữ ký nè má</p>', NULL, '2019-06-11 19:14:25'),
(7, 'config_phone', '0907468264 - 0902710212', NULL, '2019-06-11 02:03:22'),
(8, 'seo_title', 'Công Ty Smartlinks', NULL, '2019-06-11 18:29:59'),
(9, 'seo_keyword', 'từ khóa', NULL, '2019-06-11 02:03:22'),
(10, 'seo_description', 'Mô Tả Ngắn Về DN ma ma ma s s  df', NULL, '2019-06-11 03:02:58'),
(11, 'seo_image', 'images/upload/origins/capture.png', NULL, '2019-06-11 18:29:59'),
(12, 'config_slider', '[{\"path\":\"images/upload/origins/image-81.png\",\"name\":\"image-81.png\",\"width\":257,\"height\":214}]', NULL, '2019-06-11 19:18:27'),
(13, 'config_hotline_call', '0902710212', NULL, '2019-06-11 02:03:22'),
(14, 'config_hotline_show', '0902710.212', NULL, '2019-06-11 03:00:30'),
(15, 'config_email_receive', 'nnduyquang@gmail.com', NULL, '2019-06-11 18:29:33'),
(16, 'config_email_sender_subject', 'Chúng Tôi Đã Nhận Được Mail, Xin Chân Thành Cảm Ơn', NULL, '2019-06-11 18:29:33'),
(17, 'config_email_sender_from', 'Công Ty Smartlinks', NULL, '2019-06-11 18:29:33'),
(18, 'config_email_receive_subject', 'Có Báo Giá Mới Từ Khách Hàng', NULL, '2019-06-11 18:29:33'),
(19, 'config_email_receive_from', 'Công Ty Smartlinks', NULL, '2019-06-11 18:29:33'),
(20, 'config_email_content_to_customer', '<p>Cảm Ơn</p>', NULL, '2019-06-11 18:29:33'),
(21, 'config_email_signatures', '<p>Chữ ký nè má</p>', NULL, '2019-06-11 18:29:33'),
(22, 'config_script_header', 'sdadasdasdasd', NULL, '2019-06-11 18:48:36'),
(23, 'config_script_body', 'dsadasdsadasd', NULL, '2019-06-11 18:48:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `many_category_items`
--

CREATE TABLE `many_category_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2019_06_05_021717_create_product_attributes_table', 2),
(7, '2019_06_05_024611_create_attribute_value_table', 2),
(8, '2019_06_05_024702_create_attributes_table', 2),
(9, '2019_06_05_025743_create_promotions_table', 2),
(10, '2019_06_05_025929_create_promotion_prices_table', 2),
(11, '2019_06_05_033843_create_promotion_contents_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'u9VsMZpE0kTsWO3oxv3zimWAMmkCSh6XhyRiSF1d', 'http://localhost', 1, 0, 0, '2019-06-02 19:44:11', '2019-06-02 19:44:11'),
(2, NULL, 'Laravel Password Grant Client', 'Td892jMa4KphnlQliAvvEeU36K24hv7KTavQByxs', 'http://localhost', 0, 1, 0, '2019-06-02 19:44:11', '2019-06-02 19:44:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-06-02 19:44:11', '2019-06-02 19:44:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_primary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_sub_list` longtext COLLATE utf8mb4_unicode_ci,
  `post_type` tinyint(4) NOT NULL DEFAULT '0',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `seo_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_on_hand` smallint(5) UNSIGNED DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_primary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_sub_list` longtext COLLATE utf8mb4_unicode_ci,
  `is_hot` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `has_promotion` tinyint(4) UNSIGNED DEFAULT NULL,
  `seo_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_value_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

CREATE TABLE `promotions` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `promotion_price_id` int(10) UNSIGNED DEFAULT NULL,
  `promotion_content_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion_contents`
--

CREATE TABLE `promotion_contents` (
  `id` int(10) UNSIGNED NOT NULL,
  `descritption` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion_prices`
--

CREATE TABLE `promotion_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale` tinyint(4) NOT NULL,
  `final_price` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `seos`
--

CREATE TABLE `seos` (
  `id` int(10) UNSIGNED NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keyword` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `seos`
--

INSERT INTO `seos` (`id`, `seo_title`, `seo_description`, `seo_keyword`, `seo_image`, `created_at`, `updated_at`) VALUES
(1, 'quang', 'asdasd', 'tstla', 'http://localhost:8080/omg/images/upload/origins/image-81.png', '2019-06-02 01:31:17', '2019-06-02 01:31:17'),
(2, 'quang', 'asdasd', 'tstla', 'http://localhost:8080/omg/images/upload/origins/image-81.png', '2019-06-02 01:32:34', '2019-06-02 01:32:34'),
(3, 'asdxxxcc', 'asdxxxx', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:34:41', '2019-06-02 01:34:41'),
(4, 'asdasxxcv', 'dasdasdasdasdasd', 'cccccc', 'http://localhost:8080/omg/images/upload/origins/image-81.png', '2019-06-02 01:36:59', '2019-06-02 01:36:59'),
(5, 'asdasxxcv', 'dasdasdasdasdasd', 'cccccc', 'http://localhost:8080/omg/images/upload/origins/image-81.png', '2019-06-02 01:37:16', '2019-06-02 01:37:16'),
(6, 'asdsagg', 'dasd', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:39:52', '2019-06-02 01:39:52'),
(7, 'asdsghjkk;l\';', 'g', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:40:47', '2019-06-02 01:40:47'),
(8, 'asdasm ,./?', 'dasdasda', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:43:06', '2019-06-02 01:43:06'),
(9, 'sadas57457', 'dasddd', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:46:20', '2019-06-02 01:46:20'),
(10, 'dflllll', 'zcxzxczxc', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:52:05', '2019-06-02 01:52:05'),
(11, 'quang', 'dsadasdasd', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:54:59', '2019-06-02 01:54:59'),
(12, 'Đây là tiêu đề', 'mô tả ngắn về bài viết', 'từ khóa cần SEO nè', 'images/upload/origins/capture.png', '2019-06-02 02:18:48', '2019-06-02 21:28:06'),
(13, 'Tiêu đề tại công ty updated', 'Mô tả ngắn SEO tại công ty updadte', 'từ khóa seo tại công ty updated', 'images/upload/origins/capture.png', '2019-06-02 20:51:35', '2019-06-02 21:29:22'),
(18, 'ccc', 'adasdasdda', 'fasdad', 'images/upload/origins/capture.png', '2019-06-10 20:50:46', '2019-06-10 20:50:46'),
(19, 'Bài Viết Mới đã cập nhật', 'đây là bài viết mô tả', 'từ khóa seo nè pa', 'images/upload/origins/image-81.png', '2019-06-11 19:16:27', '2019-06-11 19:16:44'),
(20, 'Đây là sản phẩm mới', 'mô tả ngắn về sản phẩm nè pa', 'seo thì seo', 'images/upload/origins/capture.png', '2019-06-11 19:17:26', '2019-06-11 19:17:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'profile.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `type`, `bio`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Quang Nguyen', 'nnduyquang@gmail.com', '$2y$10$ib1t864vWVMu5et8xCJ20./MPSab4D1tQkQWfXVoZBZ/119OZdu9K', 'user', NULL, 'profile.png', 'lmdr7H7rqibHVbpEYjwL6ODEzY6gCKYXZPStUyZrrwjSY3cFCoH579Mnks49', '2019-05-08 19:37:03', '2019-05-08 19:37:03'),
(2, 'Thư Nguyễn 2', 'thunguyen@gmail.com', '$2y$10$/wAAE93VmqaZIkMy8mc8XegKmz0P6LPAAsuqbkX68Y/aW/dzg.pyq', 'user', NULL, 'profile.png', NULL, '2019-05-08 21:18:31', '2019-06-11 19:18:42');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `many_category_items`
--
ALTER TABLE `many_category_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Chỉ mục cho bảng `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `promotion_contents`
--
ALTER TABLE `promotion_contents`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `promotion_prices`
--
ALTER TABLE `promotion_prices`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `many_category_items`
--
ALTER TABLE `many_category_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `promotion_contents`
--
ALTER TABLE `promotion_contents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `promotion_prices`
--
ALTER TABLE `promotion_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `seos`
--
ALTER TABLE `seos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
