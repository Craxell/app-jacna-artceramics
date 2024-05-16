-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 16-05-2024 a las 10:13:38
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
(106, 72, 18, 7600.00, 1),
(107, 73, 16, 5600.00, 4),
(109, 75, 16, 5600.00, 6),
(110, 76, 17, 8200.00, 4),
(111, 77, 18, 7600.00, 6),
(112, 78, 17, 8200.00, 2),
(113, 79, 16, 5600.00, 2),
(114, 79, 18, 7600.00, 1);

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
(55, 16, 'pro_cb5055f2aa7e243c180b2ab5478c8103.jpg');

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
(72, '9564894', NULL, NULL, 34, '2024-05-13 16:38:55', 2000.00, 9.00, 2, 'La casa de juan eduardo, por donde vive juan eduardo', 'Completo'),
(73, '97434657', NULL, NULL, 34, '2024-05-13 16:40:52', 2000.00, 24.00, 3, 'La casa de juan eduardo, por donde vive juan eduardo', 'Completo'),
(75, 'S7F8SDF52A68S', NULL, NULL, 34, '2024-05-13 16:47:25', 2000.00, 35.00, 3, 'La casa de juan eduardo, por donde vive juan eduardo', 'Completo'),
(76, '4312345', NULL, NULL, 34, '2024-05-13 16:48:10', 2000.00, 34.00, 2, 'La casa de juan eduardo, por donde vive juan eduardo', 'Completo'),
(77, '321895', NULL, NULL, 34, '2024-05-13 16:48:41', 2000.00, 47.00, 2, 'La casa de juan eduardo, por donde vive juan eduardo', 'Completo'),
(78, NULL, '6EP474303K3126038', '{\"id\":\"1GY45023VB238992G\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"18400.00\"},\"payee\":{\"email_address\":\"sb-j9sff30040795@business.example.com\",\"merchant_id\":\"GYNRJ3SND4NMU\"},\"description\":\"Compra de articulos en Art Ceramics por $ 18400\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Bogota\",\"admin_area_1\":\"Bogota\",\"postal_code\":\"110111\",\"country_code\":\"CO\"}},\"payments\":{\"captures\":[{\"id\":\"6EP474303K3126038\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"18400.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2024-05-13T21:52:03Z\",\"update_time\":\"2024-05-13T21:52:03Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-bas47230041665@personal.example.com\",\"payer_id\":\"3N25YFVEDJL8A\",\"address\":{\"country_code\":\"CO\"}},\"create_time\":\"2024-05-13T21:51:50Z\",\"update_time\":\"2024-05-13T21:52:03Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/1GY45023VB238992G\",\"rel\":\"self\",\"method\":\"GET\"}]}', 1, '2024-05-13 16:52:03', 2000.00, 18.00, 1, 'calle 115D #1-25, Yumbo', 'Completo'),
(79, '45FX546A1SD', NULL, NULL, 38, '2024-05-16 03:02:35', 2000.00, 20.00, 3, 'calle 115D #1-25, Yumbo', 'Completo');

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
(740, 1, 1, 1, 1, 1, 1),
(741, 1, 2, 1, 1, 1, 1),
(742, 1, 3, 1, 1, 1, 1),
(743, 1, 4, 1, 1, 1, 1),
(744, 1, 5, 1, 1, 1, 1),
(745, 1, 6, 1, 1, 1, 1),
(812, 11, 1, 1, 1, 0, 0),
(813, 11, 2, 0, 0, 0, 0),
(814, 11, 3, 1, 0, 1, 1),
(815, 11, 4, 1, 1, 1, 1),
(816, 11, 5, 1, 0, 1, 1),
(817, 11, 6, 1, 1, 1, 1),
(830, 7, 1, 1, 0, 0, 0),
(831, 7, 2, 0, 0, 0, 0),
(832, 7, 3, 0, 0, 0, 0),
(833, 7, 4, 0, 0, 0, 0),
(834, 7, 5, 1, 0, 0, 0),
(835, 7, 6, 0, 0, 0, 0);

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
(25, '95314321', 'Sdsa', 'Asda', 2344, 'cliente1@cliente.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '73452', 'no se', 'no hay', NULL, 7, '2024-03-15 14:57:19', 0),
(26, '9622891', 'Juan David', 'Dominguez', 324234, 'cliente2pruebas@pruebas.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'nose', 'no se', 'no se', NULL, 7, '2024-03-15 15:38:36', 1),
(27, '4561118', 'Sebastian', 'Balanta', 3053148023, 'ht2aq2kc@duck.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'No hay', 'No hay', 'No hay', NULL, 7, '2024-03-18 23:30:53', 1),
(28, '98465498', 'Andres', 'Higuera', 3128114887, 'andres.higuera@uao.edu.co', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, '383be6fb4144470254ee-7ac80e05298155410ce1-62e5b915b749d7a25af7-dd269705d50fa64c01dd', 11, '2024-03-30 15:50:50', 1),
(29, '98465420596', 'Juan Camilo', 'Sanchez', 42384925, 'juansanchezpruebas31214@gmail.com', 'bf33d9267695135419718fac7a22f25a2006500cf629a46b5bef01b20a1ce473', NULL, NULL, NULL, '', 11, '2024-03-30 20:26:04', 1),
(30, NULL, 'Cliente Carlos', 'Sanchez', 3195206408, 'andresaltamirasanz@gmail.com', 'bf33d9267695135419718fac7a22f25a2006500cf629a46b5bef01b20a1ce473', NULL, NULL, NULL, '', 7, '2024-03-31 21:31:54', 1),
(31, '312318941', 'Juan Eduardo', 'Jaramillo Guerrero', 3209255747, 'juan.e.jara12004@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 11, '2024-04-20 15:13:16', 1),
(32, NULL, 'Jean', 'Rodriguez', 3116610459, 'lilpip1405@gmail.com', 'b895d6030b12c384298b40d1dfe9107a4576bf8e282939718abda9b6a9e3618d', NULL, NULL, NULL, NULL, 7, '2024-05-12 10:12:56', 1),
(33, NULL, 'John', 'Tritus', 326129438, 'juan.david.penaranda@correounivalle.edu.co', 'ab81cbe72c05b72b315006d029edf793cb96612c55350ef4601115d37a8839a8', NULL, NULL, NULL, NULL, 7, '2024-05-12 11:44:25', 1),
(34, '38948414856', 'Nicolas', 'Franco', 3213647332, 'nicolasgonza290804@gmail.com', '5d6260297209fd67e6e3ec2a91e9577c55d5797e4480d3e8d730da57ae96b814', NULL, NULL, NULL, '', 11, '2024-05-12 16:42:48', 1),
(35, NULL, 'Liliana', 'Sánchez', 3117493849, 'lisasanz92@gmail.com', 'b89a675c1801e73c4e664153a7fd5477176c07d26454110c26a2896fc0e5d55e', NULL, NULL, NULL, NULL, 7, '2024-05-12 22:04:25', 1),
(36, NULL, 'Jhon Jairo', 'Rodriguez', 311654789, 'desifej194@rencr.com', '5cf36b2756050fe742d57f0fa7720d0e5c70bfb206f8795b4eb4f768a63ea121', NULL, NULL, NULL, NULL, 7, '2024-05-12 22:22:54', 1),
(37, NULL, 'Juan', 'Sebastian', 321698745, 'fofole1000@nweal.com', 'd62583f3a252c45b18d45eb2ac0142ddfe38a2eb6796cbc37a5e4576749356ad', NULL, NULL, NULL, NULL, 7, '2024-05-13 03:18:54', 1),
(38, NULL, 'Cliente', 'PruebasTres', 3236826964, 'clientepruebas3@gmail.com', 'd30fa0f96920320243f22fef483d2ae7058d487b62f3261fc788ab3cf6c65944', NULL, NULL, NULL, NULL, 7, '2024-05-16 03:02:08', 1);

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
(16, 10, '65489752', 'BobEsponja', '<p>Matera de Bob Esponja</p>', 5600.00, 20, '', '2024-03-19 01:31:55', '', 1),
(17, 10, '61596', 'Groot', '<p>Ceramica de groot</p>', 8200.00, 12, '', '2024-03-19 01:34:17', '', 1),
(18, 10, '321456', 'Astronauta', '<p>Ceramica Astronauta para planta</p>', 7600.00, 16, '', '2024-03-19 01:38:45', '', 1);

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
(11, 'Empleado ArtCeramics', 'Directivo ArtCeramics', 1);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

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
  MODIFY `idpedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=836;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
