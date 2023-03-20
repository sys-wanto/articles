-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 20 Mar 2023 pada 13.51
-- Versi server: 8.0.32
-- Versi PHP: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `articles`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `articles_posts`
--

CREATE TABLE `articles_posts` (
  `Id` int NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Content` longtext NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Created_date` datetime(6) NOT NULL,
  `Updated_date` datetime(6) NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `articles_posts`
--

INSERT INTO `articles_posts` (`Id`, `Title`, `Content`, `Category`, `Created_date`, `Updated_date`, `Status`) VALUES
(1, 'test dev', 'test\r\ntest\r\ntest\r\ntest\r\ntest', 'test', '2023-03-18 11:34:17.635635', '2023-03-18 11:34:17.635635', 'PUBLISH'),
(2, 'test dev 2', 'test2', 'test', '2023-03-18 11:40:07.187221', '2023-03-18 11:40:07.187221', 'PUBLISH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add posts', 1, 'add_posts'),
(2, 'Can change posts', 1, 'change_posts'),
(3, 'Can delete posts', 1, 'delete_posts'),
(4, 'Can view posts', 1, 'view_posts'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add posts', 8, 'add_posts'),
(30, 'Can change posts', 8, 'change_posts'),
(31, 'Can delete posts', 8, 'delete_posts'),
(32, 'Can view posts', 8, 'view_posts');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(1, 'articles', 'posts'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(8, 'Posts', 'posts'),
(7, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-18 11:33:38.555335'),
(2, 'auth', '0001_initial', '2023-03-18 11:33:38.774026'),
(3, 'admin', '0001_initial', '2023-03-18 11:33:38.841792'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-18 11:33:38.848792'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-18 11:33:38.853792'),
(6, 'articles', '0001_initial', '2023-03-18 11:33:38.861792'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-03-18 11:33:38.901792'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-03-18 11:33:38.930795'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-03-18 11:33:38.943791'),
(10, 'auth', '0004_alter_user_username_opts', '2023-03-18 11:33:38.948832'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-03-18 11:33:38.979793'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-03-18 11:33:38.981792'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-03-18 11:33:38.987792'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-03-18 11:33:39.017796'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-03-18 11:33:39.043792'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-03-18 11:33:39.054795'),
(17, 'auth', '0011_update_proxy_permissions', '2023-03-18 11:33:39.059794'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-03-18 11:33:39.089793'),
(19, 'sessions', '0001_initial', '2023-03-18 11:33:39.107794'),
(20, 'articles', '0002_alter_posts_category_alter_posts_content_and_more', '2023-03-18 11:51:36.857836'),
(21, 'articles', '0003_alter_posts_category_alter_posts_content_and_more', '2023-03-18 11:56:30.997971'),
(22, 'Posts', '0001_initial', '2023-03-20 11:20:36.475580'),
(23, 'Posts', '0002_alter_posts_category_alter_posts_content_and_more', '2023-03-20 11:20:36.480580'),
(24, 'Posts', '0003_alter_posts_category_alter_posts_content_and_more', '2023-03-20 11:20:36.485614'),
(25, 'Posts', '0004_alter_posts_category_alter_posts_content_and_more', '2023-03-20 11:20:36.490613');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts_posts`
--

CREATE TABLE `posts_posts` (
  `Id` int NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Content` longtext NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Created_date` datetime(6) NOT NULL,
  `Updated_date` datetime(6) NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `posts_posts`
--

INSERT INTO `posts_posts` (`Id`, `Title`, `Content`, `Category`, `Created_date`, `Updated_date`, `Status`) VALUES
(1, 'Box charge century still region.', 'Response trial job drop skin. Business guy stage score four remain who.\nDespite senior memory authority song. Scientist citizen foot something forget particular many open.', 'Congress modern guy. Sense write how question.', '1976-02-25 15:37:18.000000', '1984-05-21 02:20:42.000000', 'PUBLISH'),
(3, 'All which themselves away.', 'How mission cultural go sister he. Similar lead their week.\nFew community deal rise. Car degree say eight state great suddenly Mr. Marriage where sing national.', 'Order here thank.', '2002-05-11 20:46:20.000000', '2003-11-30 05:02:59.000000', 'DRAFT'),
(4, 'Author bar issue situation everything such.', 'Eye manager interest century suddenly key specific down. Artist per play pay need their hit. Deal while family his.', 'Allow church young rather. Quickly card she special great authority.', '1975-08-17 02:46:37.000000', '1975-05-28 21:15:14.000000', 'THRASH'),
(5, 'Lead about kid suffer catch election process.', 'Sure discussion dog than consider travel. Property card hope race question might. Quality yourself school loss government lot.', 'Responsibility decade since Democrat benefit go. Eat benefit everyone town mind offer happy.', '1994-07-02 17:50:31.000000', '1972-12-29 20:51:37.000000', 'THRASH'),
(6, 'Argue move all small Democrat quickly.', 'Why along discuss economy. Happen save carry after.\nWear order people party. Doctor least free myself.', 'Keep project parent major recent gas hour. Town teach around market art seem.', '1991-12-26 20:22:36.000000', '2011-11-06 11:55:32.000000', 'DRAFT'),
(7, 'Water give establish difference animal technology.', 'Cold health rich wrong. Physical detail sometimes important wind interest rule.\nPresent star always group care degree. Project hospital account son interview.', 'There high kind. Mrs ahead claim physical.', '2009-12-06 14:02:49.000000', '1977-12-30 16:28:07.000000', 'PUBLISH'),
(8, 'Home response than away before lot.', 'Standard billion stock again professional production bank. Threat scene ball cup remember treatment finish response. Fill employee common focus out care.', 'Even speech field anything something ball democratic. Character set important often.', '2005-05-14 14:55:12.000000', '2015-12-01 02:00:52.000000', 'THRASH'),
(9, 'Week happy support nice road as.', 'Mention former thank. Activity receive religious.\nOld care none paper special pattern. Themselves anything partner including western.', 'Explain center senior stop site. Pass leader friend our general. Them house seem summer.', '1978-07-04 21:55:35.000000', '1997-02-03 02:47:06.000000', 'DRAFT'),
(10, 'Tv us rule manage think talk officer finally.', 'Pull citizen phone up left themselves. Cup TV while what culture.\nEnd meeting yard some pick party participant. Necessary everybody something which. Until official high process son her sing age.', 'Whose new up down respond. History sell recent performance.', '1970-08-19 02:22:58.000000', '1993-07-04 17:21:30.000000', 'THRASH'),
(11, 'Hold assume myself street item general.', 'Might stop herself discuss toward production. Property today week improve PM animal adult. Threat worker appear finish consider beyond ok. Mr reality throw course my.', 'Individual force both. Risk perform contain point which. Strong every attack organization.', '2003-02-03 13:41:11.000000', '1990-12-04 11:22:10.000000', 'DRAFT'),
(13, 'Word actually air.', 'And TV cover citizen magazine our recognize. Walk explain door picture. Tough talk black door seek per.\nFactor from fund left set. Interesting body necessary describe southern head feel consumer.', 'Bit both ability too. Believe eat recently fear.', '1980-10-15 07:15:14.000000', '1983-11-24 10:55:45.000000', 'DRAFT'),
(14, 'Shake special direction challenge to.', 'Rest rate describe.\nLand listen course role recognize record. Role minute space interest better.', 'Phone think cup. Blood customer small which change side.', '2016-06-27 15:48:09.000000', '2006-04-12 16:35:34.000000', 'PUBLISH'),
(15, 'Yeah claim since study avoid meeting.', 'Task feeling space better rule represent space. Lay involve what each stuff answer every. Suggest everyone push various.', 'Prove recently inside voice factor wait. Action hard moment.', '1992-03-18 02:36:00.000000', '1992-11-17 23:08:07.000000', 'THRASH');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `articles_posts`
--
ALTER TABLE `articles_posts`
  ADD PRIMARY KEY (`Id`);

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeks untuk tabel `posts_posts`
--
ALTER TABLE `posts_posts`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `articles_posts`
--
ALTER TABLE `articles_posts`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `posts_posts`
--
ALTER TABLE `posts_posts`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
