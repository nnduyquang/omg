-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 29, 2019 lúc 10:38 AM
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
(6, 'tinh te 7', 'tinh-te-7', NULL, NULL, NULL, NULL, 0, 1, 2, 1, 0, 1, '2019-05-12 07:59:28', '2019-05-27 23:44:29'),
(7, 'tinh te 8', 'tinh-te-8', NULL, NULL, NULL, NULL, 0, 2, NULL, 0, 0, 1, '2019-05-12 08:00:06', '2019-05-27 23:44:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configs`
--

CREATE TABLE `configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `final_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_primary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_sub_list` longtext COLLATE utf8mb4_unicode_ci,
  `is_hot` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `seo_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
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
  `seo_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Quang Nguyen', 'nnduyquang@gmail.com', '$2y$10$ib1t864vWVMu5et8xCJ20./MPSab4D1tQkQWfXVoZBZ/119OZdu9K', 'user', NULL, 'profile.png', 'CrVVAEWgJuxeMkcpLzcvjMF14YjxfLZihnmeMUM1dLVtIrwJlHg6rU24op4Z', '2019-05-08 19:37:03', '2019-05-08 19:37:03'),
(2, 'Thư Nguyễn', 'thunguyen@gmail.com', '$2y$10$/wAAE93VmqaZIkMy8mc8XegKmz0P6LPAAsuqbkX68Y/aW/dzg.pyq', 'user', NULL, 'profile.png', NULL, '2019-05-08 21:18:31', '2019-05-08 21:18:31');

--
-- Chỉ mục cho các bảng đã đổ
--

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
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `many_category_items`
--
ALTER TABLE `many_category_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT cho bảng `seos`
--
ALTER TABLE `seos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
