-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2024 at 08:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wistacademy`
--
CREATE DATABASE IF NOT EXISTS `wistacademy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wistacademy`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'كورس', 'كورس ', '2024-07-27 03:36:05', '2024-07-27 03:36:05'),
(2, 'مخيم ', 'مخيم', '2024-07-27 03:36:28', '2024-07-27 03:36:28'),
(3, 'ورشة', 'ورشة', '2024-07-27 03:36:45', '2024-07-27 03:36:45'),
(4, 'ندوة', 'ندوة', '2024-07-27 03:37:09', '2024-07-27 03:37:09'),
(5, 'امسية', 'امسية', '2024-07-27 03:37:24', '2024-07-27 03:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `educational_programs`
--

CREATE TABLE `educational_programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `trainer_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `hours` int(11) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `status` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educational_programs`
--

INSERT INTO `educational_programs` (`id`, `name`, `subject_id`, `category_id`, `trainer_id`, `description`, `price`, `start_time`, `end_time`, `start_date`, `end_date`, `hours`, `available`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'كورس Laravel', 1, 1, 1, 'كورس Laravel', 5000, '09:00:00', '10:30:00', '2024-07-28', '2024-07-31', 20, 1, 'Will Start Soon', NULL, '2024-07-27 03:42:43', '2024-07-27 03:42:43'),
(2, 'Html ندوة', 2, 4, 4, 'ندوة Html', 1000, '11:00:00', '12:00:00', '2024-07-28', '2024-07-28', 1, 1, 'Running Now', NULL, '2024-07-27 03:44:23', '2024-07-27 03:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_07_22_085802_create_sessions_table', 1),
(7, '2024_07_22_190217_create_subjects_table', 1),
(8, '2024_07_22_190327_create_categories_table', 1),
(9, '2024_07_22_190509_create_educational_programs_table', 1),
(10, '2024_07_22_190545_create_student_programs_table', 1),
(14, '2024_07_23_205505_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_category', 'web', '2024-07-23 18:13:02', '2024-07-23 18:13:02'),
(2, 'view_any_category', 'web', '2024-07-23 18:13:02', '2024-07-23 18:13:02'),
(3, 'create_category', 'web', '2024-07-23 18:13:02', '2024-07-23 18:13:02'),
(4, 'update_category', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(5, 'restore_category', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(6, 'restore_any_category', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(7, 'replicate_category', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(8, 'reorder_category', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(9, 'delete_category', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(10, 'delete_any_category', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(11, 'force_delete_category', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(12, 'force_delete_any_category', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(13, 'view_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(14, 'view_any_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(15, 'create_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(16, 'update_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(17, 'restore_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(18, 'restore_any_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(19, 'replicate_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(20, 'reorder_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(21, 'delete_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(22, 'delete_any_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(23, 'force_delete_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(24, 'force_delete_any_educational::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(25, 'view_role', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(26, 'view_any_role', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(27, 'create_role', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(28, 'update_role', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(29, 'delete_role', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(30, 'delete_any_role', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(31, 'view_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(32, 'view_any_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(33, 'create_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(34, 'update_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(35, 'restore_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(36, 'restore_any_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(37, 'replicate_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(38, 'reorder_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(39, 'delete_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(40, 'delete_any_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(41, 'force_delete_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(42, 'force_delete_any_student::program', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(43, 'view_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(44, 'view_any_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(45, 'create_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(46, 'update_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(47, 'restore_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(48, 'restore_any_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(49, 'replicate_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(50, 'reorder_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(51, 'delete_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(52, 'delete_any_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(53, 'force_delete_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(54, 'force_delete_any_subject', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(55, 'view_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(56, 'view_any_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(57, 'create_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(58, 'update_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(59, 'restore_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(60, 'restore_any_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(61, 'replicate_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(62, 'reorder_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(63, 'delete_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(64, 'delete_any_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(65, 'force_delete_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(66, 'force_delete_any_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(67, 'widget_StatsOverview', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(2, 'panel_user', 'web', '2024-07-23 18:13:03', '2024-07-23 18:13:03'),
(3, 'trainer', 'web', '2024-07-23 18:24:00', '2024-07-23 18:25:34'),
(4, 'manager', 'web', '2024-07-23 18:25:17', '2024-07-23 18:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 1),
(15, 4),
(16, 1),
(16, 4),
(17, 1),
(17, 4),
(18, 1),
(18, 4),
(19, 1),
(19, 4),
(20, 1),
(20, 4),
(21, 1),
(21, 4),
(22, 1),
(22, 4),
(23, 1),
(23, 4),
(24, 1),
(24, 4),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(31, 4),
(32, 1),
(32, 4),
(33, 1),
(33, 4),
(34, 1),
(34, 4),
(35, 1),
(35, 4),
(36, 1),
(36, 4),
(37, 1),
(37, 4),
(38, 1),
(38, 4),
(39, 1),
(39, 4),
(40, 1),
(40, 4),
(41, 1),
(41, 4),
(42, 1),
(42, 4),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(67, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('oIaxq1BpZllXSrNcv1quHY6eiZW3OUEq1y7fFZbU', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZnhuQW1yMTNVbWpRUm8wS1dsM2k4QnpKbmxXSzVFSXI5NFRmZ3NQaCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvd2lzdERhc2hib2FyZC9zaGllbGQvcm9sZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkaTg0RGJSOTRseEwzZS5YR2Fnb2lHT1B1MXU2ZW56Nml2aWQ2ci9VM2lEY2FCM0NGdVNkZWkiO3M6ODoiZmlsYW1lbnQiO2E6MDp7fX0=', 1722062844);

-- --------------------------------------------------------

--
-- Table structure for table `student_programs`
--

CREATE TABLE `student_programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_programs`
--

INSERT INTO `student_programs` (`id`, `student_id`, `program_id`, `status`, `score`, `grade`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Studying Now', NULL, NULL, NULL, '2024-07-27 03:44:53', '2024-07-27 03:45:51'),
(2, 3, 1, 'Program Completed', 85.00, 'Very Good', NULL, '2024-07-27 03:45:19', '2024-07-27 03:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Laravel', 'PHP Laravel', '2024-07-27 03:38:02', '2024-07-27 03:38:02'),
(2, 'HTML', 'HTML', '2024-07-27 03:38:13', '2024-07-27 03:38:13'),
(3, 'CSS', 'CSS', '2024-07-27 03:38:23', '2024-07-27 03:38:23'),
(4, 'JavaScript', 'JavaScript', '2024-07-27 03:38:35', '2024-07-27 03:38:35'),
(5, 'ASP.net', 'C# ASP.net', '2024-07-27 03:38:55', '2024-07-27 03:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `mobile`, `gender`, `status`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Mutaz', 'Asem', 'mu@gmail.com', 774743134, 'Male', 1, '2024-07-23 17:10:11', '$2y$10$i84DbR94lxL3e.XGagoiGOPu1u6enz6ivid6r/U3iDcaB3CFuSdei', NULL, NULL, NULL, NULL, NULL, 'profile-photos/nZPgHoFbd7Rqjh5gBObfgIowDJAuYhhsabb0dHjs.jpg', '2024-07-23 17:00:20', '2024-07-23 18:28:28'),
(2, 'Asem', 'Ali', 'asem@gmail.com', 772247667, 'Male', 1, '2024-07-23 17:31:57', '$2y$10$4ZbEChhsv0zU03Xht4mgSukhGmm9zWX/AvfwjI2s2ZO5a3kwBWYGW', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-23 17:24:02', '2024-07-23 18:29:11'),
(3, 'Ali', 'Asem', 'ali@gmail.com', 777333555, 'Male', 1, '2024-07-23 18:17:07', '$2y$10$ZaFbYn//CORUd72JWhOLg.og635KD48Gw18ja/BbNeqnaKDdPYN42', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-23 18:16:47', '2024-07-23 18:17:07'),
(4, 'Qassem', 'Salh', 'qassem@gmail.com', 777555888, 'Male', 1, NULL, '$2y$10$5wfzQS8XwAYjR1E/AV6PnOW.epYLqfqnOVMlazNu89olHZhsl2mia', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 03:40:16', '2024-07-27 03:40:16'),
(5, 'Sam', 'Ahmed', 'sam@gmail.com', 777222111, 'Male', 1, NULL, '$2y$10$ZZMnxjRvvnWFG7kI2kXE.u2e8SM0kK1V5Lo2zXiPBWV9wlwK1/kIO', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 03:41:13', '2024-07-27 03:41:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educational_programs`
--
ALTER TABLE `educational_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `educational_programs_subject_id_foreign` (`subject_id`),
  ADD KEY `educational_programs_category_id_foreign` (`category_id`),
  ADD KEY `educational_programs_trainer_id_foreign` (`trainer_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `student_programs`
--
ALTER TABLE `student_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_programs_student_id_foreign` (`student_id`),
  ADD KEY `student_programs_program_id_foreign` (`program_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `educational_programs`
--
ALTER TABLE `educational_programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_programs`
--
ALTER TABLE `student_programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `educational_programs`
--
ALTER TABLE `educational_programs`
  ADD CONSTRAINT `educational_programs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `educational_programs_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `educational_programs_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_programs`
--
ALTER TABLE `student_programs`
  ADD CONSTRAINT `student_programs_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `educational_programs` (`id`),
  ADD CONSTRAINT `student_programs_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
