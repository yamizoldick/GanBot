-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2018 a las 14:22:36
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cinetop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(5) NOT NULL,
  `tipo_cliente` int(5) NOT NULL,
  `nom_cliente` int(50) NOT NULL,
  `pago_cliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combo`
--

CREATE TABLE `combo` (
  `id_combo` int(2) NOT NULL,
  `nom_combo` varchar(20) NOT NULL,
  `precio_combo` int(3) NOT NULL,
  `imag_combo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `combo`
--

INSERT INTO `combo` (`id_combo`, `nom_combo`, `precio_combo`, `imag_combo`) VALUES
(1, 'Hot Dog', 99, 'http://static.cinepolis.com/marcas/cumple-de-pelicula/imagenes/png/bg-combos-mx.png'),
(2, 'Nachos', 99, 'http://static.cinepolis.com/marcas/cumple-de-pelicula/imagenes/png/bg-combos-mx.png'),
(3, 'Pelonete', 99, 'http://static.cinepolis.com/marcas/cumple-de-pelicula/imagenes/png/bg-combos-mx.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido`
--

CREATE TABLE `contenido` (
  `id_combo` int(3) NOT NULL,
  `id_articulo` int(2) NOT NULL,
  `cantidad` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despedida`
--

CREATE TABLE `despedida` (
  `id_despe` int(2) NOT NULL,
  `resp_despe` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `despedida`
--

INSERT INTO `despedida` (`id_despe`, `resp_despe`) VALUES
(1, 'Adios'),
(2, 'Estamos para servirle'),
(3, 'Bye'),
(4, 'Hasta luego'),
(5, 'Esperamos su visita'),
(6, 'Que tenga buen dia'),
(7, 'Hasta la proxima'),
(8, 'De nada'),
(9, 'Para servirle'),
(10, 'Gracias a usted');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dulceria`
--

CREATE TABLE `dulceria` (
  `id_articulo` int(3) NOT NULL,
  `nom_articulo` varchar(30) NOT NULL,
  `tipo_articulo` varchar(10) NOT NULL,
  `precio_art` int(3) NOT NULL,
  `imag_dulce` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dulceria`
--

INSERT INTO `dulceria` (`id_articulo`, `nom_articulo`, `tipo_articulo`, `precio_art`, `imag_dulce`) VALUES
(1, 'Palomitas chicas', 'Botana', 45, 'https://mx.toluna.com/dpolls_images/2016/04/18/6b7ce3ef-336e-4866-9aa1-4b8d3e997a0f_x300.jpg'),
(2, 'Refresco chico', 'Bebida', 40, 'http://compraloaqui.hn/wp-content/uploads/2013/12/Cinepolis-Refrescos.png'),
(3, 'Hot dog', 'Comida', 35, 'http://www.renegado.com.mx/images/stories/Blog/HotDog/06.jpg'),
(4, 'Nachos', 'Botana', 25, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDurAh7WcQ7ig78kQHF9bcHB6tbNnJyJsW6KzHIZddSlUiFEG4'),
(5, 'Pelonete', 'Dulce', 20, 'http://www.elgransrj.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/o/comprar-pelon-pelonete-online-espan_a-el-gran-sr-j.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `id_peli` int(5) NOT NULL,
  `id_sala` int(2) NOT NULL,
  `hora_func` time NOT NULL,
  `precio_func` int(3) NOT NULL,
  `tipo_func` varchar(2) NOT NULL,
  `idioma` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id_peli` int(5) NOT NULL,
  `nom_peli` varchar(50) NOT NULL,
  `clas_peli` varchar(1) NOT NULL,
  `des_peli` varchar(1000) NOT NULL,
  `hora_peli` time NOT NULL,
  `imag_peli` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id_peli`, `nom_peli`, `clas_peli`, `des_peli`, `hora_peli`, `imag_peli`) VALUES
(1, 'HOTEL TRANSYILVANIA 3: MONSTRUOS DE VACACIONES', 'A', 'La familia de monstruos se embarca en un crucero de lujo para que por fin Drac pueda tomarse un descanso de proveer de vacaciones al resto en el hotel. Es una navegación tranquila para la pandilla de Drac, ya que los monstruos se entregan a toda la diversión a bordo que ofrece el crucero, desde el voleibol de monstruos y las excursiones exóticas, a ponerse al día con sus bronceados de luna. Pero las vacaciones de ensueño se convierten en una pesadilla cuando Mavis se da cuenta de que Drac se ha enamorado de la misteriosa capitana de la nave, Ericka, quien esconde un peligroso secreto que podría destruir a todos los monstruos.', '01:31:00', 'https://www.cinetop.com/CDN/media/entity/get/FilmPosterGraphic/h-HO00000222?referenceScheme=Cinema&allowPlaceHolder=true&height=600'),
(2, 'ANT-MAN AND THE WASP ', 'B', 'Tras lo sucedido en \'Capitán América: Civil War\', Scott Lang debe lidiar con las consecuencias de sus acciones como superhéroe y como padre. Mientras intenta equilibrar su vida familiar con sus responsabilidades como Ant-Man, Hope Van Dyne y Hank Pym recurren a él con una nueva misión muy urgente. Scott debe, una vez más, ponerse el traje y aprender a luchar junto a La Avispa mientras el equipo trabaja para descubrir secretos de su pasado', '01:58:00', 'https://www.cinetop.com/CDN/media/entity/get/FilmPosterGraphic/h-HO00000221?referenceScheme=Cinema&allowPlaceHolder=true&height=600'),
(3, 'RASCACIELOS: RESCATE EN LAS ALTURAS', 'B', 'Will Ford, antiguo líder del Equipo de Rescate de Rehenes del FBI y veterano de guerra del ejército de Estados Unidos, ahora se encarga de evaluar la seguridad de los rascacielos. Durante un viaje de trabajo en China, se ve incriminado en el incendio del edificio más alto y seguro del mundo. Perseguido y a la fuga, Will deberá encontrar a los que le han tendido la trampa, limpiar su nombre y rescatar a su familia.', '01:48:00', 'https://www.cinetop.com/CDN/media/entity/get/FilmPosterGraphic/h-HO00000247?referenceScheme=Cinema&allowPlaceHolder=true&height=600'),
(4, 'LA MALDICIÓN DEL DIABLO', 'B', 'Mary, una mujer embarazada de gemelos, da a luz, pero solo uno de los niños sobrevive. Afectada por el suceso, empieza a recibir señales de que algo maligno, un ente sobrenatural, ha elegido a su hijo y no se detendrá ante nada para llevárselo.', '01:27:00', 'https://www.cinetop.com/CDN/media/entity/get/FilmPosterGraphic/h-HO00000252?referenceScheme=Cinema&allowPlaceHolder=true&height=600'),
(5, 'SICARIO: EL DIA DEL SOLDADO ', 'B', 'La guerra contra las drogas en la frontera entre Estados Unidos y México se intensificó a medida que los carteles comenzaron a traficar con terroristas en la frontera de los Estados Unidos. Para luchar en la guerra, el agente federal Matt Graver vuelve a formar equipos con el mercurial Alejandro.', '01:22:00', 'https://www.cinetop.com/CDN/media/entity/get/FilmPosterGraphic/h-HO00000244?referenceScheme=Cinema&allowPlaceHolder=true&height=600');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(2) NOT NULL,
  `tipo_sala` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id_sala`, `tipo_sala`) VALUES
(1, 'Publica'),
(2, 'Publica'),
(3, 'VIP'),
(4, 'VIP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saludo`
--

CREATE TABLE `saludo` (
  `id_saludo` int(2) NOT NULL,
  `resp_saludo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saludo`
--

INSERT INTO `saludo` (`id_saludo`, `resp_saludo`) VALUES
(1, 'Hola'),
(2, 'Buen dia'),
(3, 'Que tal'),
(4, 'Que onda'),
(5, 'Hi'),
(6, 'Buen dia'),
(7, 'Hola, ¿En que puedo ayuda'),
(8, 'Hola, ¿Que necesita?'),
(9, 'Que tal, ¿Puedo ayudarle ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `combo`
--
ALTER TABLE `combo`
  ADD PRIMARY KEY (`id_combo`);

--
-- Indices de la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD PRIMARY KEY (`id_combo`),
  ADD KEY `contenido_ibfk_2` (`id_articulo`);

--
-- Indices de la tabla `despedida`
--
ALTER TABLE `despedida`
  ADD PRIMARY KEY (`id_despe`);

--
-- Indices de la tabla `dulceria`
--
ALTER TABLE `dulceria`
  ADD PRIMARY KEY (`id_articulo`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id_peli`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`);

--
-- Indices de la tabla `saludo`
--
ALTER TABLE `saludo`
  ADD PRIMARY KEY (`id_saludo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `combo`
--
ALTER TABLE `combo`
  MODIFY `id_combo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contenido`
--
ALTER TABLE `contenido`
  MODIFY `id_combo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `despedida`
--
ALTER TABLE `despedida`
  MODIFY `id_despe` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `dulceria`
--
ALTER TABLE `dulceria`
  MODIFY `id_articulo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id_peli` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `id_sala` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `saludo`
--
ALTER TABLE `saludo`
  MODIFY `id_saludo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD CONSTRAINT `contenido_ibfk_1` FOREIGN KEY (`id_combo`) REFERENCES `combo` (`id_combo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contenido_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `dulceria` (`id_articulo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
