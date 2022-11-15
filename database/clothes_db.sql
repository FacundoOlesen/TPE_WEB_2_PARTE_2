-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2022 a las 00:59:12
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clothes_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_categoria`, `nombre_categoria`) VALUES
(10, 'Accesorios'),
(11, 'Buzos '),
(7, 'Camisas  '),
(3, 'Camperas '),
(4, 'Gorros'),
(6, 'Pantalones '),
(2, 'Remeras'),
(5, 'Zapatillas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `talle` varchar(10) NOT NULL,
  `descripcion` varchar(70) NOT NULL,
  `id_categoria_fk` varchar(45) NOT NULL,
  `imagen` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `nombre`, `precio`, `talle`, `descripcion`, `id_categoria_fk`, `imagen`) VALUES
(1, 'Buzo Adidas Classicss', '$15405', 'XL', 'Buzo ADIDAS Clásico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(2, 'Pantalon Cargos', '$70002', 'L', 'Pantalón cargo de tela frizada ultimo modelo 2022', 'Pantalones', 'img/products/634dae3295807.jpg'),
(3, 'Campera Adidas negra', '$20000', 'XXL', 'Campera Rompevientos Adidas ', 'Camperas', 'img/products/634dae80807cf.jpg'),
(4, 'Camisa Oneill ', '$20000', 'S', 'Camisa holgada para el verano', 'Camisas  ', 'img/products/634daed283d52.jpg'),
(5, 'Zapatillas NIKE AF1 Off-White', '$50000', '10.5', 'Zapatillas Nike off-white exclusivas ', 'Zapatillas', 'img/products/634daf1e6bea5.jpg'),
(6, 'Gorro Adidas ', '$3000', 'L', 'Gorro Adidas de tela para el invierno', 'Buzos ', 'img/products/634daf4f56d19.jpg'),
(7, 'Buzo Nike', '$10000', 'L', 'Buzo Nike de tela', 'Camperas', 'img/products/634daf8dd7593.jpg'),
(8, 'Remera Argentina', '$2000', 'L', 'Remera Selección Argentina Mundial 2022', 'Remeras', 'img/products/634db00d0905a.jpg'),
(9, 'Zapatillas Vans ', '$29999', '14.5', 'Zapatillas Vans M Bmx Sk8 Hi Negro Cuadrille', 'Zapatillas', 'img/products/634db19762c96.jpg'),
(11, 'Remera Blanca clasica', '$3000', 'XL', 'Remera blanca lisa clasica', 'Remeras', ''),
(13, 'Gorro blanco', '$3000', 'L', 'Gorro para el invierno abrigado', 'Gorros', ''),
(22, 'Camisa Azul', '$8000', 'L', 'Camisa azul no tan abrigada para fiestas', 'Camisas  ', 'img/products/634deaef12dd6.jpg'),
(23, 'Campera The North Face', '$60000', 'L ', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(27, 'Pantalon Traje', '$20000', 'L', 'Pantalón negro para traje', 'Pantalones ', 'img/products/634dec0a7e42e.jpg'),
(35, 'Buzo Adidas Classicss', '$15405', 'XL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Gorros', 'img/products/634dadfdaf067.jpg'),
(36, 'Buzo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Gorros', 'img/products/634dadfdaf067.jpg'),
(37, 'BuzITo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Gorros', 'img/products/634dadfdaf067.jpg'),
(40, 'BuzITo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(42, 'BuzITo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(43, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(44, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(45, 'dsadsa', '$52', 'dsa', 'dsadsadas', 'Buzos', ''),
(46, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(49, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(50, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(52, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buzo ADIDAS Clássico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(55, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo ADIDAS Clássico Temporada 2022 Oversize', 'Zapatillas', 'img/products/634dadfdaf067.jpg'),
(60, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo ADIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(61, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo ADIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(64, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo ADIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(65, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo ADIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(67, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo ADIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(72, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo ADIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(73, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo ADIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(78, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(79, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(81, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(82, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(83, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(84, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(86, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(90, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(91, 'BuzIsTo Adidas Classicss', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(95, 's', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(96, 'sdsa', '$15405', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Buzos', 'img/products/634dadfdaf067.jpg'),
(102, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(103, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(104, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássico Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(105, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(106, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(107, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(108, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(109, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(112, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(113, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(114, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf067.jpg'),
(115, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(116, 'sdsa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(117, 'sdssa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(118, 'sdssa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(119, 'sdssa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(120, 'sdssa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(121, 'sdssa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(122, 'sdssa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(123, 'sdssa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(124, 'hola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(125, 'hola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(126, 'hola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(127, 'hola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(128, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(129, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(130, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(131, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(132, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(133, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(134, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(135, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(136, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(137, 'hsola', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(138, 'dsa', 'ds', 'das', 'dsadsa', 'Buzos', 'img/products/63727de002000.jpg'),
(139, 'holaa', 's', 'XXL', 'Buszo AdsaDIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfdaf07.jpg'),
(141, 'sdsdx', 'ssss', 'XsXL', 'Buszo AdsasDssIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfsdaf07.jpg'),
(142, 'sdsdx', 'ssss', 'XsXL', 'Buszo AdsasDssIDAS Clássio Temporada 2022 Oversize', 'Remeras', 'img/products/634dadfsdaf07.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'admin@admin.com', '$2y$10$zZIHmPwzfH1lamhkz/TmiOBGCttnP41tA2dT.dIFG/36WCf8xmShW');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria_fk` (`id_categoria_fk`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categories` (`nombre_categoria`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
