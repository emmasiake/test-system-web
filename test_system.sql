-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 17 2020 г., 12:11
-- Версия сервера: 5.6.37
-- Версия PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_system`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1606220716),
('authUser', '3', 1606220716),
('authUser', '4', 1607434329),
('authUser', '5', 1608032352),
('authUser', '6', 1608034234),
('moderator', '2', 1606220716);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1606220716, 1606220716),
('authUser', 1, NULL, NULL, NULL, 1606220716, 1606220716),
('createTask', 2, 'Create a task', NULL, NULL, 1606220716, 1606220716),
('deleteTask', 2, NULL, NULL, NULL, 1606220716, 1606220716),
('moderator', 1, NULL, NULL, NULL, 1606220716, 1606220716),
('updateOwnTask', 2, 'Update own task', 'isAuthor', NULL, 1606220734, 1606220734),
('updateTask', 2, 'Update task', NULL, NULL, 1606220716, 1606220716);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('moderator', 'authUser'),
('authUser', 'createTask'),
('admin', 'deleteTask'),
('admin', 'moderator'),
('authUser', 'updateOwnTask'),
('moderator', 'updateTask'),
('updateOwnTask', 'updateTask');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('isAuthor', 0x4f3a32323a22636f6d6d6f6e5c726261635c417574686f7252756c65223a333a7b733a343a226e616d65223b733a383a226973417574686f72223b733a393a22637265617465644174223b693a313630363232303733343b733a393a22757064617465644174223b693a313630363232303733343b7d, 1606220734, 1606220734);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`) VALUES
(1, 'Simple', 'Simple algorithms'),
(2, 'Conditional statement IF', 'Conditional statement IF'),
(3, 'Switch Statement', 'Switch Statement'),
(4, 'Loop WHILE', 'Loop WHILE'),
(5, 'Loop FOR', 'Loop FOR'),
(6, 'Arrays', 'Using Arrays in JavaScript');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1606119370),
('m130524_201442_init', 1606119371),
('m140506_102106_rbac_init', 1606219397),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1606219397),
('m180523_151638_rbac_updates_indexes_without_prefix', 1606219397),
('m190124_110200_add_verification_token_column_to_user_table', 1606119371),
('m200409_110543_rbac_update_mssql_trigger', 1606219397);

-- --------------------------------------------------------

--
-- Структура таблицы `solution`
--

CREATE TABLE `solution` (
  `solution_id` int(11) NOT NULL,
  `solution` text NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `test_result` text NOT NULL,
  `result` float NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `solution`
--

INSERT INTO `solution` (`solution_id`, `solution`, `task_id`, `user_id`, `test_result`, `result`, `created_at`, `status`) VALUES
(75, 'function sum(a, b) {return a + b;}', 17, 3, '{\"results\":[{\"message\":\"Test passed\"},{\"message\":\"Test passed\"}],\"result\":1}', 1, '2020-12-17 09:31:52', 1),
(76, 'function sum(a, b) {return a + b;}', 17, 3, '{\"results\":[{\"message\":\"Test passed\"},{\"message\":\"Test passed\"}],\"result\":1}', 1, '2020-12-17 09:37:20', 1),
(77, 'function hypotenuse(a, b) {return Math.sqrt(a * a + b * b);}', 18, 3, '{\"results\":[{\"message\":\"Test passed\"},{\"message\":\"Test passed\"},{\"message\":\"Test passed\"},{\"message\":\"Test passed\"}],\"result\":1}', 1, '2020-12-17 11:39:39', 1),
(78, 'function hypotenuse(a, b) {return Math.sqrt(a * a + b * b);}', 18, 3, '{\"results\":[{\"message\":\"Test passed\"},{\"message\":\"Test passed\"},{\"message\":\"Test passed\"},{\"message\":\"Test passed\"}],\"result\":1}', 1, '2020-12-17 11:43:11', 1),
(79, 'function sum(a, b) {return a + b;}', 18, 3, '{\"results\":[{\"message\":\"Test failed\",\"error\":{}},{\"message\":\"Test failed\",\"error\":{}},{\"message\":\"Test failed\",\"error\":{}},{\"message\":\"Test failed\",\"error\":{}}],\"result\":0}', 0, '2020-12-17 11:43:38', 1),
(80, 'function hypotenuse(a, b) {return Math.sqrt(a * a + b * b); } ', 18, 3, '{\"results\":[{\"message\":\"Test passed\"},{\"message\":\"Test passed\"},{\"message\":\"Test passed\"},{\"message\":\"Test passed\"}],\"result\":1}', 1, '2020-12-17 11:44:22', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `task`
--

CREATE TABLE `task` (
  `task_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `function_name` varchar(255) NOT NULL,
  `function_description` varchar(255) NOT NULL,
  `tests` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `task`
--

INSERT INTO `task` (`task_id`, `title`, `description`, `function_name`, `function_description`, `tests`, `category_id`, `user_id`, `created_at`) VALUES
(17, 'Sum of two numbers', 'Create a function sum(), which takes two arguments and returns their sum.\r\nFor example, for arguments 2, 3 the result must be 5', 'sum', 'Sum of two numbers', '{\"args\":[\"2, 3\",\"3, 4\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"result\":[\"5\",\"7\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]}', 1, 6, '2020-12-15 02:19:48'),
(18, 'Hypotenuse', 'Write a function hypotenuse', 'hypotenuse', 'hypotenuse in right triangle', '{\"args\":[\"3, 4\",\"6, 8\",\"12, 16\",\"24, 32\",\"\",\"\",\"\",\"\",\"\",\"\"],\"result\":[\"5\",\"10\",\"20\",\"40\",\"\",\"\",\"\",\"\",\"\",\"\"]}', 1, 3, '2020-12-16 08:27:29'),
(19, 'Adding Two Numbers', 'Write a function, which add two numbers and returns a result', 'sum', 'sum of two numbers', '{\"args\":[\"3, 4\",\"4, 5\",\"5, 6\",\"6, 7\",\"\",\"\",\"\",\"\",\"\",\"\"],\"result\":[\"7\",\"9\",\"11\",\"12\",\"\",\"\",\"\",\"\",\"\",\"\"]}', 1, 3, '2020-12-16 12:32:24');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'jane', '6CQPZngit94E4IkXexcJVEei_htaGk4q', '$2y$13$jeSVgFh5ZpvYEsJdzMymXuZruQOpOv5tSW5p5EpFYcahgfDGJxJTS', NULL, 'jane@gmail.com', 10, 1606122909, 1606122909, 'QD6OOpHmVZp-E_Pd9IDnN8H6lNyMqcfq_1606122909'),
(2, 'John', '2KR64NqxA5kugV49nRkr524ej7LdG6al', '$2y$13$QCzplenQmjSj2gBipoRs0uOCfxwelzdAch/dcE207kOIpkew8bnUK', NULL, 'john@gmail.com', 10, 1606136161, 1606136161, '12iw6XPZRpNH-eW8-78bZWzd8h28x8KW_1606136161'),
(3, 'Peter', 'OgnUC44Hdvc8zl1CL3tHs15JPBXt2Z25', '$2y$13$Eh8EMHHENcKk7EBM.MJKjuOOLa5jJuOKTgSH3gc6B5lpghPiMLXgq', NULL, 'peter@gmail.com', 10, 1606137723, 1606137723, 'BYDVAMAv813O_rskzn1_GF6njCqh58ts_1606137723'),
(4, 'Emmanuel', '9Ojfxe3eZ_cILS_TsCSEecHU32vO0INH', '$2y$13$hLt4dalfLqIvKcoULbna8OU1Pt.akTVghOYRdc32eO3FRwTtQJI6i', NULL, 'emmanuel@gmail.com', 10, 1607434329, 1607434329, 'FluDL2HxXiidznCJE7FhbSPxR0y0o8Ai_1607434329'),
(5, 'alex', 'e-wRtWAMMub4F5RzhM6gPyPV3xzWCgYW', '$2y$13$.EXE1cZxHEDeyeRo/HapFuiLwgYdbWKg3LI278Ia22Q.z.Pw6Erqa', NULL, 'alexkuzmenko@gmail.com', 10, 1608032352, 1608032352, '7iSkDliCuxXlw5LkMvx5KnBsU5U1mwwE_1608032352'),
(6, 'emmasiake', '1TwgyzXC8jmlwXRG1yMxN2Y5WMb8rkKJ', '$2y$13$RSQtxQkT6g2pGvoJK7CH3uHdSR0.0AT5y7lDaHKo9JzGTaW57CodK', NULL, 'emmasiake95@gmail.com', 10, 1608034234, 1608034234, 'KCYusMh1nG8GDwcUrF-uOelJ6xBxAdKw_1608034234');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `solution`
--
ALTER TABLE `solution`
  ADD PRIMARY KEY (`solution_id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Индексы таблицы `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `solution`
--
ALTER TABLE `solution`
  MODIFY `solution_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT для таблицы `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `solution`
--
ALTER TABLE `solution`
  ADD CONSTRAINT `solution_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  ADD CONSTRAINT `solution_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
