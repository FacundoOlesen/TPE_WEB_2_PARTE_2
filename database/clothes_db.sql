-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 01:40:24
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
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `comment` varchar(120) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id_comment`, `comment`, `id_producto`) VALUES
(1, 'El mejor buzo que compre, muy buena calidad.', 1),
(2, 'Me llego otro talle del pantalon pero muy bueno.', 2),
(3, 'Buena campera, es muy abrigada!', 3),
(4, 'Linda camisa para fiestas.', 4),
(5, 'Buenas zapas!', 5),
(6, 'Lindo gorrito', 6),
(7, 'Buen buzo este', 7),
(8, 'Buena remeraa dale arg', 8),
(9, 'Me quedaron chicas', 9),
(10, 'Buena remera', 10),
(11, 'Lindo gorro', 11),
(12, 'Me quedo grande la camisa pero esta buena', 12),
(13, 'Re abrigada la campera!', 13),
(14, 'Buen pantalon', 14),
(15, 'Buenisimo', 1),
(16, 'Muy buen pantalon!', 2),
(17, 'Buenisimo', 2),
(18, 'Buenisimo', 4),
(19, 'Buenisimo', 7),
(20, 'Buenisimo', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL,
  `talle` varchar(10) NOT NULL,
  `descripcion` varchar(70) NOT NULL,
  `id_categoria_fk` varchar(45) NOT NULL,
  `imagen` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `nombre`, `precio`, `talle`, `descripcion`, `id_categoria_fk`, `imagen`) VALUES
(1, 'Buzo Adidas Classics', 70000, 'XL', 'Buzo ADIDAS Clásico Temporada 2022 Oversize', 'Buzos ', 'img/products/634dadfdaf067.jpg'),
(2, 'Pantalon Cargos', 7000, 'L', 'Pantalón cargo de tela frizada ultimo modelo 2022', 'Pantalones', 'img/products/634dae3295807.jpg'),
(3, 'Campera Adidas negra', 700, 'XXL', 'Campera Rompevientos Adidas ', 'Camperas', 'img/products/634dae80807cf.jpg'),
(4, 'Camisa Oneill ', 1000, 'S', 'Camisa holgada para el verano', 'Camisas  ', 'img/products/634daed283d52.jpg'),
(5, 'Zapatillas NIKE AF1 Off-White', 32000, '10.5', 'Zapatillas Nike off-white exclusivas ', 'Zapatillas', 'img/products/634daf1e6bea5.jpg'),
(6, 'Gorro Adidas ', 42000, 'L', 'Gorro Adidas de tela para el invierno', 'Buzos ', 'img/products/634daf4f56d19.jpg'),
(7, 'Buzo Nike', 7000, 'L', 'Buzo Nike de tela', 'Camperas', 'img/products/634daf8dd7593.jpg'),
(8, 'Remera Argentina', 7500, 'L', 'Remera Selección Argentina Mundial 2022', 'Remeras', 'img/products/634db00d0905a.jpg'),
(9, 'Zapatillas Vans ', 70100, '14.5', 'Zapatillas Vans M Bmx Sk8 Hi Negro Cuadrille', 'Zapatillas', 'img/products/634db19762c96.jpg'),
(10, 'Remera Blanca clasica', 200, 'XL', 'Remera blanca lisa clasica', 'Remeras', ''),
(11, 'Gorro blanco', 10000, 'L', 'Gorro para el invierno abrigado', 'Gorros', ''),
(12, 'Camisa Azul', 30000, 'L', 'Camisa azul no tan abrigada para fiestas', 'Camisas  ', 'img/products/634deaef12dd6.jpg'),
(13, 'Campera The North Face', 50000, 'L ', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(14, 'Pantalon Traje', 40000, 'L', 'Pantalón negro para traje', 'Pantalones ', 'img/products/634dec0a7e42e.jpg'),
(16, 'Buzo Negro', 10000, 'XXL', 'Buzo negro de algodon', 'Buzos', 'img/products/634daf4f56d19.jpg'),
(17, 'Buzo Negro', 2000, 'XXL', 'Buzo negro de algodon', 'Buzos', 'img/products/634daf4f56d19.jpg'),
(18, 'Buzo Negro', 2000, 'XXL', 'Buzo negro de algodon', 'Buzos', 'img/products/634daf4f56d19.jpg'),
(19, 'Buzo Negro', 10000, 'XXL', 'Buzo negro de algodon', 'Buzos', 'img/products/634daf4f56d19.jpg'),
(20, 'Buzo Negro', 12000, 'XXL', 'Buzo negro de algodon', 'Buzos', 'img/products/634daf4f56d19.jpg'),
(22, 'Gorro Invierno', 2550, 'L', 'Gorro para invierno', 'Gorros', 'img/products/634deaef12dd6.jpg'),
(23, 'Gorro Invierno', 2550, 'L', 'Gorro para invierno', 'Gorros', 'img/products/634deaef12dd6.jpg'),
(24, 'Gorro Invierno', 2550, 'L', 'Gorro para invierno', 'Gorros', 'img/products/634deaef12dd6.jpg'),
(25, 'Gorro Invierno', 2550, 'L', 'Gorro para invierno', 'Gorros', 'img/products/634deaef12dd6.jpg'),
(26, 'Gorro Invierno', 2550, 'L', 'Gorro para invierno', 'Gorros', 'img/products/634deaef12dd6.jpg'),
(27, 'Campera The North Face', 25520, 'L', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(28, 'Campera The North Face', 25520, 'L', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(29, 'Campera The North Face', 25520, 'L', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(30, 'Campera The North Face', 25520, 'L', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(31, 'Campera The North Face', 25520, 'L', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(32, 'Campera The North Face', 25520, 'L', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(33, 'Campera The North Face', 25520, 'L', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(34, 'Campera The North Face', 25520, 'L', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg'),
(35, 'Campera The North Face', 25520, 'L', 'Campera The North Face rompeviento ideal para la nieve', 'Camperas', 'img/products/634deb62ef677.jpg');

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
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_producto` (`id_producto`);

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
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categories` (`nombre_categoria`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
