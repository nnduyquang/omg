-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2019 at 01:29 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omg`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
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
-- Dumping data for table `categories`
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
-- Table structure for table `configs`
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
-- Table structure for table `many_category_items`
--

CREATE TABLE `many_category_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `many_category_items`
--

INSERT INTO `many_category_items` (`id`, `category_id`, `item_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 0, '2019-06-02 01:31:17', '2019-06-02 01:31:17'),
(2, 5, 2, 0, '2019-06-02 01:32:34', '2019-06-02 01:32:34'),
(3, 1, 3, 0, '2019-06-02 01:34:41', '2019-06-02 01:34:41'),
(4, 6, 3, 0, '2019-06-02 01:34:41', '2019-06-02 01:34:41'),
(5, 5, 4, 0, '2019-06-02 01:37:16', '2019-06-02 01:37:16'),
(6, 1, 4, 0, '2019-06-02 01:37:16', '2019-06-02 01:37:16'),
(7, 6, 5, 0, '2019-06-02 01:39:52', '2019-06-02 01:39:52'),
(8, 5, 6, 0, '2019-06-02 01:40:47', '2019-06-02 01:40:47'),
(9, 5, 7, 0, '2019-06-02 01:43:06', '2019-06-02 01:43:06'),
(10, 6, 8, 0, '2019-06-02 01:46:20', '2019-06-02 01:46:20'),
(11, 5, 9, 0, '2019-06-02 01:52:05', '2019-06-02 01:52:05'),
(12, 5, 10, 0, '2019-06-02 01:54:59', '2019-06-02 01:54:59'),
(13, 5, 11, 0, '2019-06-02 02:18:48', '2019-06-02 02:18:48'),
(14, 6, 11, 0, '2019-06-02 02:18:48', '2019-06-02 02:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
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
-- Table structure for table `oauth_auth_codes`
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
-- Table structure for table `oauth_clients`
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
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'SZq9p1z301ojckKOoUJr53wZXnvni01To8SUtMQd', 'http://localhost', 1, 0, 0, '2019-05-31 23:41:25', '2019-05-31 23:41:25'),
(2, NULL, 'Laravel Password Grant Client', 'e2ph7xwlR51IAurhCZIa6nQyGzjVaBtWn65Z8XDr', 'http://localhost', 0, 1, 0, '2019-05-31 23:41:25', '2019-05-31 23:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-05-31 23:41:25', '2019-05-31 23:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
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

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `description`, `content`, `img_primary`, `img_sub_list`, `post_type`, `is_hot`, `is_active`, `seo_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'asdasd', 'asdasd', 'asdasd', '<p>dasdadasdasd</p>', 'images/upload/origins/image-81.png', NULL, 0, 0, 0, 1, 1, '2019-06-02 01:31:17', '2019-06-02 01:31:17'),
(2, 'asdasd', 'asdasd111', 'asdasd', '<p>dasdadasdasd</p>', 'images/upload/origins/image-81.png', NULL, 0, 0, 0, 2, 1, '2019-06-02 01:32:34', '2019-06-02 01:32:34'),
(3, 'asdxxxcc', 'asdxxxcc', 'asdxxxx', '<p>asdasddasd</p>', 'images/upload/origins/capture.png', NULL, 0, 0, 1, 3, 1, '2019-06-02 01:34:41', '2019-06-02 01:34:41'),
(4, 'asdasxxcv', 'asdasxxcv', 'dasdasdasdasdasd', '<p>sadasdxcxzczxc</p>', 'images/upload/origins/image-81.png', NULL, 0, 0, 1, 5, 1, '2019-06-02 01:37:16', '2019-06-02 01:37:16'),
(5, 'asdsagg', 'asdsagg', 'dasd', '<p>vvnnm,</p>', 'images/upload/origins/capture.png', NULL, 0, 0, 1, 6, 1, '2019-06-02 01:39:52', '2019-06-02 01:39:52'),
(6, 'asdsghjkk;l'';', 'asdsghjkkl', 'g', '<p>sdsadasdx</p>', 'images/upload/origins/capture.png', NULL, 0, 0, 0, 7, 1, '2019-06-02 01:40:47', '2019-06-02 01:40:47'),
(7, 'asdasm ,./?', 'asdasm', 'dasdasda', '<p>zxczxc</p>', 'images/upload/origins/capture.png', NULL, 0, 0, 1, 8, 1, '2019-06-02 01:43:06', '2019-06-02 01:43:06'),
(8, 'sadas57457', 'sadas57457', 'dasddd', '<p>xczxczxc</p>', 'images/upload/origins/capture.png', NULL, 0, 0, 1, 9, 1, '2019-06-02 01:46:20', '2019-06-02 01:46:20'),
(9, 'dflllll', 'dflllll', 'zcxzxczxc', '<p>zxc&nbsp;</p>', 'images/upload/origins/capture.png', NULL, 0, 0, 1, 10, 1, '2019-06-02 01:52:05', '2019-06-02 01:52:05'),
(10, 'quang', 'quang', 'dsadasdasd', '<p>asdasdasdasd</p>', 'images/upload/origins/capture.png', NULL, 0, 0, 1, 11, 1, '2019-06-02 01:54:59', '2019-06-02 01:54:59'),
(11, 'Đây là tiêu đề', 'day-la-tieu-de', 'mô tả ngắn về bài viết', '<p>đây là nội dung</p>', 'images/upload/origins/capture.png', NULL, 0, 0, 1, 12, 1, '2019-06-02 02:18:48', '2019-06-02 02:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
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
-- Table structure for table `seos`
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
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `seo_title`, `seo_description`, `seo_keyword`, `seo_image`, `created_at`, `updated_at`) VALUES
(1, 'quang', 'asdasd', 'tstla', 'http://localhost:8080/omg/images/upload/origins/image-81.png', '2019-06-02 01:31:17', '2019-06-02 01:31:17'),
(2, 'quang', 'asdasd', 'tstla', 'http://localhost:8080/omg/images/upload/origins/image-81.png', '2019-06-02 01:32:34', '2019-06-02 01:32:34'),
(3, 'asdxxxcc', 'asdxxxx', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:34:41', '2019-06-02 01:34:41'),
(4, 'asdasxxcv', 'dasdasdasdasdasd', 'cccccc', 'http://localhost:8080/omg/images/upload/origins/image-81.png', '2019-06-02 01:36:59', '2019-06-02 01:36:59'),
(5, 'asdasxxcv', 'dasdasdasdasdasd', 'cccccc', 'http://localhost:8080/omg/images/upload/origins/image-81.png', '2019-06-02 01:37:16', '2019-06-02 01:37:16'),
(6, 'asdsagg', 'dasd', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:39:52', '2019-06-02 01:39:52'),
(7, 'asdsghjkk;l'';', 'g', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:40:47', '2019-06-02 01:40:47'),
(8, 'asdasm ,./?', 'dasdasda', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:43:06', '2019-06-02 01:43:06'),
(9, 'sadas57457', 'dasddd', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:46:20', '2019-06-02 01:46:20'),
(10, 'dflllll', 'zcxzxczxc', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:52:05', '2019-06-02 01:52:05'),
(11, 'quang', 'dsadasdasd', NULL, 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 01:54:59', '2019-06-02 01:54:59'),
(12, 'Đây là tiêu đề', 'mô tả ngắn về bài viết', 'từ khóa cần SEO nè', 'http://localhost:8080/omg/images/upload/origins/capture.png', '2019-06-02 02:18:48', '2019-06-02 02:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `type`, `bio`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Quang Nguyen', 'nnduyquang@gmail.com', '$2y$10$ib1t864vWVMu5et8xCJ20./MPSab4D1tQkQWfXVoZBZ/119OZdu9K', 'user', NULL, 'profile.png', 'lmdr7H7rqibHVbpEYjwL6ODEzY6gCKYXZPStUyZrrwjSY3cFCoH579Mnks49', '2019-05-08 19:37:03', '2019-05-08 19:37:03'),
(2, 'Thư Nguyễn', 'thunguyen@gmail.com', '$2y$10$/wAAE93VmqaZIkMy8mc8XegKmz0P6LPAAsuqbkX68Y/aW/dzg.pyq', 'user', NULL, 'profile.png', NULL, '2019-05-08 21:18:31', '2019-05-08 21:18:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `many_category_items`
--
ALTER TABLE `many_category_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `many_category_items`
--
ALTER TABLE `many_category_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
