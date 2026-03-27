-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2026 at 07:35 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce_shopp_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','completed','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'completed', NULL, '2026-02-02 19:11:45'),
(9, 1, 'canceled', '2026-01-29 15:26:39', '2026-02-06 21:03:47'),
(12, 1, 'completed', '2026-02-04 12:08:10', '2026-02-05 15:14:14'),
(13, 1, 'completed', '2026-02-04 12:27:44', '2026-02-18 14:49:16'),
(14, 1, 'completed', '2026-02-05 15:19:53', '2026-02-06 19:52:48'),
(15, 1, 'completed', '2026-02-18 14:57:54', '2026-02-18 23:23:03'),
(16, 1, 'completed', '2026-02-19 01:14:36', '2026-02-19 01:27:13'),
(17, 1, 'completed', '2026-02-19 01:28:52', '2026-02-19 01:28:58'),
(18, 1, 'completed', '2026-02-19 01:31:15', '2026-02-19 01:31:27'),
(19, 1, 'completed', '2026-02-24 17:00:29', '2026-02-24 17:00:47'),
(20, 1, 'completed', '2026-03-02 13:19:39', '2026-03-02 13:19:49'),
(21, 1, 'active', '2026-03-02 13:32:48', '2026-03-02 13:46:27'),
(22, 3, 'completed', '2026-03-03 20:38:46', '2026-03-03 20:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_product`
--

INSERT INTO `cart_product` (`id`, `cart_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(8, 1, 15, 1, '2026-01-30 07:47:39', '2026-01-30 07:47:39'),
(9, 1, 19, 4, '2026-01-30 07:48:37', '2026-01-30 07:48:37'),
(10, 1, 18, 5, '2026-01-30 16:51:11', '2026-01-30 16:51:11'),
(11, 1, 26, 1, '2026-01-30 17:34:39', '2026-01-30 17:34:39'),
(12, 1, 20, 1, '2026-01-30 19:44:37', '2026-01-30 19:44:37'),
(19, 12, 14, 1, '2026-02-04 12:08:10', '2026-02-04 12:08:10'),
(21, 13, 15, 2, '2026-02-04 12:27:56', '2026-02-04 12:27:56'),
(22, 13, 16, 2, '2026-02-04 12:28:16', '2026-02-04 12:28:16'),
(23, 14, 14, 5, '2026-02-05 15:19:53', '2026-02-06 19:49:14'),
(24, 14, 15, 1, '2026-02-05 15:20:01', '2026-02-05 15:20:01'),
(25, 14, 16, 1, '2026-02-05 15:20:07', '2026-02-05 15:20:07'),
(26, 14, 17, 4, '2026-02-05 15:20:14', '2026-02-05 15:20:14'),
(27, 15, 15, 2, '2026-02-18 15:28:24', '2026-02-18 15:28:24'),
(28, 15, 14, 3, '2026-02-18 15:28:58', '2026-02-18 15:28:58'),
(29, 15, 21, 4, '2026-02-18 15:42:41', '2026-02-18 15:42:41'),
(30, 15, 16, 3, '2026-02-18 15:44:58', '2026-02-18 15:44:58'),
(31, 15, 24, 1, '2026-02-18 15:47:36', '2026-02-18 15:47:36'),
(32, 16, 14, 1, '2026-02-19 01:14:36', '2026-02-19 01:14:36'),
(33, 16, 15, 5, '2026-02-19 01:15:11', '2026-02-19 01:15:11'),
(34, 16, 16, 5, '2026-02-19 01:15:17', '2026-02-19 01:15:17'),
(35, 16, 17, 4, '2026-02-19 01:25:45', '2026-02-19 01:26:59'),
(37, 17, 15, 4, '2026-02-19 01:28:52', '2026-02-19 01:28:52'),
(38, 18, 26, 4, '2026-02-19 01:31:15', '2026-02-19 01:31:24'),
(39, 19, 15, 25, '2026-02-24 17:00:29', '2026-02-24 17:00:29'),
(40, 20, 15, 6, '2026-03-02 13:19:39', '2026-03-02 13:19:39'),
(41, 21, 14, 6, '2026-03-02 13:32:48', '2026-03-02 13:32:48'),
(42, 22, 16, 1, '2026-03-03 20:38:46', '2026-03-03 20:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Fruits', '2026-01-28 22:09:11', '2026-01-28 22:09:11'),
(2, 'Vegetables', '2026-01-28 22:09:11', '2026-01-28 22:09:11'),
(3, 'Herbs', '2026-01-28 22:09:11', '2026-01-28 22:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `town`, `zip`, `created_at`, `updated_at`) VALUES
(1, 'Belgrade', '11000', '2026-02-05 08:40:56', '2026-02-05 08:40:56'),
(2, 'Novi Sad', '21000', '2026-02-05 08:40:56', '2026-02-05 08:40:56'),
(3, 'Valjevo', '14000', '2026-02-05 08:40:56', '2026-02-05 08:40:56'),
(4, 'Nis', '18000', '2026-02-05 08:40:56', '2026-02-05 08:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_01_26_113800_create_carts_table', 1),
(6, '2026_01_26_113850_create_category_table', 1),
(7, '2026_01_26_113858_create_products_table', 1),
(8, '2026_01_26_113875_create_cart_product_table', 1),
(9, '2026_01_26_120010_create_orders', 1),
(10, '2026_01_26_120018_create_order_product', 1),
(11, '2026_01_29_200940_add_cart_status_cart_table', 2),
(12, '2026_02_26_110035_create_city_table', 3),
(13, '2026_03_03_214518_create_jobs_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('recieved','sent','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'recieved',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `address`, `city_id`, `total_price`, `status`, `user_id`, `cart_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 0.00, 'canceled', 1, 14, '2026-02-06 19:52:48', '2026-02-06 20:48:10'),
(4, 'Vojvode Stepe 109', 1, 477.00, 'sent', 1, 15, '2026-02-18 23:23:03', '2026-02-19 01:12:56'),
(5, 'Vojvode Stepe 109', 2, 530.00, 'sent', 1, 16, '2026-02-19 01:27:13', '2026-02-19 01:27:24'),
(6, 'Vojvode Stepe 109', 3, 192.00, 'sent', 1, 17, '2026-02-19 01:28:58', '2026-02-19 01:29:05'),
(7, 'Vojvode Stepe 109', 1, 60.00, 'sent', 1, 18, '2026-02-19 01:31:27', '2026-02-24 12:43:35'),
(8, 'Vojvode Stepe 109', 4, 60.00, 'sent', 1, 18, '2026-02-19 01:31:33', '2026-02-19 01:31:47'),
(9, 'Vojvode Stepe 109', 1, 1200.00, 'sent', 1, 19, '2026-02-24 17:00:47', '2026-02-24 17:06:27'),
(10, 'Vojvode Stepe 109', 1, 288.00, 'sent', 1, 20, '2026-03-02 13:19:49', '2026-03-02 13:29:18'),
(11, 'Vojvode Stepe 109', 1, 15.00, 'sent', 3, 22, '2026-03-03 20:38:52', '2026-03-03 20:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(5, 4, 15, 2, 48, '2026-02-18 23:23:03', '2026-02-18 23:23:03'),
(6, 4, 14, 3, 43, '2026-02-18 23:23:03', '2026-02-18 23:23:03'),
(7, 4, 21, 4, 48, '2026-02-18 23:23:03', '2026-02-18 23:23:03'),
(8, 4, 16, 3, 15, '2026-02-18 23:23:03', '2026-02-18 23:23:03'),
(9, 4, 24, 1, 15, '2026-02-18 23:23:03', '2026-02-18 23:23:03'),
(10, 5, 14, 1, 43, '2026-02-19 01:27:13', '2026-02-19 01:27:13'),
(11, 5, 15, 5, 48, '2026-02-19 01:27:13', '2026-02-19 01:27:13'),
(12, 5, 16, 5, 15, '2026-02-19 01:27:13', '2026-02-19 01:27:13'),
(13, 5, 17, 4, 43, '2026-02-19 01:27:13', '2026-02-19 01:27:13'),
(14, 6, 15, 4, 48, '2026-02-19 01:28:58', '2026-02-19 01:28:58'),
(15, 7, 26, 4, 15, '2026-02-19 01:31:27', '2026-02-19 01:31:27'),
(16, 8, 26, 4, 15, '2026-02-19 01:31:33', '2026-02-19 01:31:33'),
(17, 9, 15, 25, 48, '2026-02-24 17:00:47', '2026-02-24 17:00:47'),
(18, 10, 15, 6, 48, '2026-03-02 13:19:49', '2026-03-02 13:19:49'),
(19, 11, 16, 1, 15, '2026-03-03 20:38:52', '2026-03-03 20:38:52');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `stock_quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `category_id`, `stock_quantity`, `created_at`, `updated_at`) VALUES
(14, 'Chilli', '', 'chilli.jpg', 43.00, 2, 41, '2026-01-28 22:09:14', '2026-02-19 01:27:24'),
(15, 'Green apple', '', 'gApple.jpg', 48.00, 1, 3, '2026-01-28 22:09:14', '2026-03-02 13:29:18'),
(16, 'Garlic', '', 'garlic.jpg', 15.00, 2, 36, '2026-01-28 22:09:14', '2026-03-03 20:38:58'),
(17, 'Lemon', '', 'lemon.jpg', 43.00, 1, 41, '2026-01-28 22:09:14', '2026-02-19 01:27:24'),
(18, 'Manngo', '', 'manngo.jpg', 48.00, 1, 45, '2026-01-28 22:09:14', '2026-01-28 22:09:14'),
(19, 'Melon', '', 'melon.jpg', 15.00, 2, 45, '2026-01-28 22:09:14', '2026-01-28 22:09:14'),
(20, 'Mint', '', 'mint.jpg', 43.00, 3, 45, '2026-01-28 22:09:14', '2026-01-28 22:09:14'),
(21, 'Orange', '', 'orange.jpg', 48.00, 1, 41, '2026-01-28 22:09:14', '2026-02-19 01:12:56'),
(22, 'Papaya', '', 'papaya.jpg', 15.00, 1, 45, '2026-01-28 22:09:14', '2026-01-28 22:09:14'),
(23, 'Pom', '', 'pom.jpg', 48.00, 1, 45, '2026-01-28 22:09:14', '2026-01-28 22:09:14'),
(24, 'Onions', '', 'raw-onions.jpg', 15.00, 2, 44, '2026-01-28 22:09:14', '2026-02-19 01:12:56'),
(25, 'Red Apple', '', 'red-apple.jpg', 48.00, 1, 45, '2026-01-28 22:09:14', '2026-01-28 22:09:14'),
(26, 'Strawbery', '', 'strawnb.jpg', 15.00, 1, 37, '2026-01-28 22:09:14', '2026-02-24 12:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john@gmail.com', NULL, '$2y$10$HyDwpNoTV/IzNvkQ7H0PsuT9vvBPwKRiRhYxoP99RKptRLp4GshNS', NULL, '2026-01-28 22:20:38', '2026-01-28 22:20:38'),
(2, 'Marta Kush', 'kush@gmail.com', NULL, '$2y$10$mwmc9eJ5mq.6L/eGAdF9x.dOisRdH8ZrM85O0K8BXMtbiN6Ks0jhW', NULL, '2026-02-13 15:09:57', '2026-02-13 15:09:57'),
(3, 'admin', 'admin@gmail.com', NULL, '$2y$10$uLGkoLVrZcd77ryxdlIGh.4K41NyCCAGpzeZSOp3JHs5rizRGhAAe', NULL, '2026-03-03 18:42:17', '2026-03-03 18:42:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_product_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_product_order_id_product_id_unique` (`order_id`,`product_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `cart_product_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
