-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2020 a las 07:08:44
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

create database pwa_lcfb_login;

--
-- Base de datos: `pwa_lcfb_login`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', 1, NULL),
('organizador', 3, NULL),
('usuario', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Superusuario Administrador', NULL, NULL, 1590382997, 1590382997),
('evento/create', 2, 'Create post', NULL, NULL, 1590380545, 1590380545),
('evento/delete', 2, 'Delete post', NULL, NULL, 1590380545, 1590380545),
('evento/index', 2, 'Create a post', NULL, NULL, 1590380544, 1590380544),
('evento/update', 2, 'Update post', NULL, NULL, 1590380545, 1590380545),
('evento/view', 2, 'View post', NULL, NULL, 1590380545, 1590380545),
('organizador', 1, 'Usuario que puede organizar eventos', NULL, NULL, 1590382997, 1590382997),
('site/about', 2, 'Ver información de la plataforma', NULL, NULL, 1590466937, 1590466937),
('site/contact', 2, 'Ver formulario de contacto', NULL, NULL, 1590466937, 1590466937),
('site/error', 2, 'Error mostrado al acceder a un sitio prohibido', NULL, NULL, NULL, NULL),
('site/eventos', 2, 'Ver listado de eventos', NULL, NULL, 1590466937, 1590466937),
('site/index', 2, 'Ver el home del sitio', NULL, NULL, 1590466937, 1590466937),
('site/logout', 2, 'Ver listado de eventos', NULL, NULL, 1590467310, 1590467310),
('site/miCuenta', 2, 'Ver perfil', NULL, NULL, 1590466937, 1590466937),
('usuario', 1, 'Usuario registrado comun', NULL, NULL, 1590466957, 1590466957);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'evento/delete'),
('admin', 'evento/update'),
('admin', 'organizador'),
('organizador', 'evento/create'),
('organizador', 'evento/index'),
('organizador', 'evento/view'),
('organizador', 'site/contact'),
('organizador', 'usuario'),
('usuario', 'site/about'),
('usuario', 'site/error'),
('usuario', 'site/eventos'),
('usuario', 'site/index'),
('usuario', 'site/logout'),
('usuario', 'site/miCuenta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `titulo`, `fecha`, `descripcion`, `idUser`) VALUES
(2, 'Evento N1', '2020-05-04', 'Esto es un ejemplo de evento. Es el primero!', 3),
(3, 'Evento Segundo. Viene después del primero', '2020-04-05', 'Este es otro ejemplo de evento. Es el segundo!', 3),
(4, 'Evento tercero', '2020-02-03', 'Este es un ejemplo malo pero solo permite comprobar que el usuario es distinto.', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1590243229),
('m130524_201442_init', 1590243232),
('m140506_102106_rbac_init', 1590329893),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1590329893),
('m180523_151638_rbac_updates_indexes_without_prefix', 1590329894),
('m190124_110200_add_verification_token_column_to_user_table', 1590243232),
('m200409_110543_rbac_update_mssql_trigger', 1590329894);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`, `nombre`, `apellido`) VALUES
(1, 'Admin', '7hnl6atPn3p_C19N75U_XghFgid6Qv6d', '$2y$13$CI.ZlDr809u15pew6/x6FuC.V9prBjnX.HD6qFILamSAjifRFytcq', NULL, 'admin@test.com', 10, 1590452532, 1590452532, 'hsEVzts2_HCXv1uNWmZetTuWzcsY0Aaf_1590452532', 'Administrador', 'Administrado'),
(2, 'Usuario', 'rr2PA-DkQ5FEEIlM1j2L5r17MX0UIPLz', '$2y$13$wGmqQcOn3J7IzvIIDo2NL.wDNUJ5kE.wtf.98QV1yX2tHKjR7D9hm', NULL, 'usuario@test.com', 10, 1590452502, 1590452502, 'FfFYQQZSXuznv2vMs5W5j1SK-1eGvYzV_1590452502', 'Usuario', 'Comunacho'),
(3, 'Organizador', 'h9_-ABHGCUZAlRgnVGEqacy8RS2BVGC7', '$2y$13$nwMM3/KV/1IXurltNCVFJeRfqao72bKQFUmsZuHsk350k3fN/lAKK', NULL, 'organizador@test.com', 10, 1590452462, 1590452462, 'cj5-1OAkXOfZeYqwYDT4Wal19o1rjV7Q_1590452462', 'Organizador', 'Organizado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`) USING BTREE,
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
