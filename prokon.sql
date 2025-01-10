-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2024 at 01:54 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prokon`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_05_07_123314_create_users_table', 1),
(3, '2024_05_26_160724_create_rewards_table', 1),
(4, '2024_05_26_221540_create_reward_requests_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `name`, `points`, `created_at`, `updated_at`) VALUES
(1, 'Kecap Manis', 6, '2024-06-07 04:18:31', '2024-06-07 04:18:31'),
(2, 'Susu UHT 1L', 12, '2024-06-07 04:18:31', '2024-06-07 04:18:31'),
(3, 'Gula 1Kg', 15, '2024-06-07 04:18:31', '2024-06-07 04:18:31'),
(4, 'Minyak Goreng 1.5L', 20, '2024-06-07 04:18:31', '2024-06-07 04:18:31'),
(5, 'Beras 5Kg', 30, '2024-06-07 04:18:31', '2024-06-07 04:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `reward_requests`
--

CREATE TABLE `reward_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_tlp` varchar(20) NOT NULL,
  `reward_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_requests`
--

INSERT INTO `reward_requests` (`id`, `user_id`, `user_tlp`, `reward_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1204, '0838', 1, 'rejected', '2024-06-07 12:13:16', '2024-06-08 08:05:16'),
(2, 1204, '0838', 3, 'approved', '2024-06-08 08:11:59', '2024-06-08 08:12:46'),
(3, 1204, '0838', 5, 'pending', '2024-06-12 00:50:10', '2024-06-12 00:50:10'),
(4, 1050, '0878654790', 2, 'pending', '2024-06-12 09:37:24', '2024-06-12 09:37:24'),
(5, 1050, '0878654790', 5, 'approved', '2024-06-12 09:37:41', '2024-06-12 09:39:25'),
(6, 1050, '0878654790', 3, 'pending', '2024-06-12 09:38:08', '2024-06-12 09:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sensor`
--

CREATE TABLE `tb_sensor` (
  `id` int(11) NOT NULL,
  `kodemember` int(11) NOT NULL,
  `suhu` decimal(10,2) NOT NULL,
  `warna` text NOT NULL,
  `tds` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_sensor`
--

INSERT INTO `tb_sensor` (`id`, `kodemember`, `suhu`, `warna`, `tds`, `created_at`, `updated_at`) VALUES
(1, 1050, 4381.70, 'PUTIH', 0.00, '2024-06-07 04:25:16', '2024-06-12 10:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `tlp` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT 'default.png',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `ml` int(11) NOT NULL DEFAULT 0,
  `warna` varchar(255) DEFAULT NULL,
  `tds` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `tlp`, `password`, `foto`, `is_admin`, `points`, `ml`, `warna`, `tds`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admineos123@gmail.com', '2024-06-07 04:18:30', '1234567890', '$2y$10$loM2q4JdAc.K7XsjecGKH.VEliidZvh.0f2daMhnDIZqynjEfYAfq', 'default.png', 1, 0.00, 0, NULL, 0, NULL, '2024-06-07 04:18:30', '2024-06-07 04:18:30'),
(1050, 'Kimi', 'kimi@gmail.com', NULL, '0878654790', '$2y$10$wUEMXx35rTU8Zpzr1hL8rOgyhvIDF1JcL3za17c2OI9vXh2QIS4W2', '20240612_100.jpg', 0, 1347.19, 1755270, 'PUTIH', 0, NULL, '2024-06-12 09:21:28', '2024-06-12 10:25:43'),
(1135, 'Arya', 'arya@gmail.com', NULL, '098', '$2y$10$4Ccmg/UcRYQOretJuJRk0eALNmmufdEysYez8lx9IkmoJGYFfg7fy', '20240612_100.jpg', 0, 0.00, 0, NULL, 0, NULL, '2024-06-12 09:20:12', '2024-06-12 09:20:12'),
(1197, 'nacantik', 'nacantik@gmail.com', NULL, '0888', '$2y$10$T.omRlpFRKtMIX.L7JqQ7uvMjFkb1HocRLg3ukm0y8ILzDsZwmObO', '20240608_Pekan 2.png', 0, 1720.89, 2151301, 'PUTIH', 2092, NULL, '2024-06-08 10:12:46', '2024-06-11 10:00:18'),
(1204, 'Yalqa', 'yalqaazko@gmail.com', NULL, '0838', '$2y$10$K2r4rwVZMKi0kYz1jjjOUu9Y.naSXFACqEuIJwLTMQVjDdBurHlxW', '20240607_IMG_20220913_221941.jpg', 0, 3837.10, 4842593, 'PUTIH', 63, NULL, '2024-06-07 09:10:16', '2024-06-12 09:03:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_requests`
--
ALTER TABLE `reward_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reward_requests_user_id_foreign` (`user_id`),
  ADD KEY `reward_requests_reward_id_foreign` (`reward_id`);

--
-- Indexes for table `tb_sensor`
--
ALTER TABLE `tb_sensor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_unique` (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reward_requests`
--
ALTER TABLE `reward_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_sensor`
--
ALTER TABLE `tb_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reward_requests`
--
ALTER TABLE `reward_requests`
  ADD CONSTRAINT `reward_requests_reward_id_foreign` FOREIGN KEY (`reward_id`) REFERENCES `rewards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reward_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
