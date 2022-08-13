-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 12 2020 г., 18:21
-- Версия сервера: 5.7.25
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- База данных: `lar3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `question_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `right` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`id`, `value`, `question_id`, `created_at`, `updated_at`, `right`) VALUES
(1, 'В Азию, конечно: Мальдивы, Филиппины. Разумеется, пять звезд — и пусть весь мир подождет!', 1, '2020-03-24 19:47:12', '2020-03-24 19:47:12', 0),
(2, 'Нашел отличный дом на итальянском острове — почти как любимая дача, только со свежими морепродуктами. Выезжаю!', 1, '2020-03-24 19:54:51', '2020-03-25 16:06:01', 1),
(3, 'Синие', 2, '2020-03-28 12:47:16', '2020-03-28 12:47:16', 0),
(4, 'Зеленые', 2, '2020-03-28 12:47:41', '2020-03-28 12:47:41', 1),
(5, 'Это одежда', 3, '2020-03-28 12:48:12', '2020-03-28 12:48:12', 0),
(6, 'Для еды', 3, '2020-03-28 12:48:46', '2020-03-28 12:48:46', 0),
(7, 'Для упаковки товара', 3, '2020-03-28 12:49:04', '2020-03-28 12:49:04', 1),
(18, '0111', 4, '2020-04-11 16:45:45', '2020-04-12 10:25:22', 1),
(19, '0110', 4, '2020-04-11 16:45:45', '2020-04-12 10:25:22', NULL),
(20, '0011', 4, '2020-04-12 10:25:22', '2020-04-12 10:25:22', NULL),
(21, '1111', 4, '2020-04-12 10:25:22', '2020-04-12 10:25:22', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-03-18 15:12:31', '2020-03-18 15:12:31'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-03-18 15:12:31', '2020-03-18 15:12:31');

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 0, 0, 0, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(27, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(29, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(30, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(52, 1, 'email_verified_at', 'timestamp', 'Email_verif', 0, 0, 0, 0, 0, 0, '{}', 6),
(53, 7, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(54, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(55, 8, 'value', 'text', 'Value', 0, 1, 1, 1, 1, 1, '{}', 3),
(56, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(57, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(58, 8, 'num', 'text', 'Num', 0, 0, 0, 0, 0, 0, '{}', 2),
(60, 8, 'question_belongstomany_test_relationship', 'relationship', 'tests', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Test\",\"table\":\"tests\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"test_questions\",\"pivot\":\"1\",\"taggable\":\"0\"}', 6),
(61, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(62, 10, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(63, 10, 'test_id', 'text', 'Test Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(64, 10, 'result', 'text', 'Result', 0, 1, 1, 1, 1, 1, '{}', 6),
(65, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(66, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(67, 10, 'user_test_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Personal\",\"table\":\"personal\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"user_id\",\"label\":\"surname\",\"pivot_table\":\"answers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(68, 10, 'user_test_belongsto_test_relationship', 'relationship', 'tests', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Test\",\"table\":\"tests\",\"type\":\"belongsTo\",\"column\":\"test_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"answers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(69, 13, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(70, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(71, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(72, 13, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 4),
(73, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(74, 17, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(75, 17, 'prof_id', 'text', 'Prof Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(76, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
(77, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(78, 17, 'users_profession_hasone_profession_relationship', 'relationship', 'professions', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Profession\",\"table\":\"professions\",\"type\":\"belongsTo\",\"column\":\"prof_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"answers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(79, 17, 'users_profession_hasone_personal_relationship', 'relationship', 'personal', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Personal\",\"table\":\"personal\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"user_id\",\"label\":\"surname\",\"pivot_table\":\"answers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(80, 7, 'test_belongstomany_profession_relationship', 'relationship', 'professions', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Profession\",\"table\":\"professions\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"tests_professions\",\"pivot\":\"1\",\"taggable\":\"0\"}', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Пользователь', 'Пользователи', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-03-18 15:12:24', '2020-04-06 15:43:02'),
(2, 'menus', 'menus', 'Меню', 'Меню', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-03-18 15:12:24', '2020-04-06 15:44:13'),
(3, 'roles', 'roles', 'Роль', 'Роли', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-03-18 15:12:24', '2020-04-06 15:37:02'),
(7, 'tests', 'tests', 'Test', 'Tests', 'voyager-study', 'App\\Test', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-24 14:37:12', '2020-04-12 10:19:59'),
(8, 'questions', 'questions', 'Question', 'Questions', NULL, 'App\\Question', NULL, 'App\\Http\\Controllers\\QuestionAdminController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-08 11:51:54', '2020-04-12 09:18:56'),
(10, 'user_tests', 'user-tests', 'User Test', 'User Tests', NULL, 'App\\UsersTest', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-09 13:23:31', '2020-04-09 13:37:30'),
(12, 'profession', 'profession', 'Profession', 'Professions', NULL, 'App\\Profession', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-04-12 08:34:42', '2020-04-12 08:34:42'),
(13, 'professions', 'professions', 'Profession', 'Professions', NULL, 'App\\Profession', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-12 08:40:47', '2020-04-12 09:01:06'),
(17, 'users_professions', 'users-professions', 'Users Profession', 'Users Professions', NULL, 'App\\UsersProfession', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-12 08:57:25', '2020-04-12 09:09:04');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(2, 'user_menu', '2020-03-02 19:16:24', '2020-03-02 19:16:24');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Панель управления', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-03-18 15:12:24', '2020-04-12 10:50:17', 'voyager.dashboard', NULL),
(2, 1, 'Медиа', '', '_self', 'voyager-images', NULL, NULL, 9, '2020-03-18 15:12:25', '2020-04-12 10:44:31', 'voyager.media.index', NULL),
(3, 1, 'Пользователи', '', '_self', 'voyager-person', NULL, NULL, 7, '2020-03-18 15:12:25', '2020-04-12 10:52:01', 'voyager.users.index', NULL),
(4, 1, 'Роли', '', '_self', 'voyager-lock', NULL, NULL, 8, '2020-03-18 15:12:25', '2020-04-12 10:52:01', 'voyager.roles.index', NULL),
(5, 1, 'Инструменты', '', '_self', 'voyager-tools', NULL, NULL, 10, '2020-03-18 15:12:25', '2020-04-12 10:44:28', NULL, NULL),
(6, 1, 'Конструктор Меню', '', '_self', 'voyager-list', NULL, 5, 1, '2020-03-18 15:12:25', '2020-04-08 11:52:14', 'voyager.menus.index', NULL),
(7, 1, 'База данных', '', '_self', 'voyager-data', NULL, 5, 2, '2020-03-18 15:12:25', '2020-04-08 11:52:14', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-03-18 15:12:25', '2020-04-08 11:52:14', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-03-18 15:12:25', '2020-04-08 11:52:15', 'voyager.bread.index', NULL),
(10, 1, 'Настройки', '', '_self', 'voyager-settings', NULL, NULL, 11, '2020-03-18 15:12:25', '2020-04-12 09:11:46', 'voyager.settings.index', NULL),
(19, 2, 'About user', '', '_self', 'voyager-star', '#000000', NULL, 10, '2020-03-14 15:32:26', '2020-03-28 13:45:52', 'user.index', 'null'),
(20, 2, 'Test', '', '_self', 'voyager-study', '#000000', NULL, 11, '2020-03-14 15:34:32', '2020-03-28 13:42:44', 'user.tests', 'null'),
(21, 1, 'Tests', '', '_self', 'voyager-study', '#000000', NULL, 2, '2020-03-24 14:37:13', '2020-04-12 10:50:25', 'voyager.tests.index', 'null'),
(22, 1, 'Questions', '', '_self', 'voyager-edit', '#000000', NULL, 3, '2020-04-08 11:51:55', '2020-04-12 10:50:27', 'voyager.questions.index', 'null'),
(23, 1, 'User Tests', '', '_self', 'voyager-thumbs-up', '#000000', NULL, 4, '2020-04-09 13:23:31', '2020-04-12 10:50:32', 'voyager.user-tests.index', 'null'),
(25, 1, 'Professions', '', '_self', 'voyager-book', '#000000', NULL, 5, '2020-04-12 08:40:47', '2020-04-12 10:50:32', 'voyager.professions.index', 'null'),
(26, 1, 'Users Professions', '', '_self', 'voyager-world', '#000000', NULL, 6, '2020-04-12 08:57:25', '2020-04-12 10:50:32', 'voyager.users-professions.index', 'null');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2020_03_12_172137_create_personal_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-03-18 15:12:34', '2020-03-18 15:12:34');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(2, 'browse_bread', NULL, '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(3, 'browse_database', NULL, '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(4, 'browse_media', NULL, '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(5, 'browse_compass', NULL, '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(6, 'browse_menus', 'menus', '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(7, 'read_menus', 'menus', '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(8, 'edit_menus', 'menus', '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(9, 'add_menus', 'menus', '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(10, 'delete_menus', 'menus', '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(11, 'browse_roles', 'roles', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(12, 'read_roles', 'roles', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(13, 'edit_roles', 'roles', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(14, 'add_roles', 'roles', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(15, 'delete_roles', 'roles', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(16, 'browse_users', 'users', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(17, 'read_users', 'users', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(18, 'edit_users', 'users', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(19, 'add_users', 'users', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(20, 'delete_users', 'users', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(21, 'browse_settings', 'settings', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(22, 'read_settings', 'settings', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(23, 'edit_settings', 'settings', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(24, 'add_settings', 'settings', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(25, 'delete_settings', 'settings', '2020-03-02 13:35:00', '2020-03-02 13:35:00'),
(26, 'browse_hooks', NULL, '2020-03-02 13:35:02', '2020-03-02 13:35:02'),
(27, 'browse_products', 'products', '2020-03-02 20:24:39', '2020-03-02 20:24:39'),
(28, 'read_products', 'products', '2020-03-02 20:24:39', '2020-03-02 20:24:39'),
(29, 'edit_products', 'products', '2020-03-02 20:24:39', '2020-03-02 20:24:39'),
(30, 'add_products', 'products', '2020-03-02 20:24:39', '2020-03-02 20:24:39'),
(31, 'delete_products', 'products', '2020-03-02 20:24:39', '2020-03-02 20:24:39'),
(32, 'browse_tests', 'tests', '2020-03-24 14:37:12', '2020-03-24 14:37:12'),
(33, 'read_tests', 'tests', '2020-03-24 14:37:12', '2020-03-24 14:37:12'),
(34, 'edit_tests', 'tests', '2020-03-24 14:37:12', '2020-03-24 14:37:12'),
(35, 'add_tests', 'tests', '2020-03-24 14:37:12', '2020-03-24 14:37:12'),
(36, 'delete_tests', 'tests', '2020-03-24 14:37:12', '2020-03-24 14:37:12'),
(37, 'browse_questions', 'questions', '2020-04-08 11:51:55', '2020-04-08 11:51:55'),
(38, 'read_questions', 'questions', '2020-04-08 11:51:55', '2020-04-08 11:51:55'),
(39, 'edit_questions', 'questions', '2020-04-08 11:51:55', '2020-04-08 11:51:55'),
(40, 'add_questions', 'questions', '2020-04-08 11:51:55', '2020-04-08 11:51:55'),
(41, 'delete_questions', 'questions', '2020-04-08 11:51:55', '2020-04-08 11:51:55'),
(42, 'browse_user_tests', 'user_tests', '2020-04-09 13:23:31', '2020-04-09 13:23:31'),
(43, 'read_user_tests', 'user_tests', '2020-04-09 13:23:31', '2020-04-09 13:23:31'),
(44, 'edit_user_tests', 'user_tests', '2020-04-09 13:23:31', '2020-04-09 13:23:31'),
(45, 'add_user_tests', 'user_tests', '2020-04-09 13:23:31', '2020-04-09 13:23:31'),
(46, 'delete_user_tests', 'user_tests', '2020-04-09 13:23:31', '2020-04-09 13:23:31'),
(47, 'browse_profession', 'profession', '2020-04-12 08:34:42', '2020-04-12 08:34:42'),
(48, 'read_profession', 'profession', '2020-04-12 08:34:42', '2020-04-12 08:34:42'),
(49, 'edit_profession', 'profession', '2020-04-12 08:34:42', '2020-04-12 08:34:42'),
(50, 'add_profession', 'profession', '2020-04-12 08:34:42', '2020-04-12 08:34:42'),
(51, 'delete_profession', 'profession', '2020-04-12 08:34:42', '2020-04-12 08:34:42'),
(52, 'browse_professions', 'professions', '2020-04-12 08:40:47', '2020-04-12 08:40:47'),
(53, 'read_professions', 'professions', '2020-04-12 08:40:47', '2020-04-12 08:40:47'),
(54, 'edit_professions', 'professions', '2020-04-12 08:40:47', '2020-04-12 08:40:47'),
(55, 'add_professions', 'professions', '2020-04-12 08:40:47', '2020-04-12 08:40:47'),
(56, 'delete_professions', 'professions', '2020-04-12 08:40:47', '2020-04-12 08:40:47'),
(57, 'browse_users_professions', 'users_professions', '2020-04-12 08:57:25', '2020-04-12 08:57:25'),
(58, 'read_users_professions', 'users_professions', '2020-04-12 08:57:25', '2020-04-12 08:57:25'),
(59, 'edit_users_professions', 'users_professions', '2020-04-12 08:57:25', '2020-04-12 08:57:25'),
(60, 'add_users_professions', 'users_professions', '2020-04-12 08:57:25', '2020-04-12 08:57:25'),
(61, 'delete_users_professions', 'users_professions', '2020-04-12 08:57:25', '2020-04-12 08:57:25');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
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
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
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
(61, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal`
--

DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthday` date NOT NULL,
  `profession` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `national` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `portfolio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal`
--

INSERT INTO `personal` (`id`, `user_id`, `name`, `surname`, `gender`, `birthday`, `profession`, `phone`, `national`, `city`, `portfolio`, `info`, `created_at`, `updated_at`) VALUES
(8, 20, 'Антон', 'Антонов', 1, '1977-09-08', 'Преподаватель русского языка', '89889889898', 'Россия', 'Севастополь', '/upload/20/footer.png;/upload/20/Группа 1.png;/upload/20/Группа 2.png;/upload/20/Группа 3.png;/upload/20/Группа 4.png;', 'Не могу ничего сказать', '2020-03-15 11:18:33', '2020-03-15 11:18:33');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-03-18 15:12:33', '2020-03-18 15:12:33'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-03-18 15:12:33', '2020-03-18 15:12:33'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-03-18 15:12:33', '2020-03-18 15:12:33'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-03-18 15:12:33', '2020-03-18 15:12:33');

-- --------------------------------------------------------

--
-- Структура таблицы `professions`
--

DROP TABLE IF EXISTS `professions`;
CREATE TABLE `professions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `professions`
--

INSERT INTO `professions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Преподаватель', '2020-04-12 08:41:25', '2020-04-12 08:41:25'),
(3, 'Инженер', '2020-04-12 08:41:40', '2020-04-12 08:41:40');

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `value`, `created_at`, `updated_at`, `num`) VALUES
(1, 'Сегодня прекрасный день — у вас начинается отпуск, скоро увидите море. Кстати, куда едете?', '2020-03-24 19:17:19', '2020-03-25 12:34:55', 1),
(2, 'Какого цвета листья ?', '2020-03-28 12:44:48', '2020-03-28 12:44:48', 2),
(3, 'Для чего нужна коробка ?', '2020-03-28 12:46:10', '2020-03-28 12:46:10', 3),
(4, 'Побитовые операции. Чему равно 0011 OR 0101?', '2020-04-11 16:45:45', '2020-04-12 10:25:22', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Администратор', '2020-03-02 13:34:59', '2020-03-02 13:34:59'),
(2, 'user', 'Обычный Пользователь', '2020-03-02 13:34:59', '2020-03-02 13:34:59');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Название Сайта', 'Название Сайта', '', 'text', 1, 'Site'),
(2, 'site.description', 'Описание Сайта', 'Описание Сайта', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Логотип Сайта', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Фоновое Изображение для Админки', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Название Админки', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Описание Админки', 'Добро пожаловать!', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Загрузчик Админки', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Иконка Админки', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (используется для панели администратора)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tests`
--

INSERT INTO `tests` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Тест для преподавателей', '2020-03-24 14:53:58', '2020-03-24 16:06:39'),
(2, 'Тест для инженеров', '2020-04-11 14:29:39', '2020-04-12 10:21:58');

-- --------------------------------------------------------

--
-- Структура таблицы `tests_professions`
--

DROP TABLE IF EXISTS `tests_professions`;
CREATE TABLE `tests_professions` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `profession_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tests_professions`
--

INSERT INTO `tests_professions` (`id`, `test_id`, `profession_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `test_questions`
--

DROP TABLE IF EXISTS `test_questions`;
CREATE TABLE `test_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `test_questions`
--

INSERT INTO `test_questions` (`id`, `test_id`, `question_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-03-28 13:06:29', '2020-03-28 13:06:29'),
(2, 1, 2, '2020-03-28 13:06:37', '2020-03-28 13:06:37'),
(3, 1, 3, '2020-03-28 13:06:49', '2020-03-28 13:06:49'),
(4, 2, 4, NULL, '2020-04-11 17:14:27');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(2, 'data_rows', 'display_name', 29, 'ru', 'Created at', '2020-03-14 13:19:50', '2020-04-06 15:53:18'),
(3, 'data_rows', 'display_name', 30, 'ru', 'Updated at', '2020-03-14 13:19:50', '2020-04-06 15:53:18'),
(4, 'data_rows', 'display_name', 31, 'ru', 'Name', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(5, 'data_rows', 'display_name', 32, 'ru', 'Surname', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(6, 'data_rows', 'display_name', 33, 'ru', 'Gender', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(7, 'data_rows', 'display_name', 34, 'ru', 'Birthday', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(8, 'data_rows', 'display_name', 35, 'ru', 'Profession', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(9, 'data_rows', 'display_name', 36, 'ru', 'Phone', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(10, 'data_rows', 'display_name', 37, 'ru', 'National', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(11, 'data_rows', 'display_name', 38, 'ru', 'City', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(12, 'data_rows', 'display_name', 39, 'ru', 'Portfolio', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(13, 'data_rows', 'display_name', 40, 'ru', 'Info', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(14, 'data_rows', 'display_name', 41, 'ru', 'Вопрос', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(15, 'data_rows', 'display_name', 42, 'ru', 'Updated At', '2020-03-14 13:19:50', '2020-03-14 13:19:50'),
(18, 'menu_items', 'title', 17, 'ru', 'Резюме', '2020-03-14 13:48:45', '2020-03-14 13:48:45'),
(20, 'menu_items', 'title', 20, 'ru', 'Тест', '2020-03-14 15:34:32', '2020-03-14 15:34:32'),
(21, 'menu_items', 'title', 19, 'ru', 'Резюме', '2020-03-14 16:13:25', '2020-03-14 16:13:25'),
(22, 'data_rows', 'display_name', 27, 'ru', 'Id', '2020-03-24 14:38:03', '2020-03-24 14:38:03'),
(23, 'data_rows', 'display_name', 28, 'ru', 'Вопрос', '2020-03-24 14:38:03', '2020-03-24 14:38:03'),
(24, 'data_types', 'display_name_singular', 7, 'ru', 'Тест', '2020-03-24 14:38:03', '2020-03-24 14:38:03'),
(25, 'data_types', 'display_name_plural', 7, 'ru', 'Тесты', '2020-03-24 14:38:03', '2020-03-24 14:38:03'),
(26, 'data_rows', 'display_name', 48, 'ru', 'Создано', '2020-03-24 19:44:53', '2020-03-24 19:44:53'),
(27, 'data_rows', 'display_name', 47, 'ru', 'Ответы', '2020-03-24 19:44:54', '2020-03-24 19:44:54'),
(30, 'data_rows', 'display_name', 49, 'ru', 'Обновлено', '2020-03-24 19:45:41', '2020-03-24 19:45:41'),
(31, 'data_rows', 'display_name', 43, 'ru', 'Value', '2020-03-24 19:46:06', '2020-03-24 19:46:06'),
(32, 'data_rows', 'display_name', 44, 'ru', 'Question Id', '2020-03-24 19:46:06', '2020-03-24 19:46:06'),
(33, 'data_rows', 'display_name', 45, 'ru', 'Created At', '2020-03-24 19:46:06', '2020-03-24 19:46:06'),
(34, 'data_rows', 'display_name', 46, 'ru', 'Updated At', '2020-03-24 19:46:06', '2020-03-24 19:46:06'),
(37, 'data_rows', 'display_name', 50, 'ru', 'Номер', '2020-03-25 12:35:47', '2020-03-25 12:35:47'),
(38, 'data_rows', 'display_name', 51, 'ru', 'Right', '2020-03-25 16:01:07', '2020-03-25 16:01:07'),
(39, 'data_rows', 'display_name', 52, 'ru', 'Email_verif', '2020-03-31 08:06:25', '2020-04-06 15:39:48'),
(40, 'data_rows', 'display_name', 53, 'ru', 'Название', '2020-03-31 08:06:25', '2020-04-06 15:53:18'),
(41, 'data_rows', 'display_name', 54, 'ru', 'Order', '2020-03-31 08:06:25', '2020-03-31 08:06:25'),
(42, 'data_rows', 'display_name', 55, 'ru', 'Вопрос', '2020-03-31 08:06:25', '2020-04-08 14:02:18'),
(43, 'data_rows', 'display_name', 56, 'ru', 'Slug', '2020-03-31 08:06:25', '2020-03-31 08:06:25'),
(44, 'data_rows', 'display_name', 57, 'ru', 'Created At', '2020-03-31 08:06:25', '2020-03-31 08:06:25'),
(45, 'data_rows', 'display_name', 58, 'ru', 'Код', '2020-03-31 08:06:25', '2020-04-09 13:44:54'),
(46, 'data_rows', 'display_name', 16, 'ru', 'ID', '2020-04-06 15:37:02', '2020-04-06 15:37:02'),
(47, 'data_rows', 'display_name', 17, 'ru', 'Логин', '2020-04-06 15:37:02', '2020-04-06 15:37:02'),
(48, 'data_rows', 'display_name', 20, 'ru', 'Название', '2020-04-06 15:37:02', '2020-04-06 15:37:02'),
(49, 'data_rows', 'display_name', 18, 'ru', 'Created At', '2020-04-06 15:37:02', '2020-04-06 15:37:02'),
(50, 'data_rows', 'display_name', 19, 'ru', 'Updated At', '2020-04-06 15:37:02', '2020-04-06 15:37:02'),
(51, 'data_types', 'display_name_singular', 3, 'ru', 'Роль', '2020-04-06 15:37:02', '2020-04-06 15:37:02'),
(52, 'data_types', 'display_name_plural', 3, 'ru', 'Роли', '2020-04-06 15:37:02', '2020-04-06 15:37:02'),
(58, 'data_rows', 'display_name', 1, 'ru', 'ID', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(59, 'data_rows', 'display_name', 21, 'ru', 'Role', '2020-04-06 15:39:48', '2020-04-06 15:43:02'),
(60, 'data_rows', 'display_name', 2, 'ru', 'Название', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(61, 'data_rows', 'display_name', 3, 'ru', 'Email', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(62, 'data_rows', 'display_name', 8, 'ru', 'Аватар', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(63, 'data_rows', 'display_name', 4, 'ru', 'Password', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(64, 'data_rows', 'display_name', 5, 'ru', 'Remember Token', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(65, 'data_rows', 'display_name', 11, 'ru', 'Settings', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(66, 'data_rows', 'display_name', 6, 'ru', 'Создано', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(67, 'data_rows', 'display_name', 7, 'ru', 'Обновлено', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(68, 'data_rows', 'display_name', 9, 'ru', 'Роль', '2020-04-06 15:39:48', '2020-04-06 15:43:02'),
(69, 'data_rows', 'display_name', 10, 'ru', 'Roles', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(70, 'data_types', 'display_name_singular', 1, 'ru', 'Пользователь', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(71, 'data_types', 'display_name_plural', 1, 'ru', 'Пользователи', '2020-04-06 15:39:48', '2020-04-06 15:39:48'),
(72, 'data_rows', 'display_name', 12, 'ru', 'ID', '2020-04-06 15:44:13', '2020-04-06 15:44:13'),
(73, 'data_rows', 'display_name', 13, 'ru', 'Название', '2020-04-06 15:44:13', '2020-04-06 15:44:13'),
(74, 'data_rows', 'display_name', 14, 'ru', 'Created At', '2020-04-06 15:44:13', '2020-04-06 15:44:13'),
(75, 'data_rows', 'display_name', 15, 'ru', 'Updated At', '2020-04-06 15:44:13', '2020-04-06 15:44:13'),
(76, 'data_types', 'display_name_singular', 2, 'ru', 'Меню', '2020-04-06 15:44:13', '2020-04-06 15:44:13'),
(77, 'data_types', 'display_name_plural', 2, 'ru', 'Меню', '2020-04-06 15:44:13', '2020-04-06 15:44:13'),
(78, 'menu_items', 'title', 21, 'ru', 'Тесты', '2020-04-06 15:57:06', '2020-04-06 15:57:06'),
(79, 'data_types', 'display_name_singular', 8, 'ru', 'Question', '2020-04-08 12:00:23', '2020-04-08 12:00:23'),
(80, 'data_types', 'display_name_plural', 8, 'ru', 'Questions', '2020-04-08 12:00:23', '2020-04-08 12:00:23'),
(81, 'data_rows', 'display_name', 60, 'ru', 'Название теста', '2020-04-08 13:53:05', '2020-04-09 13:43:50'),
(82, 'data_rows', 'display_name', 61, 'ru', 'Id', '2020-04-09 13:25:54', '2020-04-09 13:25:54'),
(83, 'data_rows', 'display_name', 62, 'ru', 'User Id', '2020-04-09 13:25:54', '2020-04-09 13:25:54'),
(84, 'data_rows', 'display_name', 63, 'ru', 'Test Id', '2020-04-09 13:25:54', '2020-04-09 13:25:54'),
(85, 'data_rows', 'display_name', 64, 'ru', 'Результат', '2020-04-09 13:25:54', '2020-04-09 13:37:30'),
(86, 'data_rows', 'display_name', 65, 'ru', 'Created At', '2020-04-09 13:25:54', '2020-04-09 13:25:54'),
(87, 'data_rows', 'display_name', 66, 'ru', 'Updated At', '2020-04-09 13:25:54', '2020-04-09 13:25:54'),
(88, 'data_types', 'display_name_singular', 10, 'ru', 'User Test', '2020-04-09 13:25:54', '2020-04-09 13:25:54'),
(89, 'data_types', 'display_name_plural', 10, 'ru', 'User Tests', '2020-04-09 13:25:55', '2020-04-09 13:25:55'),
(90, 'data_rows', 'display_name', 67, 'ru', 'Пользователь', '2020-04-09 13:28:45', '2020-04-09 13:30:17'),
(91, 'data_rows', 'display_name', 68, 'ru', 'Тест', '2020-04-09 13:35:07', '2020-04-09 13:36:08'),
(92, 'menu_items', 'title', 23, 'ru', 'Результаты тестов', '2020-04-09 13:38:46', '2020-04-09 13:38:46'),
(93, 'menu_items', 'title', 22, 'ru', 'Вопросы', '2020-04-09 13:42:03', '2020-04-09 13:42:03'),
(94, 'data_rows', 'display_name', 69, 'ru', 'Id', '2020-04-12 08:43:32', '2020-04-12 08:43:32'),
(95, 'data_rows', 'display_name', 70, 'ru', 'Профессия', '2020-04-12 08:43:32', '2020-04-12 08:43:32'),
(96, 'data_rows', 'display_name', 71, 'ru', 'Created At', '2020-04-12 08:43:32', '2020-04-12 08:43:32'),
(97, 'data_rows', 'display_name', 72, 'ru', 'Обновлено', '2020-04-12 08:43:32', '2020-04-12 08:43:32'),
(98, 'data_types', 'display_name_singular', 13, 'ru', 'Профессия', '2020-04-12 08:43:32', '2020-04-12 08:43:32'),
(99, 'data_types', 'display_name_plural', 13, 'ru', 'Профессии', '2020-04-12 08:43:32', '2020-04-12 08:43:32'),
(100, 'menu_items', 'title', 25, 'ru', 'Профессии', '2020-04-12 08:44:37', '2020-04-12 08:44:37'),
(101, 'data_rows', 'display_name', 73, 'ru', 'Id', '2020-04-12 08:57:56', '2020-04-12 08:57:56'),
(102, 'data_rows', 'display_name', 74, 'ru', 'User Id', '2020-04-12 08:57:56', '2020-04-12 08:57:56'),
(103, 'data_rows', 'display_name', 75, 'ru', 'Prof Id', '2020-04-12 08:57:56', '2020-04-12 08:57:56'),
(104, 'data_rows', 'display_name', 76, 'ru', 'Created At', '2020-04-12 08:57:56', '2020-04-12 08:57:56'),
(105, 'data_rows', 'display_name', 77, 'ru', 'Updated At', '2020-04-12 08:57:56', '2020-04-12 08:57:56'),
(106, 'data_types', 'display_name_singular', 17, 'ru', 'Users Profession', '2020-04-12 08:57:56', '2020-04-12 08:57:56'),
(107, 'data_types', 'display_name_plural', 17, 'ru', 'Users Professions', '2020-04-12 08:57:56', '2020-04-12 08:57:56'),
(108, 'data_rows', 'display_name', 78, 'ru', 'Профессия', '2020-04-12 08:59:24', '2020-04-12 09:02:55'),
(109, 'data_rows', 'display_name', 79, 'ru', 'Фамилия', '2020-04-12 09:07:50', '2020-04-12 09:09:04'),
(110, 'menu_items', 'title', 26, 'ru', 'Выбор теста', '2020-04-12 09:12:06', '2020-04-12 09:12:06'),
(111, 'data_rows', 'display_name', 80, 'ru', 'Профессия', '2020-04-12 10:14:37', '2020-04-12 10:19:59');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$mgM9ofjky2p8u3M1o7xwMu8n.QmBpOS5Jy2DrPoD/TQZ7w5eZPYqO', '8lwGetfrBTSS3PKwftN5CsmT8lbQdwcnpg1z05d93yvebHe8yPLkzBOEJQ1c', NULL, '2020-03-18 15:12:32', '2020-03-18 15:12:32'),
(3, 1, 'my', 'my@mail.ru', 'users/default.png', NULL, '$2y$10$mNTDHOWfWXiH23tiL/Mm3egn9yEhKI.14k6pUd0TiaQCG6KEhtw5C', NULL, NULL, '2020-03-18 15:32:53', '2020-03-18 15:32:53'),
(20, 2, 'anton', 'anton@mail.ru', 'users/default.png', NULL, '$2y$10$7.bWVTrXGxgoesM9IllA3OUQ716/rR8mGPUumgYeE9WZyzUaMORf6', NULL, NULL, '2020-03-15 11:18:33', '2020-03-15 11:18:33');

-- --------------------------------------------------------

--
-- Структура таблицы `users_professions`
--

DROP TABLE IF EXISTS `users_professions`;
CREATE TABLE `users_professions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prof_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users_professions`
--

INSERT INTO `users_professions` (`id`, `user_id`, `prof_id`, `created_at`, `updated_at`) VALUES
(1, 20, 3, '2020-04-12 09:00:01', '2020-04-12 10:31:21');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_tests`
--

DROP TABLE IF EXISTS `user_tests`;
CREATE TABLE `user_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_tests`
--

INSERT INTO `user_tests` (`id`, `user_id`, `test_id`, `result`, `created_at`, `updated_at`) VALUES
(1, 20, 1, 2, '2020-03-30 18:46:01', '2020-04-09 13:20:05'),
(2, 20, 2, 1, '2020-04-12 12:18:01', '2020-04-12 12:18:09');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_user_id_index` (`user_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Индексы таблицы `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tests_professions`
--
ALTER TABLE `tests_professions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `users_professions`
--
ALTER TABLE `users_professions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Индексы таблицы `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `personal`
--
ALTER TABLE `personal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `professions`
--
ALTER TABLE `professions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tests_professions`
--
ALTER TABLE `tests_professions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `users_professions`
--
ALTER TABLE `users_professions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;
