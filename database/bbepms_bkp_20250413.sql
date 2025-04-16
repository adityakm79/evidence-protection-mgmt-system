-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2025 at 04:34 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbepms`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add department', 7, 'add_department'),
(26, 'Can change department', 7, 'change_department'),
(27, 'Can delete department', 7, 'delete_department'),
(28, 'Can view department', 7, 'view_department'),
(29, 'Can add evidence', 8, 'add_evidence'),
(30, 'Can change evidence', 8, 'change_evidence'),
(31, 'Can delete evidence', 8, 'delete_evidence'),
(32, 'Can view evidence', 8, 'view_evidence');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(1, 'MBA Department'),
(2, 'B.farma Department'),
(3, 'B.tech Department'),
(4, 'D.farma Department');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'Evidence', 'department'),
(8, 'Evidence', 'evidence'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-12-21 08:23:11.482789'),
(2, 'auth', '0001_initial', '2024-12-21 08:23:20.679314'),
(3, 'admin', '0001_initial', '2024-12-21 08:23:25.223321'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-12-21 08:23:25.326907'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-21 08:23:25.391207'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-12-21 08:23:26.877837'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-12-21 08:23:27.690373'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-12-21 08:23:27.846659'),
(9, 'auth', '0004_alter_user_username_opts', '2024-12-21 08:23:27.893519'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-12-21 08:23:28.596698'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-12-21 08:23:28.643547'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-12-21 08:23:28.690429'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-12-21 08:23:28.831085'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-12-21 08:23:29.018594'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-12-21 08:23:29.299829'),
(16, 'auth', '0011_update_proxy_permissions', '2024-12-21 08:23:29.659228'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-12-21 08:23:30.065495'),
(18, 'sessions', '0001_initial', '2024-12-21 08:23:30.581175'),
(19, 'Evidence', '0001_initial', '2025-04-09 19:15:08.501672');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1gg7lz8ud0o89xwwi70upighpe4vx2f0', 'e30:1tPdZ8:Mp1ndAgblyRpo7ZAJMV_YHrfDyIgleBgVtfXskVG3IU', '2025-01-06 08:13:26.140147'),
('3eqg4iw8emnd7ojtpwu1r6te3yzw2my9', 'eyJpZCI6MSwibmFtZSI6IkFkaXR5YSBLdW1hciBNYXVyeWEiLCJlbWFpbCI6ImFkaXR5YWttNzlAZ21haWwuY29tIn0:1ts4JA:BT9js9gV2E1wO0cY10jBSRyBmD9IEf191A_pZvJBdQU', '2025-03-25 18:26:28.169100'),
('e0lf3wb4b7mno0656ywfscf6tu3cbzq5', 'eyJ2ZXJpZmljYXRpb25fY29kZSI6ImQ4MDM3IiwiZXZpZGVuY2VpZCI6IjE2In0:1u392p:2wQMSj2rhfZ1v7O1ZDyTAxTLF0csY6hXVDh-cWTWhXQ', '2025-04-25 07:43:23.187529'),
('ggx7xvdub6w0otqgwx6ixjdxcugw99yza', 'eyJpZCI6MiwibmFtZSI6IkFkaXR5YSBLdW1hciIsImVtYWlsIjoiYWRpdHlha203OUBnbWFpbC5jb20ifQ:1tOuxa:kQmzTIFOmmHrdTRQkGxFE9Hqnw2oU6NJruwTJhiP6CQ', '2025-01-04 08:35:42.440600'),
('l05xjn21kfihc34funmgdwn8pqn1u3a2', 'e30:1ta9ev:3ri0-gqOypYE4Csx21nhVU09N-GGsZyldTBi9xwLcSg', '2025-02-04 08:30:53.405463'),
('o1aeyxaebk0mmlilsa2zh7jma4jpwqwd', 'eyJldmlkZW5jZWlkIjoiMTUifQ:1u3ITP:Z76dtKN5clp94YStFWHF7bUZppFp20iG-d-HUKxBJug', '2025-04-25 17:47:27.758171'),
('ovyuh5flrp51ov5rvkbyjvvc6e0lzy6j', 'e30:1thV7u:aVRhqp2A5PtpZinIBpD8-s7gZSBDKUaaB_5TyQuG_5U', '2025-02-24 14:51:10.280371'),
('p8cbbr3i23gjb9va9oiuvh5pgd5kk4nm', 'eyJpZCI6MSwibmFtZSI6IkFkaXR5YSBLdW1hciBNYXVyeWEiLCJlbWFpbCI6ImFkaXR5YWttNzlAZ21haWwuY29tIn0:1tpS7y:2Rz9vEKJlrF4L-xKFFdu3C8BZdouqkbgpMWZ2jYqO1U', '2025-03-18 13:16:06.691682'),
('qpao0s08ayvcclt6n2r96qj621s1zetk', 'eyJpZCI6NiwibmFtZSI6IlN1cmFqIEt1bWFyIE1hdXJ5YSAiLCJlbWFpbCI6InN1cmFqODZAZ21haWwuY29tIn0:1tgRpz:6wHk57TzTSh1l_sHsNX5itOH1A2MyjGBGDHmWoscbHI', '2025-02-21 17:08:19.203321');

-- --------------------------------------------------------

--
-- Table structure for table `evidence`
--

CREATE TABLE `evidence` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `system_filename` varchar(200) NOT NULL,
  `uploaded_filename` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evidence`
--

INSERT INTO `evidence` (`id`, `from_user_id`, `to_user_id`, `system_filename`, `uploaded_filename`, `created_at`) VALUES
(1, 1, 6, 'evidence_20250125_111657_453929.jpg', 'Aadhaar.jpg', '2025-01-25 11:16:57'),
(2, 1, 6, 'evidence_20250125_123548_987978.jpg', 'aditya.jpg', '2025-01-25 17:35:48'),
(3, 1, 6, 'evidence_20250125_123610_872055.pdf', '10th Result 20, 2022.pdf', '2025-01-25 12:36:10'),
(4, 6, 1, 'evidence_20250125_123629_427369.pdf', 'DT20256505616_Application tcs.pdf', '2025-01-25 12:36:29'),
(7, 6, 3, 'evidence_20250125_183513_059143.pdf', 'aditya aktu Payment Reciept 2024.pdf', '2025-01-25 18:35:13'),
(8, 6, 1, 'evidence_20250127_145909_636060.pdf', 'aditya pen card.pdf', '2025-01-27 14:59:09'),
(9, 6, 1, 'evidence_20250127_151933_208776.jpg', 'deepak_adhaar1.jpg', '2025-01-27 15:19:33'),
(10, 1, 14, 'evidence_20250307_203947_578909.pdf', 'Scholarship 2022 aditya.pdf', '2025-03-07 20:39:47'),
(11, 1, 14, 'evidence_20250307_211508_661098.pdf', 'Scholarship 2022 aditya.pdf', '2025-03-07 21:15:08'),
(12, 1, 14, 'evidence_20250307_212811_139661.pdf', '10th Result 20, 2022.pdf', '2025-03-07 21:28:11'),
(13, 1, 14, 'evidence_20250307_212855_305016.jpg', 'Aadhaar - Copy (2).jpg', '2025-03-07 21:28:55'),
(14, 1, 1, 'evidence_20250307_213034_286045.jpg', 'Aadhaar - Copy (2).jpg', '2025-03-07 21:30:34'),
(15, 1, 1, 'evidence_20250307_213137_468940.jpg', 'Aadhaar - Copy.jpg', '2025-03-07 21:31:37'),
(16, 1, 5, 'evidence_20250311_235714_058972.pdf', '10th Result 20, 2022.pdf', '2025-03-11 23:57:14'),
(17, 1, 5, 'evidence_20250311_235900_718623.pdf', '10th Result 20, 2022.pdf', '2025-03-11 23:59:00'),
(18, 1, 5, 'evidence_20250311_235911_144858.pdf', '10th Result 20, 2022.pdf', '2025-03-11 23:59:11'),
(19, 1, 1, 'evidence_20250316_001130_823665.jpg', 'Aadhaar.jpg', '2025-03-16 00:11:30'),
(20, 1, 5, 'evidence_20250321_214818_404380.jpg', 'Aadhaar - Copy (2).jpg', '2025-03-21 21:48:18'),
(21, 1, 5, 'evidence_20250321_220350_376375.jpg', 'IMG20220711112032 (1).jpg', '2025-03-21 22:03:50'),
(22, 1, 5, 'evidence_20250321_220545_011528.jpg', 'IMG20220711112032 (1).jpg', '2025-03-21 22:05:45'),
(23, 1, 5, 'evidence_20250321_220702_942405.jpg', 'IMG20220711112032 (1).jpg', '2025-03-21 22:07:02'),
(24, 1, 5, 'evidence_20250321_220823_177252.jpg', 'IMG20220711112032 (1).jpg', '2025-03-21 22:08:23'),
(25, 1, 5, 'evidence_20250321_221246_604896.jpg', 'IMG20220711112032 (1).jpg', '2025-03-21 22:12:46'),
(26, 1, 5, 'evidence_20250321_221403_677909.jpg', 'IMG20220711112032 (1).jpg', '2025-03-21 22:14:03'),
(27, 1, 5, 'evidence_20250321_221545_299711.jpg', 'IMG20220711112032 (1).jpg', '2025-03-21 22:15:45'),
(28, 1, 5, 'evidence_20250321_222537_573447.pdf', '10th Result 20, 2022_11zon.pdf', '2025-03-21 22:25:37'),
(29, 1, 5, 'evidence_20250321_222801_948113.jpg', 'Aadhaar - Copy (2).jpg', '2025-03-21 22:28:01'),
(30, 1, 5, 'evidence_20250321_223601_461294.jpg', 'Aadhaar - Copy (2).jpg', '2025-03-21 22:36:01'),
(31, 1, 5, 'evidence_20250321_224013_999247.pdf', '10th Result 20, 2022.pdf', '2025-03-21 22:40:14'),
(32, 1, 5, 'evidence_20250321_230329_361838.jpg', 'aditya - Copy.jpg', '2025-03-21 23:03:29'),
(33, 5, 1, 'evidence_20250321_230829_434873.jpg', 'aditya.jpg', '2025-03-21 23:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `reset_token` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `department_id`, `name`, `email`, `password`, `reset_token`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 1, 'Aditya Kumar Maurya', 'adityakm79@gmail.com', 'aditya@123', '', '9598690086', '2024-12-21 06:47:41', '2025-04-11 09:27:09'),
(2, 3, 'shashwat mishra', 'shashwat089@gmail.com', '7618034011', '', '7618034011', '2024-12-23 04:05:47', '2025-01-23 15:52:05'),
(3, 2, 'jyoti sharma', 'js406@gmail.com', '123456', '', '8738822619', '2024-12-23 08:12:26', '2025-01-23 15:52:12'),
(5, 3, 'Monu Maurya', 'monukm199997@gmail.com', 'monu@123', 'I9rD5DJ1HYgvdnwUVCYT3Zw8KrcMWT', '9598346769', '2025-03-11 18:26:13', '2025-03-28 17:56:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `evidence`
--
ALTER TABLE `evidence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `evidence`
--
ALTER TABLE `evidence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
