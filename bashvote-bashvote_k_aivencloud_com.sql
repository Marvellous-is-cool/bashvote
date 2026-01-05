-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: bashvote-bashvote.k.aivencloud.com:27723
-- Generation Time: Jan 02, 2026 at 09:42 AM
-- Server version: 8.0.35
-- PHP Version: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bashvote`
--
CREATE DATABASE IF NOT EXISTS `bashvote` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bashvote`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'presido', '123456789', '2025-12-27 22:04:30', '2025-12-27 22:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Best Dressed(Male)', NULL, '2025-12-22 21:19:13', '2025-12-22 21:19:13'),
(2, 'Best Dressed(Female)', NULL, '2025-12-22 21:19:26', '2025-12-22 21:19:26'),
(3, 'Best Smile(Male)', NULL, '2025-12-22 21:19:46', '2025-12-22 21:19:46'),
(4, 'Best Smile(Female)', NULL, '2025-12-22 21:19:59', '2025-12-22 21:19:59'),
(5, 'Fashion Icon(Male)', NULL, '2025-12-22 21:20:25', '2025-12-22 21:20:25'),
(6, 'Fashion Icon(Female)', NULL, '2025-12-22 21:20:39', '2025-12-22 21:20:39'),
(7, 'Most Photogenic(Male)', NULL, '2025-12-22 21:22:51', '2025-12-22 21:22:51'),
(8, 'Most Photogenic(Female)', NULL, '2025-12-22 21:23:06', '2025-12-22 21:23:06'),
(9, 'Most Popular(Male)', NULL, '2025-12-22 21:23:26', '2025-12-22 21:23:26'),
(10, 'Most Popular(Female)', NULL, '2025-12-22 21:23:41', '2025-12-22 21:23:41'),
(11, 'Life of the Party(Male)', NULL, '2025-12-22 21:24:10', '2025-12-22 21:24:10'),
(12, 'Life of the Party(Female)', NULL, '2025-12-22 21:27:24', '2025-12-22 21:27:24'),
(13, 'Funniest Person(Male)', NULL, '2025-12-22 21:27:42', '2025-12-22 21:27:42'),
(14, 'Funniest Person(Female)', NULL, '2025-12-22 21:27:54', '2025-12-22 21:27:54'),
(15, 'Best Dancer', NULL, '2025-12-22 21:36:56', '2025-12-22 21:36:56'),
(16, 'Most Caring(Male)', NULL, '2025-12-22 21:37:17', '2025-12-22 21:37:17'),
(17, 'Most Caring(Female)', NULL, '2025-12-22 21:37:28', '2025-12-22 21:37:28'),
(18, 'Best Couple', NULL, '2025-12-22 21:45:58', '2025-12-22 21:45:58'),
(19, 'Most Hardworking', NULL, '2025-12-22 21:46:15', '2025-12-22 21:46:15'),
(20, 'Most Punctual', NULL, '2025-12-22 21:46:26', '2025-12-22 21:46:26'),
(21, 'Most Supportive', NULL, '2025-12-22 21:46:37', '2025-12-22 21:46:37'),
(22, 'Entrepreneur of the Year(Male)', NULL, '2025-12-22 21:46:54', '2025-12-22 21:46:54'),
(23, 'Entrepreneur of the Year(Female)', NULL, '2025-12-22 21:47:13', '2025-12-22 21:47:13'),
(24, 'Most Outstanding Fresher', NULL, '2025-12-22 21:47:27', '2025-12-22 21:47:27'),
(25, 'Most Beautiful Fresher', NULL, '2025-12-22 21:47:37', '2025-12-22 21:47:37'),
(26, 'Most Popular Fresher', NULL, '2025-12-22 21:47:51', '2025-12-22 21:47:51'),
(27, 'Most Handsome Fresher', NULL, '2025-12-22 21:48:01', '2025-12-22 21:48:01'),
(28, 'Best Dressed Fresher(Male)', NULL, '2025-12-22 21:48:17', '2025-12-22 21:48:17'),
(29, 'Best Dressed Fresher(Female)', NULL, '2025-12-22 21:48:32', '2025-12-22 21:48:32'),
(30, 'Most Friendly Fresher', NULL, '2025-12-22 21:49:01', '2025-12-22 21:49:01'),
(31, 'Most Talented Fresher', NULL, '2025-12-22 21:49:12', '2025-12-22 21:49:12'),
(32, 'Fresher of the Year', NULL, '2025-12-22 21:49:39', '2025-12-22 21:49:39'),
(33, 'Clique of the Year', NULL, '2025-12-22 21:49:53', '2025-12-22 21:49:53'),
(34, 'Most Popular Crew', NULL, '2025-12-22 21:50:10', '2025-12-22 21:50:10'),
(35, 'Most Fashionable Squad', NULL, '2025-12-22 21:50:45', '2025-12-22 21:50:45'),
(36, 'Best Academic Team', NULL, '2025-12-22 21:51:08', '2025-12-22 21:51:08'),
(37, 'Most Popular Staylite', NULL, '2025-12-22 21:51:24', '2025-12-22 21:51:24'),
(38, 'Most Influential Staylite', NULL, '2025-12-22 21:51:36', '2025-12-22 21:51:36'),
(39, 'Most Active Staylite', NULL, '2025-12-22 21:52:15', '2025-12-22 21:52:15'),
(40, 'Most Social Staylite', NULL, '2025-12-22 21:52:29', '2025-12-22 21:52:29'),
(41, 'Staylite of the Year', NULL, '2025-12-22 21:52:55', '2025-12-22 21:52:55'),
(42, 'Best Corporate Dressed(Male)', NULL, '2025-12-24 13:34:04', '2025-12-24 13:34:04'),
(43, 'Best Corporate Dressed(Female)', NULL, '2025-12-24 13:34:20', '2025-12-24 13:34:20'),
(44, 'Most Intelligent Staylite', NULL, '2025-12-24 15:42:17', '2025-12-24 15:42:17'),
(45, 'Slim and Sexy', NULL, '2025-12-24 15:48:53', '2025-12-24 15:48:53'),
(46, 'Pretty under Hijab', NULL, '2025-12-24 17:15:07', '2025-12-24 17:15:07'),
(47, 'Melanin Pop of the Year', NULL, '2025-12-24 17:17:10', '2025-12-24 17:17:10'),
(48, 'Most Supportive Team', NULL, '2025-12-24 17:44:05', '2025-12-24 17:44:05'),
(49, 'Big, Bold, and Beautiful', NULL, '2025-12-24 18:25:19', '2025-12-24 18:25:19');

--
-- Triggers `awards`
--
DELIMITER $$
CREATE TRIGGER `awards_before_insert` BEFORE INSERT ON `awards` FOR EACH ROW BEGIN
  SET NEW.title = TRIM(NEW.title);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `awards_before_update` BEFORE UPDATE ON `awards` FOR EACH ROW BEGIN
  SET NEW.title = TRIM(NEW.title);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `award_contestants`
--

CREATE TABLE `award_contestants` (
  `id` int NOT NULL,
  `contestant_id` int NOT NULL,
  `award_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `award_contestants`
--

INSERT INTO `award_contestants` (`id`, `contestant_id`, `award_id`, `created_at`) VALUES
(2, 2, 46, '2025-12-28 13:42:23'),
(3, 3, 4, '2025-12-28 13:43:13'),
(5, 5, 35, '2025-12-28 13:44:27'),
(6, 6, 8, '2025-12-28 13:45:12'),
(7, 7, 46, '2025-12-28 13:46:43'),
(8, 8, 18, '2025-12-28 13:47:13'),
(9, 9, 35, '2025-12-28 13:48:04'),
(10, 10, 18, '2025-12-28 13:51:20'),
(12, 12, 12, '2025-12-28 13:52:44'),
(13, 13, 7, '2025-12-28 13:53:21'),
(14, 14, 16, '2025-12-28 13:54:43'),
(15, 15, 47, '2025-12-28 13:55:21'),
(16, 16, 19, '2025-12-28 13:55:43'),
(18, 18, 10, '2025-12-28 13:59:40'),
(19, 19, 45, '2025-12-28 13:59:58'),
(20, 20, 47, '2025-12-28 14:01:12'),
(21, 21, 4, '2025-12-28 14:04:22'),
(22, 22, 29, '2025-12-28 14:04:46'),
(23, 23, 49, '2025-12-28 14:05:55'),
(24, 24, 43, '2025-12-28 14:06:28'),
(25, 25, 42, '2025-12-28 14:08:03'),
(26, 26, 21, '2025-12-28 14:08:37'),
(27, 27, 4, '2025-12-28 14:10:32'),
(29, 29, 8, '2025-12-28 14:12:26'),
(30, 30, 46, '2025-12-28 14:13:11'),
(33, 33, 6, '2025-12-28 14:16:38'),
(34, 34, 43, '2025-12-28 14:17:02'),
(35, 35, 45, '2025-12-28 14:17:26'),
(36, 36, 10, '2025-12-28 14:20:04'),
(37, 37, 47, '2025-12-28 14:20:40'),
(38, 38, 20, '2025-12-28 14:21:42'),
(39, 39, 21, '2025-12-28 14:22:07'),
(40, 40, 37, '2025-12-28 14:23:08'),
(41, 41, 3, '2025-12-28 14:24:07'),
(42, 42, 22, '2025-12-28 14:26:09'),
(44, 44, 20, '2025-12-28 14:37:40'),
(45, 45, 47, '2025-12-28 14:38:44'),
(46, 46, 47, '2025-12-28 14:39:56'),
(47, 47, 20, '2025-12-28 14:40:42'),
(48, 48, 46, '2025-12-28 14:41:21'),
(49, 49, 25, '2025-12-28 14:42:07'),
(50, 50, 18, '2025-12-28 14:43:06'),
(51, 51, 35, '2025-12-28 14:44:04'),
(52, 52, 30, '2025-12-28 14:44:37'),
(53, 53, 45, '2025-12-28 14:45:12'),
(54, 54, 19, '2025-12-28 14:45:57'),
(55, 55, 10, '2025-12-28 14:46:38'),
(56, 56, 4, '2025-12-28 14:47:11'),
(57, 57, 12, '2025-12-28 14:48:19'),
(58, 58, 33, '2025-12-28 14:49:25'),
(59, 59, 20, '2025-12-28 14:51:25'),
(60, 60, 19, '2025-12-28 14:51:50'),
(61, 61, 48, '2025-12-28 14:52:31'),
(62, 62, 22, '2025-12-28 14:52:57'),
(64, 64, 6, '2025-12-28 14:56:38'),
(65, 65, 44, '2025-12-28 14:57:00'),
(66, 66, 47, '2025-12-28 15:05:11'),
(67, 67, 46, '2025-12-28 15:05:33'),
(68, 68, 19, '2025-12-28 15:07:10'),
(69, 69, 24, '2025-12-28 15:07:37'),
(70, 70, 42, '2025-12-28 15:08:01'),
(71, 71, 19, '2025-12-28 15:09:09'),
(72, 72, 19, '2025-12-28 15:09:10'),
(73, 73, 25, '2025-12-28 15:09:49'),
(75, 75, 25, '2025-12-28 15:11:16'),
(76, 76, 8, '2025-12-28 15:11:39'),
(77, 77, 7, '2025-12-28 15:12:45'),
(78, 78, 4, '2025-12-28 15:13:15'),
(80, 80, 8, '2025-12-28 15:15:12'),
(81, 81, 6, '2025-12-28 15:15:54'),
(82, 82, 42, '2025-12-28 15:17:14'),
(83, 83, 45, '2025-12-28 15:17:40'),
(84, 84, 6, '2025-12-28 15:18:12'),
(85, 85, 22, '2025-12-28 15:18:51'),
(86, 86, 44, '2025-12-28 15:19:33'),
(87, 87, 19, '2025-12-28 15:19:51'),
(88, 88, 7, '2025-12-28 15:21:57'),
(89, 89, 8, '2025-12-28 15:22:21'),
(90, 90, 30, '2025-12-28 15:23:08'),
(91, 91, 26, '2025-12-28 15:23:40'),
(92, 92, 25, '2025-12-28 15:26:37'),
(93, 93, 6, '2025-12-28 15:27:14'),
(94, 94, 6, '2025-12-28 15:29:14'),
(95, 95, 6, '2025-12-28 15:29:42'),
(96, 96, 31, '2025-12-28 15:30:24'),
(97, 97, 26, '2025-12-28 15:31:02'),
(98, 98, 3, '2025-12-28 15:31:35'),
(99, 99, 26, '2025-12-28 15:32:01'),
(100, 100, 21, '2025-12-28 15:33:03'),
(101, 101, 21, '2025-12-28 15:37:31'),
(102, 102, 3, '2025-12-28 15:38:16'),
(103, 103, 19, '2025-12-28 15:38:55'),
(104, 104, 4, '2025-12-28 15:39:37'),
(105, 105, 8, '2025-12-28 15:40:16'),
(106, 106, 8, '2025-12-28 15:40:46'),
(107, 107, 20, '2025-12-28 15:41:35'),
(108, 108, 19, '2025-12-28 15:54:48'),
(109, 109, 4, '2025-12-28 15:55:35'),
(110, 110, 6, '2025-12-28 15:56:28'),
(111, 111, 3, '2025-12-28 15:57:04'),
(112, 112, 32, '2025-12-28 15:57:40'),
(113, 113, 19, '2025-12-28 15:58:05'),
(114, 114, 43, '2025-12-28 15:58:49'),
(115, 115, 16, '2025-12-29 08:05:07'),
(116, 116, 41, '2025-12-29 08:08:53'),
(117, 117, 43, '2025-12-29 10:08:43'),
(118, 118, 19, '2025-12-29 10:30:57'),
(119, 119, 30, '2025-12-29 10:47:06'),
(120, 120, 6, '2025-12-29 21:47:36'),
(121, 121, 33, '2025-12-29 21:50:26'),
(122, 122, 4, '2025-12-30 08:19:00'),
(123, 123, 8, '2025-12-30 08:20:48'),
(124, 124, 45, '2025-12-30 08:21:37'),
(125, 125, 6, '2025-12-30 08:23:18'),
(126, 126, 10, '2025-12-30 08:24:55'),
(127, 127, 39, '2025-12-30 08:26:40'),
(128, 128, 3, '2025-12-30 08:27:37'),
(129, 129, 22, '2025-12-30 08:27:59'),
(130, 130, 19, '2025-12-30 08:28:18'),
(131, 131, 19, '2025-12-30 08:29:04'),
(132, 132, 12, '2025-12-31 11:22:05');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `key` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`key`, `value`) VALUES
('live_enabled', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `contestants`
--

CREATE TABLE `contestants` (
  `id` int NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `level` int UNSIGNED NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `votes` int UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contestants`
--

INSERT INTO `contestants` (`id`, `nickname`, `level`, `department`, `photo_url`, `votes`, `created_at`, `updated_at`) VALUES
(2, 'Aisha Olatundun Nurudeen', 200, NULL, 'Aisha-Olatundun-Nurudeenmjps3yda.jpg', 57, '2025-12-28 13:42:22', '2026-01-01 13:18:22'),
(3, 'Adeshola Oyindamola Funmilayo', 200, NULL, 'Adeshola-Oyindamola-Funmilayomjps517s.jpg', 21, '2025-12-28 13:43:13', '2025-12-31 11:09:52'),
(5, 'Chic Clique  ', 200, NULL, 'Chic-Clique--mjps6ms8.jpg', 1, '2025-12-28 13:44:27', '2025-12-29 11:27:31'),
(6, 'Mary', 100, NULL, 'Marymjps7l2k.jpg', 7, '2025-12-28 13:45:12', '2025-12-30 10:17:07'),
(7, 'Fajinmi Aishat Opeyemi', 300, NULL, 'Fajinmi-Aishat-Opeyemimjqs2dvb.jpg', 252, '2025-12-28 13:46:43', '2025-12-31 19:28:53'),
(8, 'Eninla and Morenike', 200, NULL, 'Eninla-and-Morenikemjpsa6n8.jpg', 0, '2025-12-28 13:47:13', '2025-12-28 13:47:13'),
(9, 'Jordan and Achiever', 200, NULL, 'Jordan-and-Achievermjpsb9s5.jpg', 25, '2025-12-28 13:48:04', '2025-12-30 15:37:37'),
(10, 'Akindele Abdulquadri Gbolahan  & Ademola Oluwatosin', 100, NULL, 'Akindele-Abdulquadri-Gbolahan--&-Ademola-Oluwatosinmjpsfh38.jpg', 2, '2025-12-28 13:51:20', '2025-12-29 10:47:27'),
(12, 'Oduwale Haliyah Success  ', 100, NULL, 'Oduwale-Haliyah-Success--mjpsh9jk.jpg', 28, '2025-12-28 13:52:43', '2025-12-29 13:33:08'),
(13, 'Amodu Abdulmalik Kehinde', 200, NULL, 'Amodu-Abdulmalik-Kehindemjpsi2gg.jpg', 8, '2025-12-28 13:53:21', '2025-12-31 23:17:23'),
(14, 'Mufutau Idris Pamilerin', 200, NULL, 'Mufutau-Idris-Pamilerinmjpsjtxl.jpg', 33, '2025-12-28 13:54:43', '2026-01-01 12:51:42'),
(15, 'Mufutau Idris Pamilerin', 200, NULL, 'Mufutau-Idris-Pamilerinmjpskn77.jpg', 0, '2025-12-28 13:55:21', '2025-12-28 13:55:21'),
(16, 'Mufutau Idris Pamilerin', 200, NULL, 'Mufutau-Idris-Pamilerinmjpsl3sn.jpg', 0, '2025-12-28 13:55:42', '2025-12-28 13:55:42'),
(18, 'Ibrahim Fathia Ayomide', 200, NULL, 'Ibrahim-Fathia-Ayomidemjpsq75d.jpg', 0, '2025-12-28 13:59:40', '2025-12-28 13:59:40'),
(19, 'Ibrahim Fathia Ayomide', 200, NULL, 'Ibrahim-Fathia-Ayomidemjpsqkyz.jpg', 111, '2025-12-28 13:59:58', '2025-12-30 15:06:57'),
(20, 'Abimbola Mary Adedolapo', 200, NULL, 'Abimbola-Mary-Adedolapomjpss64n.jpg', 0, '2025-12-28 14:01:12', '2025-12-28 14:01:12'),
(21, 'Ademola Oluwatosin ', 100, NULL, 'Ademola-Oluwatosin-mjpsw8jj.jpg', 0, '2025-12-28 14:04:22', '2025-12-28 14:04:22'),
(22, 'Ademola Oluwatosin ', 100, NULL, 'Ademola-Oluwatosin-mjpswqx2.jpg', 1, '2025-12-28 14:04:46', '2025-12-29 14:29:15'),
(23, 'Olowe Morenike Esther', 100, NULL, 'Olowe-Morenike-Esthermjpsy7x3.jpg', 16, '2025-12-28 14:05:54', '2025-12-29 20:23:40'),
(24, 'Olugbodi Racheal Eniola', 100, NULL, 'Olugbodi-Racheal-Eniolamjqs3aah.jpg', 0, '2025-12-28 14:06:28', '2025-12-29 06:29:37'),
(25, 'Adeyeye Shola Isreal', 200, NULL, 'Adeyeye-Shola-Isrealmjpt0ynk.jpg', 22, '2025-12-28 14:08:02', '2025-12-30 20:35:38'),
(26, 'Adeyeye Shola Isreal ', 200, NULL, 'Adeyeye-Shola-Isreal-mjpt1p2v.jpg', 0, '2025-12-28 14:08:37', '2025-12-28 14:08:37'),
(27, 'Olayinka Zainab Faith ', 200, NULL, 'Olayinka-Zainab-Faith-mjpt45s7.jpg', 0, '2025-12-28 14:10:31', '2025-12-28 14:10:31'),
(29, 'Lawal Summayah Olasubomi', 200, NULL, 'Lawal-Summayah-Olasubomimjpt6m38.jpg', 26, '2025-12-28 14:12:26', '2026-01-01 06:25:58'),
(30, 'Lawal Summayah Olasubomi', 200, NULL, 'Lawal-Summayah-Olasubomimjpt7knp.jpg', 218, '2025-12-28 14:13:11', '2026-01-01 16:29:45'),
(33, 'Omotosho Zainab Opeyemi', 100, NULL, 'Omotosho-Zainab-Opeyemimjptc0rf.jpg', 18, '2025-12-28 14:16:38', '2025-12-31 22:05:16'),
(34, 'Omotosho Zainab Opeyemi', 100, NULL, 'Omotosho-Zainab-Opeyemimjptcim5.jpg', 10, '2025-12-28 14:17:01', '2025-12-31 22:06:53'),
(35, 'Omotosho Zainab Opeyemi', 200, NULL, 'Omotosho-Zainab-Opeyemimjptd13b.jpg', 7, '2025-12-28 14:17:25', '2025-12-31 20:29:21'),
(36, 'Akintunde Glory Ayomikun', 200, NULL, 'Akintunde-Glory-Ayomikunmjptgfaq.jpg', 5, '2025-12-28 14:20:04', '2025-12-31 10:02:14'),
(37, 'Akintunde Glory Ayomikun', 200, NULL, 'Akintunde-Glory-Ayomikunmjpth6zy.jpg', 5, '2025-12-28 14:20:40', '2025-12-31 09:58:04'),
(38, 'Akintunde Glory Ayomikun', 200, NULL, 'Akintunde-Glory-Ayomikunmjptiipg.jpg', 0, '2025-12-28 14:21:41', '2025-12-28 14:21:41'),
(39, 'Akintunde Glory Ayomikun', 200, NULL, 'Akintunde-Glory-Ayomikunmjptj1y1.jpg', 0, '2025-12-28 14:22:06', '2025-12-28 14:22:06'),
(40, 'Akintunde Glory Ayomikun', 200, NULL, 'Akintunde-Glory-Ayomikunmjptkdjm.jpg', 5, '2025-12-28 14:23:08', '2025-12-31 10:06:22'),
(41, 'Zakariyah Sodiq Omogbolahan ', 200, NULL, 'Zakariyah-Sodiq-Omogbolahan-mjptln1s.jpg', 0, '2025-12-28 14:24:07', '2025-12-28 14:24:07'),
(42, 'Usamot Abdulrahman Adekunle', 200, NULL, 'Usamot-Abdulrahman-Adekunlemjpto8nu.jpg', 0, '2025-12-28 14:26:08', '2025-12-28 14:26:08'),
(44, 'Usamot Abdulrahman Adekunle', 200, NULL, 'Usamot-Abdulrahman-Adekunlemjpu32b6.jpg', 0, '2025-12-28 14:37:40', '2025-12-28 14:37:40'),
(45, 'Sowunmi Oluwadamiloju  ', 200, NULL, 'Sowunmi-Oluwadamiloju--mjpu4fqh.jpg', 66, '2025-12-28 14:38:44', '2026-01-01 16:43:33'),
(46, 'Fasesin Martins (MARTE)', 300, NULL, 'Fasesin-Martins-(MARTE)mjpu5zcg.jpg', 0, '2025-12-28 14:39:56', '2025-12-28 14:39:56'),
(47, 'Humphrey Grace', 100, NULL, 'Humphrey-Gracemjpu6ykq.jpg', 0, '2025-12-28 14:40:42', '2025-12-28 14:40:42'),
(48, 'Adekanbi Latifat Omowumi', 100, NULL, 'Adekanbi-Latifat-Omowumimjpu7scy.jpg', 26, '2025-12-28 14:41:20', '2025-12-31 14:36:10'),
(49, 'Fadele Esther Oluwabukola', 100, NULL, 'Fadele-Esther-Oluwabukolamjpu8shg.jpg', 0, '2025-12-28 14:42:07', '2025-12-28 14:42:07'),
(50, 'Olanrewaju Sola and Adesola Precious', 200, NULL, 'Olanrewaju-Sola-and-Adesola-Preciousmjpua1nl.jpg', 0, '2025-12-28 14:43:06', '2025-12-28 14:43:06'),
(51, 'Olarenwaju Sola and Ilosoba Victor', 200, NULL, 'Olarenwaju-Sola-and-Ilosoba-Victormjpuba7h.jpg', 0, '2025-12-28 14:44:03', '2025-12-28 14:44:03'),
(52, 'Akingbola  Hikmoh Taiwo ', 100, NULL, 'Akingbola--Hikmoh-Taiwo-mjpuc04l.jpg', 0, '2025-12-28 14:44:37', '2025-12-28 14:44:37'),
(53, 'Happuch Adesola Precious', 200, NULL, 'Happuch-Adesola-Preciousmjpucr09.jpg', 25, '2025-12-28 14:45:12', '2025-12-29 14:03:58'),
(54, 'Menapo Esther ', 200, NULL, 'Menapo-Esther-mjpudpwj.jpg', 11, '2025-12-28 14:45:57', '2025-12-31 20:24:23'),
(55, 'Menapo Esther ', 200, NULL, 'Menapo-Esther-mjpuel46.jpg', 6, '2025-12-28 14:46:38', '2025-12-31 20:21:11'),
(56, 'Menapo Esther ', 200, NULL, 'Menapo-Esther-mjpufams.jpg', 17, '2025-12-28 14:47:11', '2025-12-31 20:22:48'),
(57, 'Adekogbe Wareedat  ', 200, NULL, 'Adekogbe-Wareedat--mjpugrbb.jpg', 0, '2025-12-28 14:48:19', '2025-12-28 14:48:19'),
(58, 'Domicko & Schos😎. ', 200, NULL, 'Domicko-&-Schos😎.-mjpui5x2.jpg', 8, '2025-12-28 14:49:24', '2025-12-30 05:32:19'),
(59, 'Olayemi Michael', 200, NULL, 'Olayemi-Michaelmjpukqqm.jpg', 0, '2025-12-28 14:51:25', '2025-12-28 14:51:25'),
(60, 'Ayomide Adedeji John  ', 200, NULL, 'Ayomide-Adedeji-John--mjpul9ti.jpg', 0, '2025-12-28 14:51:49', '2025-12-28 14:51:49'),
(61, 'Hope Team', 200, NULL, 'Hope-Teammjpum5zt.jpg', 0, '2025-12-28 14:52:31', '2025-12-28 14:52:31'),
(62, 'Oduola Hassan Olamilekan  ', 200, NULL, 'Oduola-Hassan-Olamilekan--mjpumpxl.jpg', 0, '2025-12-28 14:52:57', '2025-12-28 14:52:57'),
(64, 'Famous Mercy', 200, NULL, 'Famous-Mercymjpurfym.jpg', 0, '2025-12-28 14:56:37', '2025-12-28 14:56:37'),
(65, 'Olayemi Michael', 200, NULL, 'Olayemi-Michaelmjpurxda.jpg', 106, '2025-12-28 14:57:00', '2025-12-31 23:32:41'),
(66, 'Adeagbo Eniolaoluwa Oluwatomi', 200, NULL, 'Adeagbo-Eniolaoluwa-Oluwatomimjpv2g4z.jpg', 5, '2025-12-28 15:05:11', '2025-12-29 21:59:23'),
(67, 'Owosho Balikis Margret ', 200, NULL, 'Owosho-Balikis-Margret-mjpv2xel.jpg', 19, '2025-12-28 15:05:33', '2025-12-30 07:06:10'),
(68, 'Bello Islamiyyah Opeyemi', 100, NULL, 'Bello-Islamiyyah-Opeyemimjpv4zom.jpg', 0, '2025-12-28 15:07:09', '2025-12-28 15:07:09'),
(69, 'Olaoye Marvellous ', 100, NULL, 'Olaoye-Marvellous-mjpv5l12.jpg', 1, '2025-12-28 15:07:37', '2025-12-30 08:23:51'),
(70, 'Olanrewaju Olorunlonsola', 200, NULL, 'Olanrewaju-Olorunlonsolamjqs7bxz.jpg', 15, '2025-12-28 15:08:01', '2025-12-29 22:14:32'),
(71, 'Kolade Khalid', 100, NULL, 'Kolade-Khalidmjpv7jqn.jpg', 0, '2025-12-28 15:09:09', '2025-12-28 15:09:09'),
(72, 'Kolade Khalid', 100, NULL, 'Kolade-Khalidmjpv7khl.jpg', 0, '2025-12-28 15:09:10', '2025-12-28 15:09:10'),
(73, 'Iyiola Ayomide Mary', 100, NULL, 'Iyiola-Ayomide-Marymjpv8ekw.jpg', 8, '2025-12-28 15:09:49', '2025-12-30 10:45:57'),
(75, 'Ugele Grace Tetsoma', 100, NULL, 'Ugele-Grace-Tetsomamjpva9zp.jpg', 0, '2025-12-28 15:11:16', '2025-12-28 15:11:16'),
(76, 'Ugele Grace Tetsoma', 100, NULL, 'Ugele-Grace-Tetsomamjpvar4l.jpg', 0, '2025-12-28 15:11:38', '2025-12-28 15:11:38'),
(77, 'Ayankojo Precious Boluwatife ', 100, NULL, 'Ayankojo-Precious-Boluwatife-mjpvc6p4.jpg', 0, '2025-12-28 15:12:45', '2025-12-28 15:12:45'),
(78, 'Adeleke Aliyah Opeyemi', 100, NULL, 'Adeleke-Aliyah-Opeyemimjpvctpv.jpg', 0, '2025-12-28 15:13:15', '2025-12-28 15:13:15'),
(80, 'Anthony Paulina Ifeoluwa', 100, NULL, 'Anthony-Paulina-Ifeoluwamjpvfbsy.jpg', 42, '2025-12-28 15:15:12', '2025-12-30 10:32:16'),
(81, 'Oyedele Mercy', 100, NULL, 'Oyedele-Mercymjpvg8is.jpg', 0, '2025-12-28 15:15:54', '2025-12-28 15:15:54'),
(82, 'Olopade Toluwani Emmanuel', 200, NULL, 'Olopade-Toluwani-Emmanuelmjpvhxzi.jpg', 5, '2025-12-28 15:17:14', '2025-12-29 15:11:25'),
(83, 'Emmanuel Mary  ', 200, NULL, 'Emmanuel-Mary--mjpvihn6.jpg', 11, '2025-12-28 15:17:39', '2025-12-30 09:15:13'),
(84, 'Stephen Boluwatife Deborah', 100, NULL, 'Stephen-Boluwatife-Deborahmjpvj6qb.jpg', 1, '2025-12-28 15:18:12', '2025-12-30 13:55:04'),
(85, 'NeEarn', 200, NULL, 'NeEarnmjpvk0ij.jpg', 0, '2025-12-28 15:18:50', '2025-12-28 15:18:50'),
(86, 'Hon.Olatunde Olaniyi Israel (O.Niyi)', 200, NULL, 'Hon.Olatunde-Olaniyi-Israel-(O.Niyi)mjpvkxi1.jpg', 0, '2025-12-28 15:19:33', '2025-12-28 15:19:33'),
(87, 'Hon.Olatunde Olaniyi Israel (O.Niyi)', 200, NULL, 'Hon.Olatunde-Olaniyi-Israel-(O.Niyi)mjpvlbgp.jpg', 0, '2025-12-28 15:19:51', '2025-12-28 15:19:51'),
(88, 'Omiwale Precious', 100, NULL, 'Omiwale-Preciousmjpvo0hq.jpg', 0, '2025-12-28 15:21:57', '2025-12-28 15:21:57'),
(89, 'Aresiola Oluwakemisola Gift', 100, NULL, 'Aresiola-Oluwakemisola-Giftmjpvoiv7.jpg', 35, '2025-12-28 15:22:21', '2026-01-01 12:51:17'),
(90, 'Adisa Oluwagbemisola Ajayi ', 100, NULL, 'Adisa-Oluwagbemisola-Ajayi-mjpvpj4z.jpg', 0, '2025-12-28 15:23:08', '2025-12-28 15:23:08'),
(91, 'Adisa Oluwagbemisola Ajayi ', 100, NULL, 'Adisa-Oluwagbemisola-Ajayi-mjpvq7tk.jpg', 0, '2025-12-28 15:23:40', '2025-12-28 15:23:40'),
(92, 'Odetominiyi Elizabeth Segun ', 100, NULL, 'Odetominiyi-Elizabeth-Segun-mjpvu0q2.jpg', 0, '2025-12-28 15:26:37', '2025-12-28 15:26:37'),
(93, 'Torsu Anuoluwapo Patience', 100, NULL, 'Torsu-Anuoluwapo-Patiencemjpvut9x.jpg', 0, '2025-12-28 15:27:14', '2025-12-28 15:27:14'),
(94, 'Torsu Anuoluwapo Patience', 100, NULL, 'Torsu-Anuoluwapo-Patiencemjpvxdew.jpg', 0, '2025-12-28 15:29:14', '2025-12-28 15:29:14'),
(95, 'Abdulwakeel Wakeelat Anuoluwapo ', 100, NULL, 'Abdulwakeel-Wakeelat-Anuoluwapo-mjpvxyx5.jpg', 0, '2025-12-28 15:29:42', '2025-12-28 15:29:42'),
(96, 'Precious Ibenye Ngozi', 100, NULL, 'Precious-Ibenye-Ngozimjpvyv54.jpg', 0, '2025-12-28 15:30:23', '2025-12-28 15:30:23'),
(97, 'Olasunkanmi Sheu Al Ameen', 100, NULL, 'Olasunkanmi-Sheu-Al-Ameenmjpvzoil.jpg', 0, '2025-12-28 15:31:01', '2025-12-28 15:31:01'),
(98, 'Akindele Abdulquadri Gbolahan', 100, NULL, 'Akindele-Abdulquadri-Gbolahanmjpw0eef.jpg', 2, '2025-12-28 15:31:35', '2025-12-29 09:24:20'),
(99, 'Akindele Abdulquadri Gbolahan', 100, NULL, 'Akindele-Abdulquadri-Gbolahanmjpw0ylz.jpg', 0, '2025-12-28 15:32:01', '2025-12-28 15:32:01'),
(100, 'Akindele Abdulquadri Gbolahan', 100, NULL, 'Akindele-Abdulquadri-Gbolahanmjpw2a9y.jpg', 1, '2025-12-28 15:33:03', '2025-12-30 07:43:25'),
(101, 'Omotoso Oluwaferanmi Obawole', 100, NULL, 'Omotoso-Oluwaferanmi-Obawolemjpw80ya.jpg', 0, '2025-12-28 15:37:31', '2025-12-28 15:37:31'),
(102, 'Olasunkanmi Sheu Al Ameen', 100, NULL, 'Olasunkanmi-Sheu-Al-Ameenmjpw8zto.jpg', 0, '2025-12-28 15:38:16', '2025-12-28 15:38:16'),
(103, 'Precious ', 100, NULL, 'Precious-mjpw9tmk.jpg', 0, '2025-12-28 15:38:55', '2025-12-28 15:38:55'),
(104, 'Amusan Glory Esther', 100, NULL, 'Amusan-Glory-Esthermjpwaq4b.jpg', 0, '2025-12-28 15:39:37', '2025-12-28 15:39:37'),
(105, 'Oluwabamise', 100, NULL, 'Oluwabamisemjpwbk8h.jpg', 47, '2025-12-28 15:40:16', '2025-12-30 10:41:46'),
(106, 'Ojemuyiwa Isaac Damilare', 100, NULL, 'Ojemuyiwa-Isaac-Damilaremjpwc7ju.jpg', 0, '2025-12-28 15:40:46', '2025-12-28 15:40:46'),
(107, 'Salaudeen Simbiat Ajoke', 100, NULL, 'Salaudeen-Simbiat-Ajokemjpwd9lc.jpg', 0, '2025-12-28 15:41:35', '2025-12-28 15:41:35'),
(108, 'Adesoji Kayode', 100, NULL, 'Adesoji-Kayodemjpwu9ck.jpg', 0, '2025-12-28 15:54:48', '2025-12-28 15:54:48'),
(109, 'Ifeoluwa Ogunleye', 100, NULL, 'Ifeoluwa-Ogunleyemjpwv9p8.jpg', 66, '2025-12-28 15:55:35', '2025-12-31 14:50:10'),
(110, 'Abdulkareem Barakat Adebimpe', 300, NULL, 'Abdulkareem-Barakat-Adebimpemjpwwefo.jpg', 27, '2025-12-28 15:56:28', '2025-12-31 21:04:51'),
(111, 'Ahmad', 100, NULL, 'Ahmadmjpwx6ge.jpg', 0, '2025-12-28 15:57:04', '2025-12-28 15:57:04'),
(112, 'Iyiola Ayomide Mary', 100, NULL, 'Iyiola-Ayomide-Marymjpwxxvi.jpg', 7, '2025-12-28 15:57:40', '2025-12-30 10:51:51'),
(113, 'Iyiola Ayomide Mary', 100, NULL, 'Iyiola-Ayomide-Marymjpwyhc2.jpg', 3, '2025-12-28 15:58:05', '2025-12-29 08:42:16'),
(114, 'Adeagbo Azeezat ', 100, NULL, 'Adeagbo-Azeezat-mjqs67m3.jpg', 0, '2025-12-28 15:58:49', '2025-12-29 06:31:54'),
(115, 'Kolade Khalid', 100, NULL, 'Kolade-Khalidmjqvi353.jpg', 0, '2025-12-29 08:05:07', '2025-12-29 08:05:07'),
(116, 'Akinsade Bowofoluwa Marvellous  ', 100, NULL, 'Akinsade-Bowofoluwa-Marvellous--mjqvmxpd.jpg', 60, '2025-12-29 08:08:53', '2026-01-01 00:54:37'),
(117, 'Akinboboye Tayo Oladayo', 200, NULL, 'Akinboboye-Tayo-Oladayomjqzx15f.jpg', 0, '2025-12-29 10:08:42', '2025-12-29 10:08:42'),
(118, 'Eninla', 200, NULL, 'Eninlamjr0pn47.jpg', 0, '2025-12-29 10:30:57', '2025-12-29 10:30:57'),
(119, 'Akinro Esther', 100, NULL, 'Akinro-Esthermjr1aec7.jpg', 6, '2025-12-29 10:47:06', '2025-12-30 10:21:28'),
(120, 'Tomori Feranmi Oluwagbejami', 200, NULL, 'Tomori-Feranmi-Oluwagbejamimjrovsuf.jpg', 0, '2025-12-29 21:47:35', '2025-12-29 21:47:35'),
(121, 'Trifecta Queens🙂‍↔', 200, NULL, 'Trifecta-Queens🙂‍↔mjrozg1t.jpg', 0, '2025-12-29 21:50:25', '2025-12-29 21:50:25'),
(122, 'Jimoh Muizat Abiola', 200, NULL, 'Jimoh-Muizat-Abiolamjsbfsrd.jpg', 22, '2025-12-30 08:19:00', '2025-12-30 10:22:30'),
(123, 'Durodola Bareerat Adenike', 200, NULL, 'Durodola-Bareerat-Adenikemjsbi3ky.jpg', 36, '2025-12-30 08:20:47', '2025-12-31 05:33:54'),
(124, 'Adeyemi Adenike Rejoice', 200, NULL, 'Adeyemi-Adenike-Rejoicemjsbj5xr.jpg', 3, '2025-12-30 08:21:37', '2025-12-30 08:51:32'),
(125, 'Ogunjimi Oreoluwa Dorcas', 200, NULL, 'Ogunjimi-Oreoluwa-Dorcasmjsblbws.jpg', 1, '2025-12-30 08:23:18', '2025-12-30 11:04:05'),
(126, 'Abe Princess Temilade', 200, NULL, 'Abe-Princess-Temilademjsbnejx.jpg', 20, '2025-12-30 08:24:55', '2026-01-01 13:19:13'),
(127, 'Abe Princess Temilade', 200, NULL, 'Abe-Princess-Temilademjsbpnu7.jpg', 12, '2025-12-30 08:26:40', '2025-12-30 09:42:32'),
(128, 'Ikpi David Essien', 200, NULL, 'Ikpi-David-Essienmjsbqv6w.jpg', 0, '2025-12-30 08:27:36', '2025-12-30 08:27:36'),
(129, 'Ikpi David Essien', 200, NULL, 'Ikpi-David-Essienmjsbrceb.jpg', 0, '2025-12-30 08:27:59', '2025-12-30 08:27:59'),
(130, 'Ikpi David Essien', 200, NULL, 'Ikpi-David-Essienmjsbrrhz.jpg', 6, '2025-12-30 08:28:18', '2025-12-30 10:24:53'),
(131, 'Samuel Glory Nneoma(Ireti)', 200, NULL, 'Samuel-Glory-Nneoma(Ireti)mjsbsqkn.jpg', 0, '2025-12-30 08:29:04', '2025-12-30 08:29:04'),
(132, 'Adeshola Oyindamola Funmilayo', 100, NULL, 'Adeshola-Oyindamola-Funmilayomjtxf3ds.jpg', 33, '2025-12-31 11:22:05', '2025-12-31 14:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `contestant_id` int NOT NULL,
  `award_id` int NOT NULL,
  `amount_divided_by_10` decimal(10,2) NOT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `contestant_id`, `award_id`, `amount_divided_by_10`, `payment_date`, `status`, `created_at`, `updated_at`) VALUES
(2, 10, 18, 1000.00, '2025-12-28 16:00:44', 'paid', '2025-12-28 16:00:43', '2025-12-28 16:00:43'),
(3, 7, 46, 1000.00, '2025-12-28 16:16:16', 'paid', '2025-12-28 16:16:16', '2025-12-28 16:16:16'),
(4, 105, 8, 2000.00, '2025-12-28 23:21:42', 'paid', '2025-12-28 23:21:42', '2025-12-28 23:21:42'),
(5, 105, 8, 3000.00, '2025-12-28 23:22:43', 'paid', '2025-12-28 23:22:43', '2025-12-28 23:22:43'),
(6, 89, 8, 1000.00, '2025-12-28 23:30:22', 'paid', '2025-12-28 23:30:21', '2025-12-28 23:30:21'),
(7, 2, 46, 5000.00, '2025-12-28 23:35:07', 'paid', '2025-12-28 23:35:07', '2025-12-28 23:35:07'),
(8, 105, 8, 1000.00, '2025-12-28 23:44:17', 'paid', '2025-12-28 23:44:16', '2025-12-28 23:44:16'),
(9, 105, 8, 16000.00, '2025-12-28 23:49:54', 'paid', '2025-12-28 23:49:53', '2025-12-28 23:49:53'),
(10, 89, 8, 2000.00, '2025-12-28 23:58:56', 'paid', '2025-12-28 23:58:56', '2025-12-28 23:58:56'),
(11, 82, 42, 1000.00, '2025-12-29 00:00:19', 'paid', '2025-12-29 00:00:19', '2025-12-29 00:00:19'),
(12, 67, 46, 1000.00, '2025-12-29 00:20:02', 'paid', '2025-12-29 00:20:02', '2025-12-29 00:20:02'),
(13, 67, 46, 10000.00, '2025-12-29 00:38:26', 'paid', '2025-12-29 00:38:26', '2025-12-29 00:38:26'),
(14, 67, 46, 1000.00, '2025-12-29 00:43:04', 'paid', '2025-12-29 00:43:04', '2025-12-29 00:43:04'),
(15, 82, 42, 1000.00, '2025-12-29 01:02:27', 'paid', '2025-12-29 01:02:26', '2025-12-29 01:02:26'),
(16, 109, 4, 1000.00, '2025-12-29 05:45:42', 'paid', '2025-12-29 05:45:42', '2025-12-29 05:45:42'),
(17, 109, 4, 1000.00, '2025-12-29 06:13:13', 'paid', '2025-12-29 06:13:12', '2025-12-29 06:13:12'),
(18, 109, 4, 2000.00, '2025-12-29 06:21:03', 'paid', '2025-12-29 06:21:03', '2025-12-29 06:21:03'),
(19, 109, 4, 5000.00, '2025-12-29 06:32:25', 'paid', '2025-12-29 06:32:25', '2025-12-29 06:32:25'),
(20, 109, 4, 1000.00, '2025-12-29 06:32:34', 'paid', '2025-12-29 06:32:34', '2025-12-29 06:32:34'),
(21, 109, 4, 1000.00, '2025-12-29 06:32:40', 'paid', '2025-12-29 06:32:40', '2025-12-29 06:32:40'),
(22, 89, 8, 2000.00, '2025-12-29 06:35:01', 'paid', '2025-12-29 06:35:01', '2025-12-29 06:35:01'),
(23, 109, 4, 1000.00, '2025-12-29 06:46:57', 'paid', '2025-12-29 06:46:57', '2025-12-29 06:46:57'),
(24, 53, 45, 1000.00, '2025-12-29 06:59:37', 'paid', '2025-12-29 06:59:37', '2025-12-29 06:59:37'),
(25, 53, 45, 20000.00, '2025-12-29 07:05:00', 'paid', '2025-12-29 07:05:00', '2025-12-29 07:05:00'),
(26, 109, 4, 1000.00, '2025-12-29 07:09:08', 'paid', '2025-12-29 07:09:08', '2025-12-29 07:09:08'),
(27, 53, 45, 1000.00, '2025-12-29 07:10:45', 'paid', '2025-12-29 07:10:44', '2025-12-29 07:10:44'),
(28, 109, 4, 3000.00, '2025-12-29 07:14:53', 'paid', '2025-12-29 07:14:52', '2025-12-29 07:14:52'),
(29, 2, 46, 1000.00, '2025-12-29 07:16:56', 'paid', '2025-12-29 07:16:56', '2025-12-29 07:16:56'),
(30, 89, 8, 1000.00, '2025-12-29 07:22:09', 'paid', '2025-12-29 07:22:08', '2025-12-29 07:22:08'),
(31, 65, 44, 3000.00, '2025-12-29 07:23:02', 'paid', '2025-12-29 07:23:02', '2025-12-29 07:23:02'),
(32, 89, 8, 1000.00, '2025-12-29 07:23:21', 'paid', '2025-12-29 07:23:20', '2025-12-29 07:23:20'),
(33, 109, 4, 1000.00, '2025-12-29 07:23:56', 'paid', '2025-12-29 07:23:56', '2025-12-29 07:23:56'),
(34, 65, 44, 3000.00, '2025-12-29 07:24:54', 'paid', '2025-12-29 07:24:54', '2025-12-29 07:24:54'),
(35, 65, 44, 3000.00, '2025-12-29 07:25:35', 'paid', '2025-12-29 07:25:35', '2025-12-29 07:25:35'),
(36, 89, 8, 3000.00, '2025-12-29 07:26:55', 'paid', '2025-12-29 07:26:55', '2025-12-29 07:26:55'),
(37, 89, 8, 1000.00, '2025-12-29 07:36:25', 'paid', '2025-12-29 07:36:25', '2025-12-29 07:36:25'),
(38, 109, 4, 1000.00, '2025-12-29 07:39:09', 'paid', '2025-12-29 07:39:09', '2025-12-29 07:39:09'),
(39, 65, 44, 1000.00, '2025-12-29 07:39:12', 'paid', '2025-12-29 07:39:12', '2025-12-29 07:39:12'),
(40, 105, 8, 1000.00, '2025-12-29 07:43:37', 'paid', '2025-12-29 07:43:37', '2025-12-29 07:43:37'),
(41, 105, 8, 5000.00, '2025-12-29 07:45:33', 'paid', '2025-12-29 07:45:33', '2025-12-29 07:45:33'),
(42, 6, 8, 1000.00, '2025-12-29 07:45:54', 'paid', '2025-12-29 07:45:54', '2025-12-29 07:45:54'),
(43, 6, 8, 1000.00, '2025-12-29 07:46:29', 'paid', '2025-12-29 07:46:29', '2025-12-29 07:46:29'),
(44, 109, 4, 5000.00, '2025-12-29 07:48:08', 'paid', '2025-12-29 07:48:08', '2025-12-29 07:48:08'),
(45, 6, 8, 1000.00, '2025-12-29 07:51:06', 'paid', '2025-12-29 07:51:06', '2025-12-29 07:51:06'),
(46, 109, 4, 5000.00, '2025-12-29 07:53:05', 'paid', '2025-12-29 07:53:05', '2025-12-29 07:53:05'),
(47, 109, 4, 1000.00, '2025-12-29 07:53:25', 'paid', '2025-12-29 07:53:25', '2025-12-29 07:53:25'),
(48, 65, 44, 3000.00, '2025-12-29 07:53:31', 'paid', '2025-12-29 07:53:31', '2025-12-29 07:53:31'),
(49, 89, 8, 1000.00, '2025-12-29 07:57:02', 'paid', '2025-12-29 07:57:01', '2025-12-29 07:57:01'),
(50, 109, 4, 1000.00, '2025-12-29 08:00:23', 'paid', '2025-12-29 08:00:23', '2025-12-29 08:00:23'),
(51, 6, 8, 1000.00, '2025-12-29 08:09:14', 'paid', '2025-12-29 08:09:13', '2025-12-29 08:09:13'),
(52, 112, 32, 5000.00, '2025-12-29 08:27:41', 'paid', '2025-12-29 08:27:41', '2025-12-29 08:27:41'),
(53, 112, 32, 1000.00, '2025-12-29 08:28:14', 'paid', '2025-12-29 08:28:13', '2025-12-29 08:28:13'),
(54, 12, 12, 10000.00, '2025-12-29 08:30:30', 'paid', '2025-12-29 08:30:30', '2025-12-29 08:30:30'),
(55, 113, 19, 1000.00, '2025-12-29 08:30:34', 'paid', '2025-12-29 08:30:33', '2025-12-29 08:30:33'),
(56, 73, 25, 2000.00, '2025-12-29 08:34:34', 'paid', '2025-12-29 08:34:34', '2025-12-29 08:34:34'),
(57, 73, 25, 2000.00, '2025-12-29 08:34:55', 'paid', '2025-12-29 08:34:55', '2025-12-29 08:34:55'),
(58, 89, 8, 1000.00, '2025-12-29 08:35:19', 'paid', '2025-12-29 08:35:19', '2025-12-29 08:35:19'),
(59, 89, 8, 1000.00, '2025-12-29 08:36:23', 'paid', '2025-12-29 08:36:23', '2025-12-29 08:36:23'),
(60, 7, 46, 1000.00, '2025-12-29 08:40:30', 'paid', '2025-12-29 08:40:30', '2025-12-29 08:40:30'),
(61, 89, 8, 2000.00, '2025-12-29 08:42:06', 'paid', '2025-12-29 08:42:06', '2025-12-29 08:42:06'),
(62, 113, 19, 2000.00, '2025-12-29 08:42:16', 'paid', '2025-12-29 08:42:15', '2025-12-29 08:42:15'),
(63, 7, 46, 5000.00, '2025-12-29 08:55:33', 'paid', '2025-12-29 08:55:33', '2025-12-29 08:55:33'),
(64, 53, 45, 1000.00, '2025-12-29 08:56:06', 'paid', '2025-12-29 08:56:06', '2025-12-29 08:56:06'),
(65, 12, 12, 10000.00, '2025-12-29 09:05:12', 'paid', '2025-12-29 09:05:12', '2025-12-29 09:05:12'),
(66, 48, 46, 10000.00, '2025-12-29 09:06:45', 'paid', '2025-12-29 09:06:44', '2025-12-29 09:06:44'),
(67, 66, 47, 1000.00, '2025-12-29 09:13:53', 'paid', '2025-12-29 09:13:53', '2025-12-29 09:13:53'),
(68, 7, 46, 20000.00, '2025-12-29 09:17:21', 'paid', '2025-12-29 09:17:21', '2025-12-29 09:17:21'),
(69, 98, 3, 1000.00, '2025-12-29 09:18:42', 'paid', '2025-12-29 09:18:42', '2025-12-29 09:18:42'),
(70, 98, 3, 1000.00, '2025-12-29 09:24:19', 'paid', '2025-12-29 09:24:19', '2025-12-29 09:24:19'),
(71, 10, 18, 1000.00, '2025-12-29 10:47:27', 'paid', '2025-12-29 10:47:26', '2025-12-29 10:47:26'),
(72, 105, 8, 2000.00, '2025-12-29 11:02:06', 'paid', '2025-12-29 11:02:06', '2025-12-29 11:02:06'),
(73, 89, 8, 1000.00, '2025-12-29 11:06:26', 'paid', '2025-12-29 11:06:26', '2025-12-29 11:06:26'),
(74, 7, 46, 10000.00, '2025-12-29 11:12:00', 'paid', '2025-12-29 11:12:00', '2025-12-29 11:12:00'),
(75, 13, 7, 1000.00, '2025-12-29 11:13:34', 'paid', '2025-12-29 11:13:33', '2025-12-29 11:13:33'),
(76, 45, 47, 2000.00, '2025-12-29 11:20:33', 'paid', '2025-12-29 11:20:33', '2025-12-29 11:20:33'),
(77, 5, 35, 1000.00, '2025-12-29 11:27:31', 'paid', '2025-12-29 11:27:31', '2025-12-29 11:27:31'),
(78, 45, 47, 1000.00, '2025-12-29 11:30:11', 'paid', '2025-12-29 11:30:11', '2025-12-29 11:30:11'),
(79, 13, 7, 1000.00, '2025-12-29 11:31:37', 'paid', '2025-12-29 11:31:37', '2025-12-29 11:31:37'),
(80, 45, 47, 1000.00, '2025-12-29 11:34:41', 'paid', '2025-12-29 11:34:41', '2025-12-29 11:34:41'),
(81, 109, 4, 5000.00, '2025-12-29 11:35:07', 'paid', '2025-12-29 11:35:07', '2025-12-29 11:35:07'),
(82, 45, 47, 1000.00, '2025-12-29 11:35:38', 'paid', '2025-12-29 11:35:37', '2025-12-29 11:35:37'),
(83, 14, 16, 1000.00, '2025-12-29 11:36:20', 'paid', '2025-12-29 11:36:20', '2025-12-29 11:36:20'),
(84, 12, 12, 5000.00, '2025-12-29 11:36:36', 'paid', '2025-12-29 11:36:36', '2025-12-29 11:36:36'),
(85, 13, 7, 1000.00, '2025-12-29 11:38:40', 'paid', '2025-12-29 11:38:39', '2025-12-29 11:38:39'),
(86, 89, 8, 1000.00, '2025-12-29 11:45:37', 'paid', '2025-12-29 11:45:36', '2025-12-29 11:45:36'),
(87, 7, 46, 6000.00, '2025-12-29 11:54:00', 'paid', '2025-12-29 11:54:00', '2025-12-29 11:54:00'),
(88, 105, 8, 2000.00, '2025-12-29 11:56:41', 'paid', '2025-12-29 11:56:41', '2025-12-29 11:56:41'),
(89, 53, 45, 1000.00, '2025-12-29 12:06:44', 'paid', '2025-12-29 12:06:44', '2025-12-29 12:06:44'),
(90, 45, 47, 10000.00, '2025-12-29 12:08:47', 'paid', '2025-12-29 12:08:47', '2025-12-29 12:08:47'),
(91, 13, 7, 1000.00, '2025-12-29 12:13:42', 'paid', '2025-12-29 12:13:42', '2025-12-29 12:13:42'),
(92, 45, 47, 10000.00, '2025-12-29 12:19:51', 'paid', '2025-12-29 12:19:51', '2025-12-29 12:19:51'),
(93, 89, 8, 1000.00, '2025-12-29 12:22:15', 'paid', '2025-12-29 12:22:15', '2025-12-29 12:22:15'),
(94, 7, 46, 1000.00, '2025-12-29 12:23:04', 'paid', '2025-12-29 12:23:04', '2025-12-29 12:23:04'),
(95, 105, 8, 10000.00, '2025-12-29 12:39:05', 'paid', '2025-12-29 12:39:05', '2025-12-29 12:39:05'),
(96, 105, 8, 1000.00, '2025-12-29 12:44:10', 'paid', '2025-12-29 12:44:10', '2025-12-29 12:44:10'),
(97, 105, 8, 1000.00, '2025-12-29 12:46:55', 'paid', '2025-12-29 12:46:55', '2025-12-29 12:46:55'),
(98, 12, 12, 1000.00, '2025-12-29 13:26:45', 'paid', '2025-12-29 13:26:45', '2025-12-29 13:26:45'),
(99, 12, 12, 2000.00, '2025-12-29 13:33:08', 'paid', '2025-12-29 13:33:08', '2025-12-29 13:33:08'),
(100, 7, 46, 10000.00, '2025-12-29 13:33:22', 'paid', '2025-12-29 13:33:22', '2025-12-29 13:33:22'),
(101, 13, 7, 1000.00, '2025-12-29 13:35:31', 'paid', '2025-12-29 13:35:31', '2025-12-29 13:35:31'),
(102, 13, 7, 1000.00, '2025-12-29 13:38:09', 'paid', '2025-12-29 13:38:09', '2025-12-29 13:38:09'),
(103, 45, 47, 5000.00, '2025-12-29 13:48:01', 'paid', '2025-12-29 13:48:01', '2025-12-29 13:48:01'),
(104, 65, 44, 10000.00, '2025-12-29 13:53:52', 'paid', '2025-12-29 13:53:52', '2025-12-29 13:53:52'),
(105, 53, 45, 1000.00, '2025-12-29 14:03:58', 'paid', '2025-12-29 14:03:58', '2025-12-29 14:03:58'),
(106, 58, 33, 2000.00, '2025-12-29 14:07:11', 'paid', '2025-12-29 14:07:11', '2025-12-29 14:07:11'),
(107, 89, 8, 1000.00, '2025-12-29 14:09:30', 'paid', '2025-12-29 14:09:29', '2025-12-29 14:09:29'),
(108, 89, 8, 9000.00, '2025-12-29 14:12:06', 'paid', '2025-12-29 14:12:06', '2025-12-29 14:12:06'),
(109, 22, 29, 1000.00, '2025-12-29 14:29:15', 'paid', '2025-12-29 14:29:15', '2025-12-29 14:29:15'),
(110, 65, 44, 1000.00, '2025-12-29 14:32:49', 'paid', '2025-12-29 14:32:49', '2025-12-29 14:32:49'),
(111, 89, 8, 2000.00, '2025-12-29 14:39:34', 'paid', '2025-12-29 14:39:33', '2025-12-29 14:39:33'),
(112, 83, 45, 1000.00, '2025-12-29 14:42:02', 'paid', '2025-12-29 14:42:02', '2025-12-29 14:42:02'),
(113, 6, 8, 1000.00, '2025-12-29 14:59:25', 'paid', '2025-12-29 14:59:24', '2025-12-29 14:59:24'),
(114, 65, 44, 1000.00, '2025-12-29 15:01:27', 'paid', '2025-12-29 15:01:27', '2025-12-29 15:01:27'),
(115, 6, 8, 1000.00, '2025-12-29 15:06:36', 'paid', '2025-12-29 15:06:36', '2025-12-29 15:06:36'),
(116, 82, 42, 1000.00, '2025-12-29 15:09:00', 'paid', '2025-12-29 15:09:00', '2025-12-29 15:09:00'),
(117, 109, 4, 1000.00, '2025-12-29 15:09:39', 'paid', '2025-12-29 15:09:39', '2025-12-29 15:09:39'),
(118, 58, 33, 1000.00, '2025-12-29 15:10:08', 'paid', '2025-12-29 15:10:07', '2025-12-29 15:10:07'),
(119, 82, 42, 1000.00, '2025-12-29 15:10:12', 'paid', '2025-12-29 15:10:12', '2025-12-29 15:10:12'),
(120, 82, 42, 1000.00, '2025-12-29 15:11:25', 'paid', '2025-12-29 15:11:24', '2025-12-29 15:11:24'),
(121, 116, 41, 2000.00, '2025-12-29 15:16:28', 'paid', '2025-12-29 15:16:28', '2025-12-29 15:16:28'),
(122, 25, 42, 1000.00, '2025-12-29 15:19:54', 'paid', '2025-12-29 15:19:53', '2025-12-29 15:19:53'),
(123, 25, 42, 1000.00, '2025-12-29 15:20:52', 'paid', '2025-12-29 15:20:51', '2025-12-29 15:20:51'),
(124, 25, 42, 1000.00, '2025-12-29 15:22:13', 'paid', '2025-12-29 15:22:13', '2025-12-29 15:22:13'),
(125, 67, 46, 1000.00, '2025-12-29 15:28:51', 'paid', '2025-12-29 15:28:50', '2025-12-29 15:28:50'),
(126, 70, 42, 1000.00, '2025-12-29 15:36:18', 'paid', '2025-12-29 15:36:18', '2025-12-29 15:36:18'),
(127, 116, 41, 3000.00, '2025-12-29 15:36:23', 'paid', '2025-12-29 15:36:23', '2025-12-29 15:36:23'),
(128, 109, 4, 1000.00, '2025-12-29 15:37:16', 'paid', '2025-12-29 15:37:16', '2025-12-29 15:37:16'),
(129, 70, 42, 1000.00, '2025-12-29 15:39:53', 'paid', '2025-12-29 15:39:53', '2025-12-29 15:39:53'),
(130, 70, 42, 1000.00, '2025-12-29 15:40:44', 'paid', '2025-12-29 15:40:43', '2025-12-29 15:40:43'),
(131, 25, 42, 1000.00, '2025-12-29 15:46:17', 'paid', '2025-12-29 15:46:17', '2025-12-29 15:46:17'),
(132, 70, 42, 5000.00, '2025-12-29 16:14:57', 'paid', '2025-12-29 16:14:57', '2025-12-29 16:14:57'),
(133, 7, 46, 60000.00, '2025-12-29 16:35:15', 'paid', '2025-12-29 16:35:14', '2025-12-29 16:35:14'),
(134, 109, 4, 1000.00, '2025-12-29 16:41:05', 'paid', '2025-12-29 16:41:05', '2025-12-29 16:41:05'),
(135, 66, 47, 1000.00, '2025-12-29 16:50:35', 'paid', '2025-12-29 16:50:35', '2025-12-29 16:50:35'),
(136, 70, 42, 5000.00, '2025-12-29 18:05:17', 'paid', '2025-12-29 18:05:17', '2025-12-29 18:05:17'),
(137, 109, 4, 1000.00, '2025-12-29 18:09:15', 'paid', '2025-12-29 18:09:14', '2025-12-29 18:09:14'),
(138, 110, 6, 5000.00, '2025-12-29 18:12:42', 'paid', '2025-12-29 18:12:42', '2025-12-29 18:12:42'),
(139, 66, 47, 1000.00, '2025-12-29 18:15:24', 'paid', '2025-12-29 18:15:23', '2025-12-29 18:15:23'),
(140, 7, 46, 1000.00, '2025-12-29 18:39:49', 'paid', '2025-12-29 18:39:49', '2025-12-29 18:39:49'),
(141, 25, 42, 1000.00, '2025-12-29 18:41:53', 'paid', '2025-12-29 18:41:53', '2025-12-29 18:41:53'),
(142, 7, 46, 30000.00, '2025-12-29 18:41:59', 'paid', '2025-12-29 18:41:59', '2025-12-29 18:41:59'),
(143, 45, 47, 1000.00, '2025-12-29 18:45:44', 'paid', '2025-12-29 18:45:44', '2025-12-29 18:45:44'),
(144, 109, 4, 20000.00, '2025-12-29 18:53:30', 'paid', '2025-12-29 18:53:30', '2025-12-29 18:53:30'),
(145, 3, 4, 10000.00, '2025-12-29 19:07:08', 'paid', '2025-12-29 19:07:08', '2025-12-29 19:07:08'),
(146, 23, 49, 10000.00, '2025-12-29 19:10:35', 'paid', '2025-12-29 19:10:35', '2025-12-29 19:10:35'),
(147, 67, 46, 1000.00, '2025-12-29 19:30:29', 'paid', '2025-12-29 19:30:29', '2025-12-29 19:30:29'),
(148, 67, 46, 3000.00, '2025-12-29 19:41:11', 'paid', '2025-12-29 19:41:11', '2025-12-29 19:41:11'),
(149, 67, 46, 1000.00, '2025-12-29 19:41:22', 'paid', '2025-12-29 19:41:22', '2025-12-29 19:41:22'),
(150, 116, 41, 10000.00, '2025-12-29 19:57:09', 'paid', '2025-12-29 19:57:09', '2025-12-29 19:57:09'),
(151, 70, 42, 1000.00, '2025-12-29 20:11:28', 'paid', '2025-12-29 20:11:28', '2025-12-29 20:11:28'),
(152, 7, 46, 1000.00, '2025-12-29 20:12:56', 'paid', '2025-12-29 20:12:56', '2025-12-29 20:12:56'),
(153, 7, 46, 5000.00, '2025-12-29 20:14:23', 'paid', '2025-12-29 20:14:23', '2025-12-29 20:14:23'),
(154, 7, 46, 1000.00, '2025-12-29 20:15:08', 'paid', '2025-12-29 20:15:08', '2025-12-29 20:15:08'),
(155, 23, 49, 1000.00, '2025-12-29 20:23:39', 'paid', '2025-12-29 20:23:39', '2025-12-29 20:23:39'),
(156, 80, 8, 1000.00, '2025-12-29 20:24:22', 'paid', '2025-12-29 20:24:22', '2025-12-29 20:24:22'),
(157, 80, 8, 1000.00, '2025-12-29 20:35:44', 'paid', '2025-12-29 20:35:43', '2025-12-29 20:35:43'),
(158, 119, 30, 1000.00, '2025-12-29 20:42:19', 'paid', '2025-12-29 20:42:19', '2025-12-29 20:42:19'),
(159, 80, 8, 1000.00, '2025-12-29 20:53:06', 'paid', '2025-12-29 20:53:06', '2025-12-29 20:53:06'),
(160, 80, 8, 7000.00, '2025-12-29 20:55:52', 'paid', '2025-12-29 20:55:52', '2025-12-29 20:55:52'),
(161, 45, 47, 1000.00, '2025-12-29 21:00:17', 'paid', '2025-12-29 21:00:17', '2025-12-29 21:00:17'),
(162, 7, 46, 1000.00, '2025-12-29 21:02:19', 'paid', '2025-12-29 21:02:19', '2025-12-29 21:02:19'),
(163, 7, 46, 5000.00, '2025-12-29 21:02:51', 'paid', '2025-12-29 21:02:50', '2025-12-29 21:02:50'),
(164, 7, 46, 5000.00, '2025-12-29 21:02:51', 'paid', '2025-12-29 21:02:51', '2025-12-29 21:02:51'),
(165, 66, 47, 1000.00, '2025-12-29 21:04:37', 'paid', '2025-12-29 21:04:37', '2025-12-29 21:04:37'),
(166, 45, 47, 5000.00, '2025-12-29 21:06:24', 'paid', '2025-12-29 21:06:24', '2025-12-29 21:06:24'),
(167, 80, 8, 1000.00, '2025-12-29 21:25:58', 'paid', '2025-12-29 21:25:58', '2025-12-29 21:25:58'),
(168, 105, 8, 1000.00, '2025-12-29 21:27:45', 'paid', '2025-12-29 21:27:45', '2025-12-29 21:27:45'),
(169, 56, 4, 1000.00, '2025-12-29 21:34:02', 'paid', '2025-12-29 21:34:02', '2025-12-29 21:34:02'),
(170, 56, 4, 1000.00, '2025-12-29 21:34:06', 'paid', '2025-12-29 21:34:06', '2025-12-29 21:34:06'),
(171, 7, 46, 1000.00, '2025-12-29 21:36:55', 'paid', '2025-12-29 21:36:55', '2025-12-29 21:36:55'),
(172, 80, 8, 1000.00, '2025-12-29 21:37:31', 'paid', '2025-12-29 21:37:31', '2025-12-29 21:37:31'),
(173, 73, 25, 1000.00, '2025-12-29 21:51:02', 'paid', '2025-12-29 21:51:02', '2025-12-29 21:51:02'),
(174, 56, 4, 12000.00, '2025-12-29 21:55:38', 'paid', '2025-12-29 21:55:37', '2025-12-29 21:55:37'),
(175, 65, 44, 5000.00, '2025-12-29 21:55:39', 'paid', '2025-12-29 21:55:39', '2025-12-29 21:55:39'),
(176, 65, 44, 1000.00, '2025-12-29 21:57:09', 'paid', '2025-12-29 21:57:09', '2025-12-29 21:57:09'),
(177, 66, 47, 1000.00, '2025-12-29 21:59:23', 'paid', '2025-12-29 21:59:23', '2025-12-29 21:59:23'),
(178, 73, 25, 1000.00, '2025-12-29 22:06:29', 'paid', '2025-12-29 22:06:29', '2025-12-29 22:06:29'),
(179, 54, 19, 8000.00, '2025-12-29 22:08:40', 'paid', '2025-12-29 22:08:40', '2025-12-29 22:08:40'),
(180, 55, 10, 1000.00, '2025-12-29 22:08:40', 'paid', '2025-12-29 22:08:40', '2025-12-29 22:08:40'),
(181, 9, 35, 3000.00, '2025-12-29 22:09:26', 'paid', '2025-12-29 22:09:26', '2025-12-29 22:09:26'),
(182, 9, 35, 5000.00, '2025-12-29 22:12:46', 'paid', '2025-12-29 22:12:46', '2025-12-29 22:12:46'),
(183, 70, 42, 1000.00, '2025-12-29 22:14:32', 'paid', '2025-12-29 22:14:32', '2025-12-29 22:14:32'),
(184, 9, 35, 3000.00, '2025-12-29 22:15:15', 'paid', '2025-12-29 22:15:15', '2025-12-29 22:15:15'),
(185, 65, 44, 1000.00, '2025-12-29 22:24:43', 'paid', '2025-12-29 22:24:43', '2025-12-29 22:24:43'),
(186, 58, 33, 1000.00, '2025-12-29 22:25:31', 'paid', '2025-12-29 22:25:31', '2025-12-29 22:25:31'),
(187, 9, 35, 1000.00, '2025-12-29 22:25:38', 'paid', '2025-12-29 22:25:38', '2025-12-29 22:25:38'),
(188, 9, 35, 1000.00, '2025-12-29 22:26:43', 'paid', '2025-12-29 22:26:43', '2025-12-29 22:26:43'),
(189, 9, 35, 2000.00, '2025-12-29 22:28:48', 'paid', '2025-12-29 22:28:48', '2025-12-29 22:28:48'),
(190, 7, 46, 1000.00, '2025-12-29 22:30:08', 'paid', '2025-12-29 22:30:07', '2025-12-29 22:30:07'),
(191, 7, 46, 1000.00, '2025-12-29 22:30:09', 'paid', '2025-12-29 22:30:08', '2025-12-29 22:30:08'),
(192, 65, 44, 1000.00, '2025-12-29 22:31:06', 'paid', '2025-12-29 22:31:05', '2025-12-29 22:31:05'),
(193, 7, 46, 2000.00, '2025-12-29 23:05:22', 'paid', '2025-12-29 23:05:21', '2025-12-29 23:05:21'),
(194, 58, 33, 2000.00, '2025-12-29 23:12:51', 'paid', '2025-12-29 23:12:51', '2025-12-29 23:12:51'),
(195, 55, 10, 1000.00, '2025-12-29 23:36:14', 'paid', '2025-12-29 23:36:14', '2025-12-29 23:36:14'),
(196, 7, 46, 1000.00, '2025-12-29 23:38:12', 'paid', '2025-12-29 23:38:12', '2025-12-29 23:38:12'),
(197, 14, 16, 9000.00, '2025-12-29 23:42:10', 'paid', '2025-12-29 23:42:09', '2025-12-29 23:42:09'),
(198, 14, 16, 10000.00, '2025-12-29 23:44:34', 'paid', '2025-12-29 23:44:33', '2025-12-29 23:44:33'),
(199, 14, 16, 1000.00, '2025-12-30 04:58:41', 'paid', '2025-12-30 04:58:41', '2025-12-30 04:58:41'),
(200, 58, 33, 1000.00, '2025-12-30 05:28:10', 'paid', '2025-12-30 05:28:10', '2025-12-30 05:28:10'),
(201, 58, 33, 1000.00, '2025-12-30 05:32:18', 'paid', '2025-12-30 05:32:18', '2025-12-30 05:32:18'),
(202, 45, 47, 2000.00, '2025-12-30 05:48:28', 'paid', '2025-12-30 05:48:28', '2025-12-30 05:48:28'),
(203, 55, 10, 1000.00, '2025-12-30 07:04:15', 'paid', '2025-12-30 07:04:15', '2025-12-30 07:04:15'),
(204, 67, 46, 1000.00, '2025-12-30 07:06:09', 'paid', '2025-12-30 07:06:09', '2025-12-30 07:06:09'),
(205, 109, 4, 5000.00, '2025-12-30 07:08:53', 'paid', '2025-12-30 07:08:53', '2025-12-30 07:08:53'),
(206, 100, 21, 1000.00, '2025-12-30 07:43:25', 'paid', '2025-12-30 07:43:24', '2025-12-30 07:43:24'),
(207, 65, 44, 2000.00, '2025-12-30 07:48:03', 'paid', '2025-12-30 07:48:03', '2025-12-30 07:48:03'),
(208, 116, 41, 1000.00, '2025-12-30 08:04:05', 'paid', '2025-12-30 08:04:05', '2025-12-30 08:04:05'),
(209, 73, 25, 1000.00, '2025-12-30 08:17:45', 'paid', '2025-12-30 08:17:44', '2025-12-30 08:17:44'),
(210, 69, 24, 1000.00, '2025-12-30 08:23:51', 'paid', '2025-12-30 08:23:50', '2025-12-30 08:23:50'),
(211, 45, 47, 2000.00, '2025-12-30 08:30:22', 'paid', '2025-12-30 08:30:22', '2025-12-30 08:30:22'),
(212, 110, 6, 3000.00, '2025-12-30 08:34:57', 'paid', '2025-12-30 08:34:57', '2025-12-30 08:34:57'),
(213, 124, 45, 3000.00, '2025-12-30 08:51:31', 'paid', '2025-12-30 08:51:31', '2025-12-30 08:51:31'),
(214, 127, 39, 1000.00, '2025-12-30 09:00:16', 'paid', '2025-12-30 09:00:16', '2025-12-30 09:00:16'),
(215, 80, 8, 1000.00, '2025-12-30 09:01:04', 'paid', '2025-12-30 09:01:04', '2025-12-30 09:01:04'),
(216, 126, 10, 1000.00, '2025-12-30 09:02:30', 'paid', '2025-12-30 09:02:30', '2025-12-30 09:02:30'),
(217, 65, 44, 2000.00, '2025-12-30 09:10:26', 'paid', '2025-12-30 09:10:26', '2025-12-30 09:10:26'),
(218, 127, 39, 5000.00, '2025-12-30 09:11:15', 'paid', '2025-12-30 09:11:14', '2025-12-30 09:11:14'),
(219, 122, 4, 10000.00, '2025-12-30 09:12:27', 'paid', '2025-12-30 09:12:27', '2025-12-30 09:12:27'),
(220, 65, 44, 10000.00, '2025-12-30 09:14:12', 'paid', '2025-12-30 09:14:11', '2025-12-30 09:14:11'),
(221, 83, 45, 10000.00, '2025-12-30 09:15:13', 'paid', '2025-12-30 09:15:13', '2025-12-30 09:15:13'),
(222, 126, 10, 10000.00, '2025-12-30 09:15:27', 'paid', '2025-12-30 09:15:26', '2025-12-30 09:15:26'),
(223, 109, 4, 1000.00, '2025-12-30 09:17:03', 'paid', '2025-12-30 09:17:03', '2025-12-30 09:17:03'),
(224, 19, 45, 2000.00, '2025-12-30 09:18:21', 'paid', '2025-12-30 09:18:21', '2025-12-30 09:18:21'),
(225, 127, 39, 5000.00, '2025-12-30 09:19:30', 'paid', '2025-12-30 09:19:30', '2025-12-30 09:19:30'),
(226, 80, 8, 1000.00, '2025-12-30 09:24:58', 'paid', '2025-12-30 09:24:58', '2025-12-30 09:24:58'),
(227, 80, 8, 1000.00, '2025-12-30 09:27:18', 'paid', '2025-12-30 09:27:18', '2025-12-30 09:27:18'),
(228, 25, 42, 1000.00, '2025-12-30 09:36:55', 'paid', '2025-12-30 09:36:55', '2025-12-30 09:36:55'),
(229, 122, 4, 10000.00, '2025-12-30 09:38:26', 'paid', '2025-12-30 09:38:26', '2025-12-30 09:38:26'),
(230, 130, 19, 4000.00, '2025-12-30 09:41:17', 'paid', '2025-12-30 09:41:17', '2025-12-30 09:41:17'),
(231, 25, 42, 4000.00, '2025-12-30 09:41:29', 'paid', '2025-12-30 09:41:28', '2025-12-30 09:41:28'),
(232, 127, 39, 1000.00, '2025-12-30 09:42:32', 'paid', '2025-12-30 09:42:32', '2025-12-30 09:42:32'),
(233, 130, 19, 1000.00, '2025-12-30 09:56:36', 'paid', '2025-12-30 09:56:35', '2025-12-30 09:56:35'),
(234, 80, 8, 1000.00, '2025-12-30 10:02:10', 'paid', '2025-12-30 10:02:10', '2025-12-30 10:02:10'),
(235, 126, 10, 1000.00, '2025-12-30 10:03:59', 'paid', '2025-12-30 10:03:59', '2025-12-30 10:03:59'),
(236, 80, 8, 1000.00, '2025-12-30 10:07:51', 'paid', '2025-12-30 10:07:51', '2025-12-30 10:07:51'),
(237, 80, 8, 1000.00, '2025-12-30 10:09:26', 'paid', '2025-12-30 10:09:26', '2025-12-30 10:09:26'),
(238, 80, 8, 1000.00, '2025-12-30 10:11:00', 'paid', '2025-12-30 10:11:00', '2025-12-30 10:11:00'),
(239, 80, 8, 1000.00, '2025-12-30 10:12:37', 'paid', '2025-12-30 10:12:36', '2025-12-30 10:12:36'),
(240, 80, 8, 1000.00, '2025-12-30 10:14:43', 'paid', '2025-12-30 10:14:43', '2025-12-30 10:14:43'),
(241, 6, 8, 1000.00, '2025-12-30 10:17:07', 'paid', '2025-12-30 10:17:07', '2025-12-30 10:17:07'),
(242, 119, 30, 5000.00, '2025-12-30 10:21:28', 'paid', '2025-12-30 10:21:28', '2025-12-30 10:21:28'),
(243, 122, 4, 2000.00, '2025-12-30 10:22:30', 'paid', '2025-12-30 10:22:30', '2025-12-30 10:22:30'),
(244, 80, 8, 20000.00, '2025-12-30 10:22:35', 'paid', '2025-12-30 10:22:35', '2025-12-30 10:22:35'),
(245, 130, 19, 1000.00, '2025-12-30 10:24:53', 'paid', '2025-12-30 10:24:53', '2025-12-30 10:24:53'),
(246, 80, 8, 1000.00, '2025-12-30 10:32:15', 'paid', '2025-12-30 10:32:15', '2025-12-30 10:32:15'),
(247, 105, 8, 2000.00, '2025-12-30 10:41:46', 'paid', '2025-12-30 10:41:46', '2025-12-30 10:41:46'),
(248, 73, 25, 1000.00, '2025-12-30 10:45:56', 'paid', '2025-12-30 10:45:56', '2025-12-30 10:45:56'),
(249, 112, 32, 1000.00, '2025-12-30 10:51:50', 'paid', '2025-12-30 10:51:50', '2025-12-30 10:51:50'),
(250, 125, 6, 1000.00, '2025-12-30 11:04:04', 'paid', '2025-12-30 11:04:04', '2025-12-30 11:04:04'),
(251, 116, 41, 5000.00, '2025-12-30 11:16:23', 'paid', '2025-12-30 11:16:23', '2025-12-30 11:16:23'),
(252, 19, 45, 75000.00, '2025-12-30 11:21:37', 'paid', '2025-12-30 11:21:37', '2025-12-30 11:21:37'),
(253, 123, 8, 2000.00, '2025-12-30 11:34:51', 'paid', '2025-12-30 11:34:51', '2025-12-30 11:34:51'),
(254, 123, 8, 1000.00, '2025-12-30 11:44:42', 'paid', '2025-12-30 11:44:42', '2025-12-30 11:44:42'),
(255, 19, 45, 2000.00, '2025-12-30 12:03:17', 'paid', '2025-12-30 12:03:17', '2025-12-30 12:03:17'),
(256, 123, 8, 1000.00, '2025-12-30 12:07:56', 'paid', '2025-12-30 12:07:56', '2025-12-30 12:07:56'),
(257, 123, 8, 10000.00, '2025-12-30 12:14:51', 'paid', '2025-12-30 12:14:51', '2025-12-30 12:14:51'),
(258, 123, 8, 1000.00, '2025-12-30 12:16:33', 'paid', '2025-12-30 12:16:33', '2025-12-30 12:16:33'),
(259, 19, 45, 1000.00, '2025-12-30 12:33:59', 'paid', '2025-12-30 12:33:59', '2025-12-30 12:33:59'),
(260, 123, 8, 5000.00, '2025-12-30 12:35:41', 'paid', '2025-12-30 12:35:41', '2025-12-30 12:35:41'),
(261, 116, 41, 1000.00, '2025-12-30 12:38:27', 'paid', '2025-12-30 12:38:27', '2025-12-30 12:38:27'),
(262, 123, 8, 5000.00, '2025-12-30 12:56:20', 'paid', '2025-12-30 12:56:20', '2025-12-30 12:56:20'),
(263, 116, 41, 1000.00, '2025-12-30 13:02:29', 'paid', '2025-12-30 13:02:29', '2025-12-30 13:02:29'),
(264, 19, 45, 1000.00, '2025-12-30 13:49:51', 'paid', '2025-12-30 13:49:51', '2025-12-30 13:49:51'),
(265, 84, 6, 1000.00, '2025-12-30 13:55:04', 'paid', '2025-12-30 13:55:04', '2025-12-30 13:55:04'),
(266, 116, 41, 1000.00, '2025-12-30 13:56:18', 'paid', '2025-12-30 13:56:18', '2025-12-30 13:56:18'),
(267, 126, 10, 5000.00, '2025-12-30 14:11:01', 'paid', '2025-12-30 14:11:01', '2025-12-30 14:11:01'),
(268, 89, 8, 1000.00, '2025-12-30 14:44:52', 'paid', '2025-12-30 14:44:52', '2025-12-30 14:44:52'),
(269, 19, 45, 30000.00, '2025-12-30 15:06:56', 'paid', '2025-12-30 15:06:56', '2025-12-30 15:06:56'),
(270, 123, 8, 1000.00, '2025-12-30 15:09:41', 'paid', '2025-12-30 15:09:41', '2025-12-30 15:09:41'),
(271, 126, 10, 1000.00, '2025-12-30 15:35:44', 'paid', '2025-12-30 15:35:44', '2025-12-30 15:35:44'),
(272, 9, 35, 10000.00, '2025-12-30 15:37:37', 'paid', '2025-12-30 15:37:37', '2025-12-30 15:37:37'),
(273, 45, 47, 10000.00, '2025-12-30 15:39:16', 'paid', '2025-12-30 15:39:16', '2025-12-30 15:39:16'),
(274, 14, 16, 2000.00, '2025-12-30 15:43:21', 'paid', '2025-12-30 15:43:20', '2025-12-30 15:43:20'),
(275, 126, 10, 1000.00, '2025-12-30 15:52:29', 'paid', '2025-12-30 15:52:29', '2025-12-30 15:52:29'),
(276, 7, 46, 1000.00, '2025-12-30 16:46:15', 'paid', '2025-12-30 16:46:15', '2025-12-30 16:46:15'),
(277, 123, 8, 2000.00, '2025-12-30 16:53:16', 'paid', '2025-12-30 16:53:15', '2025-12-30 16:53:15'),
(278, 45, 47, 5000.00, '2025-12-30 17:01:10', 'paid', '2025-12-30 17:01:10', '2025-12-30 17:01:10'),
(279, 65, 44, 1000.00, '2025-12-30 17:10:51', 'paid', '2025-12-30 17:10:51', '2025-12-30 17:10:51'),
(280, 65, 44, 1000.00, '2025-12-30 17:28:56', 'paid', '2025-12-30 17:28:55', '2025-12-30 17:28:55'),
(281, 65, 44, 1000.00, '2025-12-30 18:05:02', 'paid', '2025-12-30 18:05:02', '2025-12-30 18:05:02'),
(282, 48, 46, 1000.00, '2025-12-30 18:28:07', 'paid', '2025-12-30 18:28:07', '2025-12-30 18:28:07'),
(283, 48, 46, 1000.00, '2025-12-30 18:48:53', 'paid', '2025-12-30 18:48:53', '2025-12-30 18:48:53'),
(284, 65, 44, 1000.00, '2025-12-30 19:02:03', 'paid', '2025-12-30 19:02:03', '2025-12-30 19:02:03'),
(285, 48, 46, 1000.00, '2025-12-30 19:04:01', 'paid', '2025-12-30 19:04:01', '2025-12-30 19:04:01'),
(286, 48, 46, 1000.00, '2025-12-30 19:05:44', 'paid', '2025-12-30 19:05:44', '2025-12-30 19:05:44'),
(287, 65, 44, 1000.00, '2025-12-30 19:19:47', 'paid', '2025-12-30 19:19:47', '2025-12-30 19:19:47'),
(288, 48, 46, 2000.00, '2025-12-30 20:07:33', 'paid', '2025-12-30 20:07:33', '2025-12-30 20:07:33'),
(289, 123, 8, 1000.00, '2025-12-30 20:23:05', 'paid', '2025-12-30 20:23:05', '2025-12-30 20:23:05'),
(290, 25, 42, 1000.00, '2025-12-30 20:24:32', 'paid', '2025-12-30 20:24:32', '2025-12-30 20:24:32'),
(291, 25, 42, 1000.00, '2025-12-30 20:25:28', 'paid', '2025-12-30 20:25:28', '2025-12-30 20:25:28'),
(292, 25, 42, 1000.00, '2025-12-30 20:32:46', 'paid', '2025-12-30 20:32:46', '2025-12-30 20:32:46'),
(293, 25, 42, 9000.00, '2025-12-30 20:35:37', 'paid', '2025-12-30 20:35:37', '2025-12-30 20:35:37'),
(294, 48, 46, 1000.00, '2025-12-30 20:56:58', 'paid', '2025-12-30 20:56:58', '2025-12-30 20:56:58'),
(295, 116, 41, 1000.00, '2025-12-30 22:19:05', 'paid', '2025-12-30 22:19:05', '2025-12-30 22:19:05'),
(296, 30, 46, 5000.00, '2025-12-30 22:22:31', 'paid', '2025-12-30 22:22:31', '2025-12-30 22:22:31'),
(297, 30, 46, 10000.00, '2025-12-30 22:38:13', 'paid', '2025-12-30 22:38:13', '2025-12-30 22:38:13'),
(298, 30, 46, 1000.00, '2025-12-30 22:38:49', 'paid', '2025-12-30 22:38:48', '2025-12-30 22:38:48'),
(299, 34, 43, 5000.00, '2025-12-30 22:39:43', 'paid', '2025-12-30 22:39:43', '2025-12-30 22:39:43'),
(300, 35, 45, 5000.00, '2025-12-30 22:41:51', 'paid', '2025-12-30 22:41:51', '2025-12-30 22:41:51'),
(301, 29, 8, 10000.00, '2025-12-30 22:42:11', 'paid', '2025-12-30 22:42:11', '2025-12-30 22:42:11'),
(302, 29, 8, 1000.00, '2025-12-30 22:50:08', 'paid', '2025-12-30 22:50:08', '2025-12-30 22:50:08'),
(303, 29, 8, 1000.00, '2025-12-30 22:57:12', 'paid', '2025-12-30 22:57:11', '2025-12-30 22:57:11'),
(304, 30, 46, 1000.00, '2025-12-30 22:58:52', 'paid', '2025-12-30 22:58:52', '2025-12-30 22:58:52'),
(305, 29, 8, 5000.00, '2025-12-30 23:13:17', 'paid', '2025-12-30 23:13:17', '2025-12-30 23:13:17'),
(306, 30, 46, 5000.00, '2025-12-30 23:17:34', 'paid', '2025-12-30 23:17:34', '2025-12-30 23:17:34'),
(307, 35, 45, 1000.00, '2025-12-30 23:26:08', 'paid', '2025-12-30 23:26:08', '2025-12-30 23:26:08'),
(308, 3, 4, 1000.00, '2025-12-30 23:46:07', 'paid', '2025-12-30 23:46:07', '2025-12-30 23:46:07'),
(309, 33, 6, 1000.00, '2025-12-30 23:52:53', 'paid', '2025-12-30 23:52:52', '2025-12-30 23:52:52'),
(310, 33, 6, 5000.00, '2025-12-31 02:46:47', 'paid', '2025-12-31 02:46:47', '2025-12-31 02:46:47'),
(311, 123, 8, 2000.00, '2025-12-31 04:59:42', 'paid', '2025-12-31 04:59:42', '2025-12-31 04:59:42'),
(312, 123, 8, 5000.00, '2025-12-31 05:33:54', 'paid', '2025-12-31 05:33:54', '2025-12-31 05:33:54'),
(313, 7, 46, 40000.00, '2025-12-31 05:57:59', 'paid', '2025-12-31 05:57:59', '2025-12-31 05:57:59'),
(314, 30, 46, 2000.00, '2025-12-31 06:29:27', 'paid', '2025-12-31 06:29:27', '2025-12-31 06:29:27'),
(315, 116, 41, 5000.00, '2025-12-31 07:03:27', 'paid', '2025-12-31 07:03:27', '2025-12-31 07:03:27'),
(316, 45, 47, 2000.00, '2025-12-31 07:33:45', 'paid', '2025-12-31 07:33:44', '2025-12-31 07:33:44'),
(317, 116, 41, 5000.00, '2025-12-31 07:50:28', 'paid', '2025-12-31 07:50:28', '2025-12-31 07:50:28'),
(318, 89, 8, 2000.00, '2025-12-31 08:21:17', 'paid', '2025-12-31 08:21:17', '2025-12-31 08:21:17'),
(319, 30, 46, 1000.00, '2025-12-31 09:25:05', 'paid', '2025-12-31 09:25:05', '2025-12-31 09:25:05'),
(320, 29, 8, 1000.00, '2025-12-31 09:27:30', 'paid', '2025-12-31 09:27:30', '2025-12-31 09:27:30'),
(321, 65, 44, 1000.00, '2025-12-31 09:38:37', 'paid', '2025-12-31 09:38:37', '2025-12-31 09:38:37'),
(322, 65, 44, 1000.00, '2025-12-31 09:39:12', 'paid', '2025-12-31 09:39:12', '2025-12-31 09:39:12'),
(323, 65, 44, 48000.00, '2025-12-31 09:47:54', 'paid', '2025-12-31 09:47:54', '2025-12-31 09:47:54'),
(324, 37, 47, 5000.00, '2025-12-31 09:58:04', 'paid', '2025-12-31 09:58:04', '2025-12-31 09:58:04'),
(325, 36, 10, 5000.00, '2025-12-31 10:02:14', 'paid', '2025-12-31 10:02:14', '2025-12-31 10:02:14'),
(326, 110, 6, 1000.00, '2025-12-31 10:02:20', 'paid', '2025-12-31 10:02:20', '2025-12-31 10:02:20'),
(327, 40, 37, 5000.00, '2025-12-31 10:06:21', 'paid', '2025-12-31 10:06:21', '2025-12-31 10:06:21'),
(328, 29, 8, 1000.00, '2025-12-31 10:12:07', 'paid', '2025-12-31 10:12:07', '2025-12-31 10:12:07'),
(329, 30, 46, 3000.00, '2025-12-31 10:21:36', 'paid', '2025-12-31 10:21:36', '2025-12-31 10:21:36'),
(330, 30, 46, 1000.00, '2025-12-31 10:21:55', 'paid', '2025-12-31 10:21:55', '2025-12-31 10:21:55'),
(331, 65, 44, 3000.00, '2025-12-31 10:32:55', 'paid', '2025-12-31 10:32:54', '2025-12-31 10:32:54'),
(332, 30, 46, 7000.00, '2025-12-31 10:46:59', 'paid', '2025-12-31 10:46:58', '2025-12-31 10:46:58'),
(333, 29, 8, 5000.00, '2025-12-31 11:04:04', 'paid', '2025-12-31 11:04:04', '2025-12-31 11:04:04'),
(334, 3, 4, 10000.00, '2025-12-31 11:09:52', 'paid', '2025-12-31 11:09:52', '2025-12-31 11:09:52'),
(335, 48, 46, 1000.00, '2025-12-31 11:30:29', 'paid', '2025-12-31 11:30:28', '2025-12-31 11:30:28'),
(336, 132, 12, 1000.00, '2025-12-31 11:38:19', 'paid', '2025-12-31 11:38:19', '2025-12-31 11:38:19'),
(337, 132, 12, 10000.00, '2025-12-31 11:49:37', 'paid', '2025-12-31 11:49:37', '2025-12-31 11:49:37'),
(338, 45, 47, 2000.00, '2025-12-31 11:51:51', 'paid', '2025-12-31 11:51:51', '2025-12-31 11:51:51'),
(339, 110, 6, 1000.00, '2025-12-31 12:19:17', 'paid', '2025-12-31 12:19:17', '2025-12-31 12:19:17'),
(340, 30, 46, 1000.00, '2025-12-31 12:39:26', 'paid', '2025-12-31 12:39:26', '2025-12-31 12:39:26'),
(341, 30, 46, 20000.00, '2025-12-31 12:42:00', 'paid', '2025-12-31 12:42:00', '2025-12-31 12:42:00'),
(342, 30, 46, 10000.00, '2025-12-31 12:42:25', 'paid', '2025-12-31 12:42:25', '2025-12-31 12:42:25'),
(343, 30, 46, 40000.00, '2025-12-31 12:46:47', 'paid', '2025-12-31 12:46:47', '2025-12-31 12:46:47'),
(344, 132, 12, 3000.00, '2025-12-31 13:01:37', 'paid', '2025-12-31 13:01:36', '2025-12-31 13:01:36'),
(345, 7, 46, 3000.00, '2025-12-31 13:09:44', 'paid', '2025-12-31 13:09:44', '2025-12-31 13:09:44'),
(346, 30, 46, 2000.00, '2025-12-31 13:16:28', 'paid', '2025-12-31 13:16:28', '2025-12-31 13:16:28'),
(347, 30, 46, 1000.00, '2025-12-31 13:33:22', 'paid', '2025-12-31 13:33:22', '2025-12-31 13:33:22'),
(348, 110, 6, 1000.00, '2025-12-31 13:40:54', 'paid', '2025-12-31 13:40:54', '2025-12-31 13:40:54'),
(349, 7, 46, 1000.00, '2025-12-31 13:46:44', 'paid', '2025-12-31 13:46:43', '2025-12-31 13:46:43'),
(350, 110, 6, 5000.00, '2025-12-31 13:49:03', 'paid', '2025-12-31 13:49:03', '2025-12-31 13:49:03'),
(351, 48, 46, 5000.00, '2025-12-31 14:36:10', 'paid', '2025-12-31 14:36:10', '2025-12-31 14:36:10'),
(352, 7, 46, 1000.00, '2025-12-31 14:41:25', 'paid', '2025-12-31 14:41:25', '2025-12-31 14:41:25'),
(353, 132, 12, 9000.00, '2025-12-31 14:47:33', 'paid', '2025-12-31 14:47:33', '2025-12-31 14:47:33'),
(354, 109, 4, 1000.00, '2025-12-31 14:50:10', 'paid', '2025-12-31 14:50:09', '2025-12-31 14:50:09'),
(355, 7, 46, 1000.00, '2025-12-31 14:59:30', 'paid', '2025-12-31 14:59:30', '2025-12-31 14:59:30'),
(356, 30, 46, 5000.00, '2025-12-31 15:16:10', 'paid', '2025-12-31 15:16:09', '2025-12-31 15:16:09'),
(357, 7, 46, 1000.00, '2025-12-31 15:20:16', 'paid', '2025-12-31 15:20:16', '2025-12-31 15:20:16'),
(358, 7, 46, 1000.00, '2025-12-31 15:45:35', 'paid', '2025-12-31 15:45:35', '2025-12-31 15:45:35'),
(359, 7, 46, 1000.00, '2025-12-31 15:45:36', 'paid', '2025-12-31 15:45:36', '2025-12-31 15:45:36'),
(360, 110, 6, 1000.00, '2025-12-31 15:59:14', 'paid', '2025-12-31 15:59:13', '2025-12-31 15:59:13'),
(361, 7, 46, 1000.00, '2025-12-31 16:16:19', 'paid', '2025-12-31 16:16:19', '2025-12-31 16:16:19'),
(362, 7, 46, 5000.00, '2025-12-31 16:20:21', 'paid', '2025-12-31 16:20:20', '2025-12-31 16:20:20'),
(363, 45, 47, 1000.00, '2025-12-31 16:21:12', 'paid', '2025-12-31 16:21:12', '2025-12-31 16:21:12'),
(364, 33, 6, 1000.00, '2025-12-31 16:24:15', 'paid', '2025-12-31 16:24:15', '2025-12-31 16:24:15'),
(365, 7, 46, 1000.00, '2025-12-31 16:35:15', 'paid', '2025-12-31 16:35:14', '2025-12-31 16:35:14'),
(366, 7, 46, 5000.00, '2025-12-31 16:38:00', 'paid', '2025-12-31 16:37:59', '2025-12-31 16:37:59'),
(367, 7, 46, 20000.00, '2025-12-31 18:09:31', 'paid', '2025-12-31 18:09:31', '2025-12-31 18:09:31'),
(368, 7, 46, 1000.00, '2025-12-31 19:28:53', 'paid', '2025-12-31 19:28:53', '2025-12-31 19:28:53'),
(369, 30, 46, 1000.00, '2025-12-31 19:38:17', 'paid', '2025-12-31 19:38:17', '2025-12-31 19:38:17'),
(370, 30, 46, 10000.00, '2025-12-31 19:58:43', 'paid', '2025-12-31 19:58:43', '2025-12-31 19:58:43'),
(371, 55, 10, 3000.00, '2025-12-31 20:21:11', 'paid', '2025-12-31 20:21:11', '2025-12-31 20:21:11'),
(372, 56, 4, 3000.00, '2025-12-31 20:22:47', 'paid', '2025-12-31 20:22:47', '2025-12-31 20:22:47'),
(373, 54, 19, 3000.00, '2025-12-31 20:24:23', 'paid', '2025-12-31 20:24:23', '2025-12-31 20:24:23'),
(374, 29, 8, 1000.00, '2025-12-31 20:28:04', 'paid', '2025-12-31 20:28:04', '2025-12-31 20:28:04'),
(375, 35, 45, 1000.00, '2025-12-31 20:29:20', 'paid', '2025-12-31 20:29:20', '2025-12-31 20:29:20'),
(376, 110, 6, 10000.00, '2025-12-31 21:04:51', 'paid', '2025-12-31 21:04:50', '2025-12-31 21:04:50'),
(377, 14, 16, 7000.00, '2025-12-31 21:50:07', 'paid', '2025-12-31 21:50:07', '2025-12-31 21:50:07'),
(378, 13, 7, 1000.00, '2025-12-31 23:13:48', 'paid', '2025-12-31 23:13:48', '2025-12-31 23:13:48'),
(379, 13, 7, 1000.00, '2025-12-31 23:17:22', 'paid', '2025-12-31 23:17:22', '2025-12-31 23:17:22'),
(380, 65, 44, 1000.00, '2025-12-31 23:32:41', 'paid', '2025-12-31 23:32:40', '2025-12-31 23:32:40'),
(381, 30, 46, 55000.00, '2026-01-01 00:58:18', 'paid', '2026-01-01 00:58:18', '2026-01-01 00:58:18'),
(382, 29, 8, 1000.00, '2026-01-01 06:25:57', 'paid', '2026-01-01 06:25:57', '2026-01-01 06:25:57'),
(383, 30, 46, 1000.00, '2026-01-01 06:30:26', 'paid', '2026-01-01 06:30:26', '2026-01-01 06:30:26'),
(384, 30, 46, 1000.00, '2026-01-01 09:54:54', 'paid', '2026-01-01 09:54:54', '2026-01-01 09:54:54'),
(385, 2, 46, 1000.00, '2026-01-01 11:55:59', 'paid', '2026-01-01 11:55:58', '2026-01-01 11:55:58'),
(386, 30, 46, 10000.00, '2026-01-01 12:29:05', 'paid', '2026-01-01 12:29:05', '2026-01-01 12:29:05'),
(387, 89, 8, 1000.00, '2026-01-01 12:51:18', 'paid', '2026-01-01 12:51:17', '2026-01-01 12:51:17'),
(388, 14, 16, 3000.00, '2026-01-01 12:51:42', 'paid', '2026-01-01 12:51:42', '2026-01-01 12:51:42'),
(389, 30, 46, 10000.00, '2026-01-01 12:56:48', 'paid', '2026-01-01 12:56:48', '2026-01-01 12:56:48'),
(390, 2, 46, 50000.00, '2026-01-01 13:18:22', 'paid', '2026-01-01 13:18:22', '2026-01-01 13:18:22'),
(391, 126, 10, 1000.00, '2026-01-01 13:19:12', 'paid', '2026-01-01 13:19:12', '2026-01-01 13:19:12'),
(392, 30, 46, 5000.00, '2026-01-01 13:29:11', 'paid', '2026-01-01 13:29:10', '2026-01-01 13:29:10'),
(393, 30, 46, 10000.00, '2026-01-01 16:29:44', 'paid', '2026-01-01 16:29:44', '2026-01-01 16:29:44'),
(394, 45, 47, 5000.00, '2026-01-01 16:43:33', 'paid', '2026-01-01 16:43:33', '2026-01-01 16:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `expires` int UNSIGNED NOT NULL,
  `data` mediumtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`, `created_at`) VALUES
('_nF2wxSxeGd6QHUNefY4W9bsjHhfhZnl', 1767333661, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T06:01:00.558Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:01:00'),
('_TwnvYnT_Dn9jiV2IapojpbfK6p1G5IB', 1767367759, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:29:17.994Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:29:18'),
('-7Lg03eE5QXDpjMRMr4lHnRc8JQTjYCr', 1767303697, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:40:44.204Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:40:44'),
('-ylseKEiQnxAPq5p-kMiPg7nlV7-r2tZ', 1767351006, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:58:11.245Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:58:11'),
('06YQCz8nnGsBEj21lR_XjzPjmyUAQBs9', 1767350129, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T10:28:36.382Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 14:28:36'),
('08DUbrGV6c4cFETv3MVxUOIXa_NCETyp', 1767338929, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:28:48.614Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:28:48'),
('09T863TiVFxjsFkaJE0NAFi_IMte5Ehn', 1767359478, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:11:11.122Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:11:11'),
('1AFN1n7E5ZJM-BDqUBIHFJ6rmGeYWC8z', 1767339488, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T06:47:08.327Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:47:08'),
('1Urykc8a4EL8VTmJo1MMZ-RC8XMmSPoB', 1767326224, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T03:57:02.472Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 07:57:02'),
('4MHyxSV_PZvToLHMGraNhuYpN7mTBDm-', 1767338931, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:28:49.735Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:28:49'),
('4UuFizEFDDq14NmPidwGrkxburDae4ry', 1767350373, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T10:39:33.362Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 14:39:33'),
('5_dHVdMxZYhWzv0wnvZ7PvZAgTP-8HcY', 1767329259, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T04:47:33.793Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 08:47:33'),
('50SOl8SUqsGhHWD6CuRtFCPShFrpldpy', 1767337258, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:00:51.897Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:00:52'),
('5APwmuZPgmDOwNrn6GgwQ0eAJPmHZre1', 1767345557, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T08:53:17.589Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 12:53:17'),
('5ZLlqjwzrK0f1VyAmHBKokcwR7T0efsU', 1767307276, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T22:41:16.012Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 02:41:16'),
('6Cvo-KwTPGcYmyIA7swFY91xXS-GqwG1', 1767345516, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T09:18:36.073Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 13:18:36'),
('6R1RIxYgFjXmMuIKYlzYfnCUnFSEoU5n', 1767351112, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T10:51:51.804Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 14:51:51'),
('6zNJNGMyIi7XiGXsEvKi_VeLpWVOUrBO', 1767332583, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:43:03.202Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:43:03'),
('7c_gdCbuUqmsN9bcVZ53LqfPcheG8Kjb', 1767367598, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:20:30.238Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:20:30'),
('7Yo2U0ExLm0fmFaLFgJzM2kzdmJUPBud', 1767348378, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T10:06:16.811Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 14:06:16'),
('8Br5IG5yAUONExFrnOkjukkn36jdk14A', 1767363629, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T14:20:29.126Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 18:20:29'),
('91g9aJoIb0ijlnFywS2CAsgTswXERSrE', 1767310148, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T23:29:07.022Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 03:29:07'),
('93MStkkt95DB_or1KB8n4_iK8ZWjAOXx', 1767342832, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T08:33:52.095Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 12:33:52'),
('9fBUk6e63BOHhpGLkYscM-XUP3t3MqYM', 1767294858, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T19:14:16.702Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 23:14:16'),
('9FlcGEK40OVX5Kf8iGrtTp_zMmIQlNvl', 1767346273, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T09:29:34.373Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 13:29:34'),
('9kgUGR-HMV5_IeUTWR9I2z8A7KciLrv_', 1767326287, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T03:58:07.040Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 07:58:07'),
('9rRZT5MMncnvg3sXduwWx69P5FnQUqAP', 1767331569, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:26:08.979Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:26:09'),
('9v75Q_4VVwu9x-LB6bHEuOUESJ0fta6x', 1767364123, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T14:21:24.460Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 18:21:24'),
('b7ib0B7NzmwZXDQ0C8k1DAs6f4-5x5I1', 1767344431, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T09:00:21.001Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 13:00:21'),
('BGfm8JTF4fbACkfwU8WtrmX_LKFVGMXJ', 1767328741, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T04:38:35.159Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 08:38:35'),
('BHG1Dn5qyKjwYWvEShB5_WgJHu2MzOtl', 1767300180, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T20:42:03.191Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 00:42:03'),
('bHh228DBYwKJng2JK40VV1SdqW4P8uv8', 1767303112, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:31:49.341Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:31:49'),
('C6rtFf76KFQnB4a8WZCUX4wJ2VI9Ri-D', 1767343563, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T08:46:01.739Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 12:46:01'),
('c94EpXpDj-HZjnwZdVjIAoOLSVaa29Iz', 1767333483, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:51:56.708Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:51:56'),
('CdZFicy8o1GU5bMOKx8RZOJH0eMsxOtE', 1767343561, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T08:46:00.820Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 12:46:00'),
('CigysUUZqdbpUYPEfymN3dUY9stszs3Q', 1767333660, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T06:00:59.866Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:00:59'),
('clvga0w-6_1Xh4gFOm_8emy_YxuN-RqJ', 1767323709, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T03:15:09.334Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 07:15:09'),
('cpEnRHgsLenYOV1xHlQ2XIIu4uUHYCsA', 1767305502, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T22:11:41.580Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 02:11:41'),
('CXc0WPxXK66HWFTcnkQT088VPGXLRV6w', 1767362731, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:20:43.997Z\",\"httpOnly\":true,\"path\":\"/\"},\"admin\":true,\"adminUsername\":\"presido\",\"flash\":{}}', '2026-01-01 17:20:39'),
('cxD3MxqMJrVDkUzJ9c3-lsiQGvghQ0oJ', 1767345518, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T09:18:36.968Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 13:18:37'),
('d8043yZ2TlsDJAWjyBTJDDdPsPzgeTGy', 1767362439, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T14:00:19.757Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 18:00:19'),
('dIqqgyuhVeYlaOqK869vZkWyURIn0WaK', 1767309587, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T23:19:47.245Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 03:19:47'),
('dnUmrOtcrfXf3Rp-d00Ym7L1wu9QFi0C', 1767318543, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T01:46:44.458Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 05:46:44'),
('DyaAYaiF1FahcgiNdKxYhkxYMANyObI0', 1767302184, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:16:24.479Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:16:24'),
('Dzvw6T32Cz5yWedMjknJkIAqHeWiNPz6', 1767367445, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:24:04.144Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:24:04'),
('E_7nCJzmm9pm9IwkhPwLZBF2f8NRAMY7', 1767304442, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T09:42:38.054Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 13:42:38'),
('efB2eSHy8SKOM8QN6rN0Xl4KYQXXD7hc', 1767302120, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:15:14.251Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:15:14'),
('EgJ698WxlKzffetU0r7W5ae_Mf_Lo1Sh', 1767306671, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T22:31:10.875Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 02:31:10'),
('ElrRETVI5buyBqJ6jvgDv3Ui3lkamZ0C', 1767294856, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T19:14:15.645Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 23:14:15'),
('eT-Osq9fDTTV9kHE3CayLxmjtUeyQZja', 1767364633, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T14:37:12.916Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 18:37:13'),
('EZhLD5P5g_nvHb9-KxhrA8lkYY09YokV', 1767361758, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T11:36:29.331Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 15:36:29'),
('f_xOK9fNSLLT2_0Df1kRsunMrka7hvNO', 1767343563, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T08:46:01.657Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 12:46:01'),
('f-j_fyDfmrc9kX3H6Fc1VjN7qzWSwla9', 1767340449, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:54:09.070Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:54:09'),
('F7wPTiO4Xxo1Zm1b_bVhzj2tSQnuFmgv', 1767303700, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:41:40.425Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:41:40'),
('fAACkGFCY6inZiJO09dcwFygVa0twImo', 1767333243, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:54:03.159Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:54:03'),
('FdffPv_CCoxy9xXNpTmc4ZEJVtVAtYQG', 1767320587, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T02:23:00.615Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 06:23:00'),
('fIWqAWq5B5IWXbQbH9yioArXTTvWCSb3', 1767329795, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T04:56:35.306Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 08:56:35'),
('G6j9giVoWQtzNs5bygEJfOMlK5BkM37Q', 1767354816, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T11:52:43.376Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 15:52:43'),
('GEedEFC2iA7dGL3OH657fsfeuaeuMveV', 1767363204, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T14:13:20.633Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 18:13:20'),
('gkIwxUo0pir0qiC9Xj1llHPrkwDkJWXi', 1767326226, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T03:57:03.797Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 07:57:03'),
('GQvdcP-KeHn0Hw03FG1hsj4N_mZ0ECUp', 1767357735, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T12:40:43.760Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 16:40:43'),
('gRuuo3qVq8YXmthQUJf1Cjm0PJYDcdjL', 1767359358, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:09:17.522Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:09:17'),
('GZitekxRvDQ-74xi4iHy6VxnR6JfKIAG', 1767303703, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:41:41.896Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:41:42'),
('H4OJItBA4th20HINltN1zcDb7Lr2WWbW', 1767349476, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T10:09:38.099Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 14:09:38'),
('HgVRqayWxJzEv9daNFNwXJSD-5v3OUov', 1767297043, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T19:50:40.805Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 23:50:40'),
('hRoN7TqxkOGKL8SXXFvw-eSiaJQ2fZHy', 1767360262, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:22:04.652Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:22:04'),
('I1Doq9ExAtmtqSKiRJFYP0ig5iSnM8y4', 1767332584, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:43:04.427Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:43:04'),
('I5RAW6QUDrYUrg1BgJsyjy1cD-9IL5Fw', 1767361325, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:42:04.995Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:42:05'),
('iAVUQgjhYP9nOV4Z3rEcsxCuvVGY5uYt', 1767356988, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T17:38:11.676Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 21:38:11'),
('iBCa5m8tA7wGF0qSQGf0sffCHA99XCvC', 1767343459, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T08:44:18.999Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 12:44:19'),
('iH7HJmL86AoLsdLBKqFtwEUSJXRmHFKU', 1767358023, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T12:45:19.367Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 16:45:19'),
('IwK7F5NtEobjSzR_7IkqjtwKfURySf_o', 1767367445, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:24:04.181Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:24:04'),
('J4axKcE0ynSp82tXqP_zhSjwNvd4Dbo8', 1767300874, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T20:54:34.287Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 00:54:34'),
('jgc4kES8Snd9eJhLvsULgMg0wgdf7RvJ', 1767366194, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:03:12.849Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:03:12'),
('JMglxV7ZvfytjIYmfBrlc65Trs5An-by', 1767318450, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T01:47:29.500Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 05:47:29'),
('jQCnayPintb2LyunlWBO9mygicSe2JGL', 1767333345, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:55:42.278Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:55:42'),
('jrhw60KwfBM-jrU9QQVuYuH-S56EDD6C', 1767301646, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:07:21.961Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:07:22'),
('jZTnPQvP90nNHHgrZXOm6DYuN47qJ1-i', 1767328711, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T04:38:30.600Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 08:38:30'),
('K2eZJ4-aQBvYETR7ur_GekWz1naZcjWJ', 1767309147, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T23:12:26.943Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 03:12:27'),
('kqleSswlYgco67LXxyFfLQGPHWvdBriq', 1767335605, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T06:33:24.501Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:33:24'),
('KR4yx58GNdoyVJBWTEt-e8Yn_A_4u4A8', 1767363285, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T14:14:09.111Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 18:14:09'),
('kVQzedLxx1lyTPLQNxtP_iEw9HV8m8pE', 1767340451, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:54:09.938Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:54:10'),
('L4RZ22yMy01dadOWVqFwom0yAAEevMyY', 1767328759, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T04:39:19.010Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 08:39:19'),
('LCfjIsPOkExU8Cpf8RQpEpN6dRHqP5ae', 1767345512, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:44:39.947Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:44:40'),
('LjarRWf9Q8TatkLhHdv0k8u7QFFUvo-1', 1767327627, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T13:24:14.412Z\",\"httpOnly\":true,\"path\":\"/\"},\"admin\":true,\"adminUsername\":\"presido\",\"flash\":{}}', '2025-12-31 17:24:10'),
('LXl-kxGfuCNXHXC4vaQQ83CPw4UJ8h2m', 1767362902, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T20:50:42.357Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 00:50:42'),
('lXPO6LlMc-SKJ80Cvt-YS1uCoq82T-7r', 1767336875, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T06:54:35.431Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:54:35'),
('mY9IZQDrIvDGUdfsPHJd2U1c7hvYRix_', 1767295046, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T18:31:39.876Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 22:31:39'),
('n48aSLNn-NY6nMO8iLV87bfh77eOzA4f', 1767302185, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:16:25.430Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:16:25'),
('NBcHuendO261XQHt0znZG6ToJFXeNSJK', 1767334091, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T06:06:56.331Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:06:56'),
('nBncQvCOAThZipSy7g0cSL_Wryy9b7IQ', 1767300685, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T20:51:25.419Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 00:51:25'),
('nCBYy6GqHYxYZpE78f9zzi3vQNQcYWP-', 1767328691, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T04:37:46.408Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 08:37:46'),
('ND35jOOxCQLGYSrKuulWrYWWtBudon9e', 1767352205, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T11:10:04.534Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 15:10:04'),
('NY10EHiuir8S4qGVr59gZYr_42UjMddm', 1767296123, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T19:35:19.723Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 23:35:19'),
('OjNRMhOMB9Jqg6kQ_Yzhh9a6uXJLoHSe', 1767339214, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:27:30.773Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:27:30'),
('OQQhGspBBaeCPx8TpAivuzjqw5_HuJB5', 1767351206, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T10:53:26.212Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 14:53:26'),
('P686oU0bg6woP8YymZ8dRbZ5fuXgznQv', 1767333669, '{\"cookie\":{\"originalMaxAge\":71999999,\"expires\":\"2026-01-02T06:01:07.658Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:01:07'),
('P7Z2bk_QDOv49U6Adn3KGh5-kBoVIpnl', 1767332585, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:43:05.299Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:43:05'),
('PE-jYpHO1YqjYcFFcO5PC6nHpLizGNih', 1767342416, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T08:26:56.310Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 12:26:56'),
('pGaKh2yIcBUPKmQmeVlqzkzgI8MVjdm3', 1767343906, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T08:48:46.254Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 12:48:46'),
('pIQARQCPIj0g66dSpGgnMJT1KdIGVpfI', 1767358163, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T12:39:13.638Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 16:39:13'),
('pLwu4_2bUaDIH7ezaGlKRZjKxgoTCcvN', 1767333809, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T06:02:26.157Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:02:26'),
('PUfyKywBREpgYH-fb6FRH0oSeoacjL04', 1767345057, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T09:10:55.280Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 13:10:55'),
('q2F_y78G7EvoKbVh8k4Kj7v17O3OWmFW', 1767323709, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T03:15:08.876Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 07:15:08'),
('q3sZ0ihnm2V-SnIZbjFqPsvDCmu5edig', 1767321957, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T02:45:55.554Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 06:45:55'),
('QHtxRT5OkDI_AzEW5zdKCncRFFk_h8s8', 1767366171, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:02:51.088Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:02:51'),
('qZySD1_wppg9oAnVoSWBZDVOCLSirNRd', 1767321030, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T02:21:07.782Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 06:21:07'),
('rArO88qkWtKH7XwclNY4D2dsY4esEBDu', 1767299071, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T17:03:14.878Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 21:03:14'),
('rhwUZyiaUZ6pGLsn7jptkwfpPbnrlHRp', 1767361493, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:44:52.545Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:44:52'),
('rnkGA7yto5ef5RaK6OKLzTBFuEVvXpsi', 1767354097, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T10:29:18.979Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 14:29:19'),
('RZ0p4rAAvoyH-E0iy9bPD1f54YfQvC3W', 1767361288, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:41:27.919Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:41:28'),
('ser4avQ5bhlNgslWwIGdL6IeK3Mpy7cO', 1767332583, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:43:02.860Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:43:02'),
('SGecxNJDxv_tTF8zukm9uj4bQby7iepJ', 1767333660, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T06:00:59.933Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:01:00'),
('SJpcVhsxNKXN1w2kja6qJTDK50pfZ_Kx', 1767320027, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T12:16:12.453Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 16:16:12'),
('smaCpHGc6nMKrdiTpIYjJcP4LBfVgPDs', 1767338930, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:28:49.440Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:28:49'),
('srPZZ1twXAyEOOZQ6JBUPUHsfX4dL_se', 1767357661, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T12:41:00.498Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 16:41:00'),
('sSj5KzXnAlzybIP2E21QvFqhco4Edoap', 1767357661, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T12:41:00.499Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 16:41:00'),
('su6FUEAA6rxpE1egQFr0mm3FC9kZBYb9', 1767350379, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T10:39:39.114Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 14:39:39'),
('t95DVBtRjdJGh57m3kKGhRsEC1PocerC', 1767302389, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:19:47.021Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:19:47'),
('ToveNilDlTsg8ribZBcrayNf603g7a-L', 1767294857, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T19:14:16.649Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 23:14:16'),
('U31hSr8qb7XBr21EI7EB9iKv5yu_LozC', 1767295966, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T19:27:26.756Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 23:27:26'),
('udzubAEibPASpqRIWkR2TYZREzLDeO3d', 1767332583, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:43:02.670Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:43:02'),
('UE7dEObPHZzIz7_LlE4hxaaWdqhC6AYg', 1767358901, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:01:40.597Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:01:40'),
('uGbOIguQpoN9Yb8nTgw3nwUQjMz84Ak7', 1767356132, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T12:15:26.841Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 16:15:26'),
('uGdEsCoG1u71OJrbOeKlIVj7eJPS5Hql', 1767353225, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T18:33:01.510Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 22:33:01'),
('UPA6FqK9GseVfKZFfuv7bnZrFJv2spu9', 1767333248, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T05:54:04.128Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 09:54:04'),
('usg5_AbuwE8aw0ppx5L4ba8H6WA1DT-_', 1767337940, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:12:20.497Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:12:20'),
('V2EdZueJhq3ZDLVyq3rECQqbLMvvHTUx', 1767357550, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T12:37:50.939Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 16:37:51'),
('vCYoyZ_hbhRf2GaYs5tf6Nzxihl1OYtM', 1767327397, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T04:15:48.208Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 08:15:48'),
('Vfk58cc1O0PTNl1dwVJQJ7ibHd07qgnz', 1767366485, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T20:54:39.896Z\",\"httpOnly\":true,\"path\":\"/\"},\"admin\":true,\"adminUsername\":\"presido\",\"flash\":{}}', '2025-12-31 09:22:24'),
('vGmyLWJhiGyAtJpog4gLcwf3NXGtUVWP', 1767328717, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T04:32:52.948Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 08:32:53'),
('vJ8GQoqsebXPx5HLd184JdTBSb-7Y_9R', 1767346728, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T09:38:48.233Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 13:38:48'),
('VKID48YC9ndQuQ5DnGRWMyxMNZ0NC453', 1767367915, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:30:49.237Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:30:49'),
('VlR2QPHUqKSPSGwy9PhkFOnJ1CBT-udj', 1767303703, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T21:41:41.688Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:41:41'),
('VyzdzLU5BdIitq92SAQVBQAf1UuY9JAu', 1767346153, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T09:24:26.508Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 13:24:26'),
('whwbks25KjFBn3jsV2_hVOTJ8dk3W1Vx', 1767334783, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T06:19:13.050Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 10:19:13'),
('wRlt3jt8MXF-wOqJCRdnotP-2cinKn_V', 1767295572, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T19:26:12.497Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 23:26:12'),
('WSJ29Gf_9hiIrjTxNIJqNawdE8fyip3B', 1767302377, '{\"cookie\":{\"originalMaxAge\":71999999,\"expires\":\"2026-01-01T21:19:32.337Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 01:19:32'),
('Ww5i4xAv2igQGdSPBXeMfzYncAG2CRAV', 1767300840, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T20:53:56.576Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 00:53:56'),
('X-KjCWmsPjuV9X13U-NBL-NwUggYQC4L', 1767367256, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:19:43.846Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:19:43'),
('xERi_qL5aemghrfQ3sguc99X8W3WUVJ4', 1767301215, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T15:31:48.444Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 19:31:48'),
('xGD5dSvGfBREIAAO5-ozzVe6YVhxBII8', 1767367443, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:24:03.329Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:24:03'),
('xrufQUwpXEZTgkg30W6cWY_Dsatp86Z0', 1767358902, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:01:41.469Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:01:41'),
('Y4AwA5p45CBMdTpdGb3mM-4cCjuC4MlR', 1767358902, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:01:41.427Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:01:41'),
('Y6WZG0D0VW9UY_ZxyfD54TVxKxqbzbvr', 1767357222, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T12:33:42.140Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 16:33:42'),
('yBaoi1D-0kEiQ1aVOV-ly5g-w_xiRI6U', 1767325540, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T03:45:26.492Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 07:45:26'),
('yJSTuzGwxa4NaUzdSpJMM4aCi2RWDEyv', 1767359463, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T13:11:02.037Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 17:11:02'),
('YqOOFxLXla1MN1-sPaCno6xIiGzvugrC', 1767345518, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T09:18:36.952Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 13:18:37'),
('YYbgknF2ayvp3232S4dE8tYTKE793I7-', 1767338092, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:14:52.096Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:14:52'),
('Yz4v6xj3vDOoL6zUPwJ2IBs8GcpRDfFB', 1767367516, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T15:25:08.983Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 19:25:09'),
('ZAImEA2h55LJ1EmfzyyqYk008HtkR08a', 1767315325, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-01T07:47:39.868Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2025-12-31 11:47:39'),
('zczcfmxsl6Dr7e5bMjGRrLdr2SMN1cvP', 1767340451, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T07:54:10.290Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 11:54:10'),
('zFgwWxv4konQPDiJp8t2t0a6rbgaBasI', 1767357660, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T12:40:59.588Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 16:40:59'),
('ZWwKbXURmoKtiG_JYKu9Vf9dD3nhSvL0', 1767325052, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T03:37:29.041Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 07:37:29'),
('zX7r0LUBEvvDpKiJ8m1KmF8zJWXTu-wr', 1767365490, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T14:51:30.051Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 18:51:30'),
('ZYcjel7ANIWPPzG0WFItdyx0Ykmv94PN', 1767343882, '{\"cookie\":{\"originalMaxAge\":72000000,\"expires\":\"2026-01-02T08:44:38.980Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}', '2026-01-01 12:44:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_award_title` (`title`);

--
-- Indexes for table `award_contestants`
--
ALTER TABLE `award_contestants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_contestant_award` (`contestant_id`,`award_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contestants`
--
ALTER TABLE `contestants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contestants_votes` (`votes`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contestant_id` (`contestant_id`),
  ADD KEY `award_id` (`award_id`),
  ADD KEY `idx_payments_status` (`status`),
  ADD KEY `idx_payments_date` (`payment_date`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `award_contestants`
--
ALTER TABLE `award_contestants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `contestants`
--
ALTER TABLE `contestants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `award_contestants`
--
ALTER TABLE `award_contestants`
  ADD CONSTRAINT `award_contestants_ibfk_1` FOREIGN KEY (`contestant_id`) REFERENCES `contestants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `award_contestants_ibfk_2` FOREIGN KEY (`award_id`) REFERENCES `awards` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`contestant_id`) REFERENCES `contestants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`award_id`) REFERENCES `awards` (`id`) ON DELETE CASCADE;
--
-- Database: `defaultdb`
--
CREATE DATABASE IF NOT EXISTS `defaultdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `defaultdb`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
