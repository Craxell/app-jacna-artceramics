-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 11-05-2024 a las 08:49:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_jacna`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `portada` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
(9, 'Ceramicas', 'Ceramicas sin planta', 'img_b1cdf05a08cefe41c766f949d5c7faa2.jpg', '2024-03-15 14:48:03', '', 1),
(10, 'Materas', 'Las mejores ceramicas', 'img_c12b1ad18f17abda7c1c7f7f84ded55c.jpg', '2024-03-15 14:48:45', '', 1),
(11, 'Plantas', 'Planta para matera', 'img_bedbc1897a99851b21c3a44787bbe753.jpg', '2024-03-19 01:55:48', '', 0),
(12, 'Los_devs', 'devs de artCeramics', 'portada_categoria.png', '2024-03-30 16:08:17', '', 2),
(13, 'ad', 'asd', 'portada_categoria.png', '2024-04-24 00:17:17', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedidoid`, `productoid`, `precio`, `cantidad`) VALUES
(1, 3, 15, 2500.00, 2),
(2, 4, 15, 2500.00, 3),
(3, 5, 15, 2500.00, 3),
(4, 6, 15, 2500.00, 1),
(5, 7, 15, 2500.00, 1),
(6, 8, 15, 2500.00, 1),
(7, 9, 15, 2500.00, 1),
(8, 9, 14, 9500000.00, 1),
(9, 10, 15, 2500.00, 5),
(10, 10, 14, 9500000.00, 1),
(11, 11, 17, 8200.00, 1),
(12, 12, 15, 2500.00, 5),
(13, 13, 17, 8200.00, 1),
(14, 14, 17, 8200.00, 3),
(15, 15, 16, 5600.00, 3),
(16, 15, 15, 2500.00, 1),
(17, 15, 18, 7600.00, 2),
(18, 15, 17, 8200.00, 1),
(19, 16, 17, 8200.00, 1),
(20, 16, 18, 7600.00, 1),
(21, 16, 16, 5600.00, 1),
(22, 17, 17, 8200.00, 1),
(23, 17, 18, 7600.00, 1),
(24, 17, 16, 5600.00, 1),
(25, 18, 17, 8200.00, 1),
(26, 18, 18, 7600.00, 1),
(27, 18, 16, 5600.00, 1),
(28, 19, 15, 2500.00, 1),
(29, 20, 18, 7600.00, 1),
(30, 21, 14, 9500000.00, 1),
(31, 22, 17, 8200.00, 1),
(32, 23, 17, 8200.00, 1),
(33, 24, 17, 8200.00, 1),
(34, 25, 17, 8200.00, 2),
(35, 26, 19, 500000.00, 1),
(36, 26, 15, 2500.00, 1),
(37, 26, 21, 500000.00, 1),
(38, 26, 20, 650000.00, 1),
(39, 26, 14, 9500000.00, 1),
(40, 27, 18, 7600.00, 1),
(41, 28, 16, 5600.00, 1),
(42, 29, 15, 2500.00, 1),
(43, 29, 16, 5600.00, 1),
(44, 29, 17, 8200.00, 1),
(45, 30, 16, 5600.00, 1),
(46, 30, 18, 7600.00, 1),
(47, 30, 17, 8200.00, 1),
(48, 30, 15, 2500.00, 1),
(49, 31, 18, 7600.00, 1),
(50, 32, 17, 8200.00, 3),
(51, 32, 16, 5600.00, 1),
(52, 33, 16, 5600.00, 5),
(53, 34, 18, 7600.00, 1),
(54, 34, 17, 8200.00, 1),
(55, 35, 16, 5600.00, 1),
(56, 36, 17, 8200.00, 2),
(57, 37, 16, 5600.00, 5),
(58, 38, 16, 5600.00, 1),
(59, 39, 16, 5600.00, 3),
(60, 39, 18, 7600.00, 2),
(61, 39, 17, 8200.00, 1),
(62, 39, 15, 2500.00, 6),
(63, 40, 16, 5600.00, 1),
(64, 41, 20, 650000.00, 1),
(65, 42, 20, 650000.00, 1),
(66, 43, 16, 5600.00, 4),
(67, 43, 18, 7600.00, 2),
(68, 43, 17, 8200.00, 1),
(69, 44, 18, 7600.00, 1),
(70, 45, 18, 7600.00, 1),
(71, 45, 16, 5600.00, 1),
(72, 46, 18, 7600.00, 4),
(73, 46, 16, 5600.00, 1),
(74, 47, 17, 8200.00, 3),
(75, 48, 17, 8200.00, 1),
(76, 49, 16, 5600.00, 1),
(77, 50, 17, 8200.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` bigint(20) NOT NULL,
  `personaid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `transaccionid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `detalle_temp`
--

INSERT INTO `detalle_temp` (`id`, `personaid`, `productoid`, `precio`, `cantidad`, `transaccionid`) VALUES
(34, 26, 15, 2500.00, 2, 'ohhdec97gsnjbnm99n7d94slpt'),
(80, 26, 15, 2500.00, 1, '2fkkgs5igi5tiq2onp5g1d9e96'),
(91, 26, 15, 2500.00, 2, 'o3jc74asf11si6ukeg8d3ejc67');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `productoid`, `img`) VALUES
(41, 17, 'pro_c31ec01ecea861f57528cb497105177f.jpg'),
(47, 18, 'pro_91e1c4dac6c616c0a13b82ddc4c9ffa5.jpg'),
(51, 15, 'pro_d0fde37fdcb61bc8fe1cdd632c607e77.jpg'),
(53, 15, 'pro_3462779d9893c0a71277fbcd790c7fcd.jpg'),
(54, 15, 'pro_d9b7c4d0387f06973a7f659cb7cbfcdf.jpg'),
(55, 16, 'pro_cb5055f2aa7e243c180b2ab5478c8103.jpg'),
(56, 14, 'pro_7f291f6a5ff65b15ae635b292524c81a.jpg'),
(59, 19, 'pro_e0ea9be3db4eb1d4deff93fe6c3cceba.jpg'),
(60, 20, 'pro_49cd204740a5976f511d93c19b36b526.jpg'),
(61, 21, 'pro_e26fa7bc684cfa00f91ba9b593e3c8b6.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `idmodulo` bigint(20) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes de tienda', 1),
(4, 'Productos', 'Todos los productos', 1),
(5, 'Pedidos', 'Pedidos', 1),
(6, 'Caterogías', 'Caterogías Productos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` bigint(20) NOT NULL,
  `referenciacobro` varchar(255) DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) DEFAULT NULL,
  `datospaypal` text DEFAULT NULL,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `costo_envio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL,
  `direccion_envio` text NOT NULL,
  `status` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costo_envio`, `monto`, `tipopagoid`, `direccion_envio`, `status`) VALUES
(3, NULL, '0SR88829283378638', '{\"id\":\"15R55885XV351040M\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"15000.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por COP 15000\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"0SR88829283378638\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"15000.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-03-17T08:29:58Z\",\"update_time\":\"2024-03-17T08:29:58Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-03-17T08:29:49Z\",\"update_time\":\"2024-03-17T08:29:58Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/15R55885XV351040M\",\"rel\":\"self\",\"method\":\"GET\"}]}', 26, '2024-03-17 03:29:58', 0.00, 15.00, 1, 'asd, asd', 'Reembolsado'),
(4, NULL, '5KT760766F867002L', '{\"id\":\"8M279456SU035932C\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"17500.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por COP 17500\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"5KT760766F867002L\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"17500.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-03-17T16:51:20Z\",\"update_time\":\"2024-03-17T16:51:20Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-03-17T16:49:16Z\",\"update_time\":\"2024-03-17T16:51:20Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/8M279456SU035932C\",\"rel\":\"self\",\"method\":\"GET\"}]}', 26, '2024-03-17 11:51:19', 0.00, 17.00, 1, 'Calle 55 # 11B - 153, Cali', 'Completo'),
(5, NULL, '4EH940011P351735Y', '{\"id\":\"3L432402VB3550705\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"17500.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por COP 17500\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"4EH940011P351735Y\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"17500.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-03-17T16:57:04Z\",\"update_time\":\"2024-03-17T16:57:04Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-03-17T16:56:57Z\",\"update_time\":\"2024-03-17T16:57:04Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3L432402VB3550705\",\"rel\":\"self\",\"method\":\"GET\"}]}', 26, '2024-03-17 11:57:03', 0.00, 17.00, 1, 'asd, asd', 'Completo'),
(6, NULL, '0AD7266998493491R', '{\"id\":\"3UD62985UD230205D\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"12500.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por COP 12500\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"0AD7266998493491R\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"12500.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-03-18T00:02:02Z\",\"update_time\":\"2024-03-18T00:02:02Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-03-17T23:59:59Z\",\"update_time\":\"2024-03-18T00:02:02Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3UD62985UD230205D\",\"rel\":\"self\",\"method\":\"GET\"}]}', 26, '2024-03-17 19:02:01', 0.00, 12.00, 1, 'Calle 55 # 11B - 153, Cali', 'Completo'),
(7, NULL, '9GA33268AH062933H', '{\"id\":\"3UF952076V4261256\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"12500.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por COP 12500\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"9GA33268AH062933H\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"12500.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-03-18T00:49:49Z\",\"update_time\":\"2024-03-18T00:49:49Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-03-18T00:49:22Z\",\"update_time\":\"2024-03-18T00:49:49Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3UF952076V4261256\",\"rel\":\"self\",\"method\":\"GET\"}]}', 26, '2024-03-17 19:49:49', 0.00, 12.00, 1, 'Calle 55 # 11B - 153, Cali', 'Completo'),
(8, NULL, NULL, NULL, 26, '2024-03-17 20:19:43', 0.00, 12.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(9, NULL, NULL, NULL, 26, '2024-03-18 23:08:58', 0.00, 9.00, 3, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(10, NULL, NULL, NULL, 27, '2024-03-18 23:38:35', 0.00, 9.00, 3, 'Just Us Catering, Emerson St, Palo Alto, CA 94301, Estados Unidos', 'Pendiente'),
(11, NULL, NULL, NULL, 1, '2024-03-19 18:06:39', 0.00, 10.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(12, NULL, NULL, NULL, 1, '2024-03-19 18:15:58', 0.00, 14.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(13, NULL, NULL, NULL, 26, '2024-03-29 19:29:04', 0.00, 10.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(14, NULL, NULL, NULL, 26, '2024-03-29 19:38:00', 6000.00, 30.00, 3, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(15, NULL, NULL, NULL, 26, '2024-03-29 19:44:45', 2000.00, 44.00, 2, 'Just Us Catering, Emerson St, Palo Alto, CA 94301, Estados Unidos', 'Pendiente'),
(16, NULL, NULL, NULL, 1, '2024-03-29 21:09:44', 2000.00, 23.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(17, NULL, NULL, NULL, 1, '2024-03-29 21:10:16', 2000.00, 23.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(18, NULL, NULL, NULL, 1, '2024-03-29 21:11:29', 2000.00, 23.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(19, NULL, NULL, NULL, 1, '2024-03-29 21:42:43', 2000.00, 4.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(20, NULL, NULL, NULL, 1, '2024-03-29 21:44:13', 2000.00, 9.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(21, NULL, NULL, NULL, 1, '2024-03-29 21:44:56', 2000.00, 9.00, 2, 'Calle 55 # 11B - 153, Cali', 'Pendiente'),
(22, NULL, NULL, NULL, 1, '2024-03-30 15:08:02', 2000.00, 10.00, 2, 'calle 15D #1-25, Yumbo', 'Pendiente'),
(23, NULL, NULL, NULL, 1, '2024-03-30 15:11:04', 2000.00, 10.00, 2, 'sdf, sf', 'Pendiente'),
(24, NULL, NULL, NULL, 1, '2024-03-30 15:14:48', 2000.00, 10.00, 2, 'as, asd', 'Pendiente'),
(25, NULL, NULL, NULL, 1, '2024-03-30 15:15:19', 2000.00, 18.00, 2, 'asd, asd', 'Pendiente'),
(26, NULL, NULL, NULL, 1, '2024-03-30 16:31:05', 2000.00, 11.00, 2, 'calle 115D #1-25, Yumbo', 'Pendiente'),
(27, NULL, '5TJ64654TF694154N', '{\"id\":\"45A76592W24769020\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"9600.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 9600\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"5TJ64654TF694154N\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"9600.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-03-31T01:27:58Z\",\"update_time\":\"2024-03-31T01:27:58Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-03-31T01:26:17Z\",\"update_time\":\"2024-03-31T01:27:58Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/45A76592W24769020\",\"rel\":\"self\",\"method\":\"GET\"}]}', 29, '2024-03-30 20:27:58', 2000.00, 9.00, 1, 'calle 115D #1-25, Yumbo', 'Completo'),
(28, NULL, '7MV34483KE780343E', '{\"id\":\"048336504W755120F\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"7600.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 7600\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"7MV34483KE780343E\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"7600.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-03-31T01:42:09Z\",\"update_time\":\"2024-03-31T01:42:09Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-03-31T01:42:01Z\",\"update_time\":\"2024-03-31T01:42:09Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/048336504W755120F\",\"rel\":\"self\",\"method\":\"GET\"}]}', 29, '2024-03-30 20:42:10', 2000.00, 7.00, 1, 'calle 115D #1-25, Yumbo', 'Completo'),
(29, NULL, '9SW43551U5402022F', '{\"id\":\"3RC326530W827151A\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"18300.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 18300\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"9SW43551U5402022F\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"18300.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-03-31T02:33:12Z\",\"update_time\":\"2024-03-31T02:33:12Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-03-31T02:32:59Z\",\"update_time\":\"2024-03-31T02:33:12Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3RC326530W827151A\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2024-03-30 21:33:13', 2000.00, 18.00, 1, 'calle 115D #1-25, Yumbo', 'Completo'),
(30, NULL, '72705736KY880980S', '{\"id\":\"4RH3287303976005P\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"25900.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 25900\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"72705736KY880980S\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"25900.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-03-31T21:23:09Z\",\"update_time\":\"2024-03-31T21:23:09Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-03-31T21:22:56Z\",\"update_time\":\"2024-03-31T21:23:09Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/4RH3287303976005P\",\"rel\":\"self\",\"method\":\"GET\"}]}', 27, '2024-03-31 16:23:08', 2000.00, 25.00, 1, 'Just Us Catering, Emerson St, Palo Alto, CA 94301, Estados Unidos', 'Completo'),
(31, NULL, NULL, NULL, 30, '2024-03-31 21:33:02', 2000.00, 9.00, 3, 'Calle 15D #1-25, Yumbo', 'Pendiente'),
(32, NULL, NULL, NULL, 30, '2024-03-31 21:36:00', 2000.00, 32.00, 2, 'Calle 15D #1-25, Yumbo', 'Pendiente'),
(33, NULL, '8FW86399GN014494S', '{\"id\":\"8HA80578UY5087056\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"30000.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 30000\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"8FW86399GN014494S\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"30000.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-04-02T23:01:17Z\",\"update_time\":\"2024-04-02T23:01:17Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-04-02T23:01:06Z\",\"update_time\":\"2024-04-02T23:01:17Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/8HA80578UY5087056\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2024-04-02 18:01:16', 2000.00, 30.00, 1, 'calle 115D #1-25, Yumbo', 'Completo'),
(34, NULL, NULL, NULL, 1, '2024-04-02 18:07:26', 2000.00, 17.00, 2, 'calle 115D #1-25, Yumbo', 'Pendiente'),
(35, NULL, '7F4748134D389773V', '{\"id\":\"42M394086R3482306\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"7600.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 7600\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"7F4748134D389773V\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"7600.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-04-02T23:09:58Z\",\"update_time\":\"2024-04-02T23:09:58Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-04-02T23:09:48Z\",\"update_time\":\"2024-04-02T23:09:58Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/42M394086R3482306\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2024-04-02 18:09:58', 2000.00, 7.00, 1, 'calle 115D #1-25, Yumbo', 'Reembolsado'),
(36, NULL, NULL, NULL, 1, '2024-04-02 18:12:36', 2000.00, 18.00, 2, 'calle 115D #1-25, Yumbo', 'Pendiente'),
(37, NULL, NULL, NULL, 30, '2024-04-07 19:50:51', 2000.00, 30.00, 2, 'Calle 14 #3N-44, Cali', 'Pendiente'),
(38, NULL, NULL, NULL, 1, '2024-04-09 17:07:05', 2000.00, 7.00, 2, 'adas, asd', 'Pendiente'),
(39, NULL, NULL, NULL, 1, '2024-04-11 17:55:20', 2000.00, 57.00, 2, 'callle asdad234, Cali', 'Pendiente'),
(40, NULL, NULL, NULL, 1, '2024-04-16 17:50:44', 2000.00, 7.00, 2, 'dasx, cali', 'Pendiente'),
(41, NULL, NULL, NULL, 1, '2024-04-16 17:51:23', 2000.00, 652.00, 2, 'asd, as', 'Pendiente'),
(42, '55616168', NULL, NULL, 1, '2024-04-16 17:52:26', 2000.00, 652.00, 2, 'asd, asd', 'Completo'),
(43, '95756745678', NULL, NULL, 31, '2024-04-20 15:14:10', 2000.00, 47.00, 2, 'Calle 35 #13-39, Cali', 'Completo'),
(44, NULL, '4YS4385768749073Y', '{\"id\":\"1R755321LM060893S\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"9600.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 9600\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"4YS4385768749073Y\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"9600.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-04-21T17:28:58Z\",\"update_time\":\"2024-04-21T17:28:58Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-04-21T17:28:00Z\",\"update_time\":\"2024-04-21T17:28:58Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/1R755321LM060893S\",\"rel\":\"self\",\"method\":\"GET\"}]}', 30, '2024-04-21 12:28:59', 2000.00, 9.00, 1, 'Calle 40 #3N32, Cali', 'Reembolsado'),
(45, NULL, '8LJ52071LV573973C', '{\"id\":\"1NB83476LE8276153\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"15200.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 15200\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"8LJ52071LV573973C\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"15200.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-04-21T20:57:54Z\",\"update_time\":\"2024-04-21T20:57:54Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-04-21T20:57:41Z\",\"update_time\":\"2024-04-21T20:57:54Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/1NB83476LE8276153\",\"rel\":\"self\",\"method\":\"GET\"}]}', 27, '2024-04-21 15:57:55', 2000.00, 15.00, 1, 'Just Us Catering, Emerson St, Palo Alto, CA 94301, Estados Unidos', 'Reembolsado'),
(46, NULL, '1S170193V2902854D', '{\"id\":\"2P158455JT1244848\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"38000.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 38000\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"1S170193V2902854D\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"38000.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-04-24T04:54:54Z\",\"update_time\":\"2024-04-24T04:54:54Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-04-24T04:54:48Z\",\"update_time\":\"2024-04-24T04:54:54Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/2P158455JT1244848\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2024-04-23 23:54:54', 2000.00, 38.00, 1, 'calle 115D #1-25, Yumbo', 'Reembolsado'),
(47, NULL, '075374812F7320241', '{\"id\":\"3H102518VY8623334\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"26600.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 26600\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"075374812F7320241\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"26600.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-04-28T03:22:29Z\",\"update_time\":\"2024-04-28T03:22:29Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-04-28T03:22:11Z\",\"update_time\":\"2024-04-28T03:22:29Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3H102518VY8623334\",\"rel\":\"self\",\"method\":\"GET\"}]}', 30, '2024-04-27 22:22:28', 2000.00, 26.00, 1, 'asd, asd', 'Reembolsado'),
(48, NULL, '65R15905RX6502334', '{\"id\":\"0KH79067651785943\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"12200.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 12200\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"65R15905RX6502334\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"12200.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-04-28T04:30:33Z\",\"update_time\":\"2024-04-28T04:30:33Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-04-28T04:30:21Z\",\"update_time\":\"2024-04-28T04:30:33Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/0KH79067651785943\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2024-04-27 23:30:32', 4000.00, 12.00, 1, 'wser, df', 'Reembolsado'),
(49, NULL, '97E69632UF2066250', '{\"id\":\"9M479026V7639905S\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"7600.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 7600\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"97E69632UF2066250\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"7600.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-05-08T00:14:10Z\",\"update_time\":\"2024-05-08T00:14:10Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-05-08T00:13:40Z\",\"update_time\":\"2024-05-08T00:14:10Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9M479026V7639905S\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2024-05-07 19:14:10', 2000.00, 7.00, 1, 'calle 115D #1-25, Yumbo', 'Reembolsado'),
(50, NULL, '10K58167TN011624A', '{\"id\":\"7LY18178WT402972M\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"10200.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 10200\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"10K58167TN011624A\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"10200.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-05-10T03:01:49Z\",\"update_time\":\"2024-05-10T03:01:49Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-05-10T03:01:22Z\",\"update_time\":\"2024-05-10T03:01:49Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/7LY18178WT402972M\",\"rel\":\"self\",\"method\":\"GET\"}]}', 30, '2024-05-09 22:01:49', 2000.00, 10.00, 1, 'Cl 15D #1-25, Yumbo', 'Reembolsado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` bigint(20) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(668, 7, 1, 0, 0, 0, 0),
(669, 7, 2, 0, 0, 0, 0),
(670, 7, 3, 0, 0, 0, 0),
(671, 7, 4, 0, 0, 0, 0),
(672, 7, 5, 1, 0, 0, 0),
(673, 7, 6, 0, 0, 0, 0),
(710, 1, 1, 1, 1, 1, 1),
(711, 1, 2, 1, 1, 1, 1),
(712, 1, 3, 1, 1, 1, 1),
(713, 1, 4, 1, 1, 1, 1),
(714, 1, 5, 1, 1, 1, 1),
(715, 1, 6, 1, 1, 1, 1),
(728, 11, 1, 1, 1, 0, 0),
(729, 11, 2, 0, 0, 0, 0),
(730, 11, 3, 1, 0, 1, 1),
(731, 11, 4, 1, 1, 1, 1),
(732, 11, 5, 1, 0, 1, 1),
(733, 11, 6, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` bigint(20) NOT NULL,
  `identificacion` varchar(30) DEFAULT NULL,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `password` varchar(75) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `nombrefiscal` varchar(80) DEFAULT NULL,
  `direccionfiscal` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`) VALUES
(1, '1.110.285.665', 'Carlos', 'Altamirano', 3195206408, 'carlos.altamirano@uao.edu.co', 'bf33d9267695135419718fac7a22f25a2006500cf629a46b5bef01b20a1ce473', '12341564', 'Don Carlos', 'Algún lugar de Yumbo', '', 1, '2020-08-13 00:51:44', 1),
(25, '95314321', 'Sdsa', 'Asda', 2344, 'cliente1@cliente.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '73452', 'no se', 'no hay', NULL, 7, '2024-03-15 14:57:19', 1),
(26, '9622891', 'Juan David', 'Dominguez', 324234, 'cliente2pruebas@pruebas.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'nose', 'no se', 'no se', NULL, 7, '2024-03-15 15:38:36', 1),
(27, '4561118', 'Sebastian Baljeet', 'Balanta', 3053148023, 'ht2aq2kc@duck.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 7, '2024-03-18 23:30:53', 1),
(28, '98465498', 'Andres', 'Higuera', 3128114887, 'andres.higuera@uao.edu.co', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, '383be6fb4144470254ee-7ac80e05298155410ce1-62e5b915b749d7a25af7-dd269705d50fa64c01dd', 11, '2024-03-30 15:50:50', 1),
(29, '98465420596', 'Juan Camilo', 'Sanchez', 42384925, 'juansanchezpruebas31214@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 7, '2024-03-30 20:26:04', 1),
(30, NULL, 'Cliente Carlos', 'Sanchez', 3195206408, 'andresaltamirasanz@gmail.com', 'bf33d9267695135419718fac7a22f25a2006500cf629a46b5bef01b20a1ce473', NULL, NULL, NULL, '', 7, '2024-03-31 21:31:54', 1),
(31, NULL, 'Juan Eduardo', 'Jaramillo Guerrero', 3209255747, 'juan.e.jara12004@gmail.com', '6173b0ba4c052c2799bc99785a14edd8a19e408ef3c6fe7751e248fb64a70e2b', NULL, NULL, NULL, NULL, 7, '2024-04-20 15:13:16', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `categoriaid` bigint(20) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(14, 12, '1500000', 'Carlos', '<p>Hermoso programador &lt;3</p>', 9500000.00, 1, '', '2024-03-15 14:50:18', '', 0),
(15, 12, '98516', 'Juan_eduardo', '<p>solo juan eduardo</p>', 2500.00, 1, '', '2024-03-15 14:50:46', '', 0),
(16, 10, '65489752', 'BobEsponja', '<p>Matera de Bob Esponja</p>', 5600.00, 20, '', '2024-03-19 01:31:55', '', 1),
(17, 10, '61596', 'Groot', '<p>Ceramica de groot</p>', 8200.00, 12, '', '2024-03-19 01:34:17', '', 1),
(18, 10, '321456', 'Astronauta', '<p>Ceramica Astronauta para planta</p>', 7600.00, 16, '', '2024-03-19 01:38:45', '', 1),
(19, 12, '21564', 'Andres', '<p>ajsdka</p>', 500000.00, 1, '', '2024-03-30 16:09:16', '', 0),
(20, 12, '31156', 'nicolas', '<p>jasdkajksdj</p>', 650000.00, 1, '', '2024-03-30 16:12:18', '', 0),
(21, 12, '56003', 'alejandro', '<p>jajsdja</p>', 500000.00, 1, '', '2024-03-30 16:15:54', '', 0),
(22, 9, '23423', 'asda', '<p>asdaf</p>', 345234.00, 3, '', '2024-04-07 19:43:01', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolso`
--

CREATE TABLE `reembolso` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `idtransaccion` varchar(255) NOT NULL,
  `datoreembolso` text NOT NULL,
  `observacion` text NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reembolso`
--

INSERT INTO `reembolso` (`id`, `pedidoid`, `idtransaccion`, `datoreembolso`, `observacion`, `status`) VALUES
(1, 47, '77B2290178063315C', '{\"id\":\"77B2290178063315C\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/77B2290178063315C\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/075374812F7320241\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'asdaf', 'COMPLETED'),
(2, 3, '17F82703GY203431M', '{\"id\":\"17F82703GY203431M\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/17F82703GY203431M\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/0SR88829283378638\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'Descripcion Reembolso', 'COMPLETED'),
(3, 46, '67S5597595330111G', '{\"id\":\"67S5597595330111G\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/67S5597595330111G\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/1S170193V2902854D\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'asdffgf', 'COMPLETED'),
(4, 45, '1KL27793K35254349', '{\"id\":\"1KL27793K35254349\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/1KL27793K35254349\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/8LJ52071LV573973C\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'Reembolsar', 'COMPLETED'),
(5, 35, '9K074054CY0497618', '{\"id\":\"9K074054CY0497618\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/9K074054CY0497618\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7F4748134D389773V\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'Reembolso', 'COMPLETED');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `nombrerol` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema', 1),
(7, 'Cliente', 'Clientes tienda', 1),
(11, 'Directivo ArtCeramics', 'Directivo ArtCeramics', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `idtipopago` bigint(20) NOT NULL,
  `tipopago` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
(1, 'PayPal', 1),
(2, 'Efectivo', 1),
(3, 'Tarjeta', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`),
  ADD KEY `personaid` (`personaid`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `personaid` (`personaid`),
  ADD KEY `tipopagoid` (`tipopagoid`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `rolid` (`rolid`),
  ADD KEY `moduloid` (`moduloid`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `rolid` (`rolid`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaid` (`categoriaid`);

--
-- Indices de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`idtipopago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=734;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `idtipopago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD CONSTRAINT `reembolso_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
