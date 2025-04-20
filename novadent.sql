-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2025 a las 06:08:22
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
-- Base de datos: `novadent`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `ID_HORARIO` int(11) NOT NULL,
  `HORARIO_FIN` varchar(255) DEFAULT NULL,
  `HORARIO_INICIO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`ID_HORARIO`, `HORARIO_FIN`, `HORARIO_INICIO`) VALUES
(1, '14:00', '11:00'),
(3, '15:00', '09:00'),
(4, '17:30', '08:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `odontologo`
--

CREATE TABLE `odontologo` (
  `ID` int(11) NOT NULL,
  `APELLIDOS` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `ESPECIALIDAD` varchar(255) DEFAULT NULL,
  `FECHA_NAC` datetime DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `UNHORARIO_ID_HORARIO` int(11) DEFAULT NULL,
  `UNUSUARIO_ID_USUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `odontologo`
--

INSERT INTO `odontologo` (`ID`, `APELLIDOS`, `DIRECCION`, `DNI`, `ESPECIALIDAD`, `FECHA_NAC`, `NOMBRE`, `TELEFONO`, `UNHORARIO_ID_HORARIO`, `UNUSUARIO_ID_USUARIO`) VALUES
(1, 'Munoz', 'Calle 127', '2020', 'Muelas', '2024-10-09 05:00:00', 'Camilo', '2020', 3, 2),
(2, 'Lopez', 'Calle 315', '1717', 'Braquets', '2025-04-02 05:00:00', 'Laura', '3152020', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `ID` int(11) NOT NULL,
  `APELLIDOS` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `EPS` tinyint(1) DEFAULT 0,
  `FECHA_NAC` datetime DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `TIPO_SANGRE` varchar(255) DEFAULT NULL,
  `UNRESPONSABLE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`ID`, `APELLIDOS`, `DIRECCION`, `DNI`, `EPS`, `FECHA_NAC`, `NOMBRE`, `TELEFONO`, `TIPO_SANGRE`, `UNRESPONSABLE_ID`) VALUES
(1, 'JUPO', 'Calle 127', '10204534', 1, '2025-04-01 05:00:00', 'Julia', '3102809512', 'O-', 1),
(3, 'Lopez', 'Calle 315', '10204534', 1, '2025-04-01 05:00:00', 'Andrea', '3152020', 'A-', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ID` int(11) NOT NULL,
  `APELLIDOS` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHA_NAC` datetime DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

CREATE TABLE `responsable` (
  `ID` int(11) NOT NULL,
  `APELLIDOS` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHA_NAC` datetime DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `TIPO_RESPONSABLE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `responsable`
--

INSERT INTO `responsable` (`ID`, `APELLIDOS`, `DIRECCION`, `DNI`, `FECHA_NAC`, `NOMBRE`, `TELEFONO`, `TIPO_RESPONSABLE`) VALUES
(1, 'Torres', 'Calle 300', '1414', '2025-01-16 05:00:00', 'Maria', '3102809512', 'Abuel@');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretario`
--

CREATE TABLE `secretario` (
  `ID` int(11) NOT NULL,
  `APELLIDOS` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHA_NAC` datetime DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `SECTOR` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `UNUSUARIO_ID_USUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `secretario`
--

INSERT INTO `secretario` (`ID`, `APELLIDOS`, `DIRECCION`, `DNI`, `FECHA_NAC`, `NOMBRE`, `SECTOR`, `TELEFONO`, `UNUSUARIO_ID_USUARIO`) VALUES
(1, 'Lopez', 'Calle 315', '12', '2024-12-04 05:00:00', 'Andrea', 'Recepcion', '3152020', 3),
(2, 'Torres', 'Calle 300', '1414', '2003-02-12 05:00:00', 'Luna', 'Consultorio', '3102809512', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `ID_TURNO` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(255) DEFAULT NULL,
  `TRATAMIENTO` varchar(255) DEFAULT NULL,
  `id_odonto` int(11) DEFAULT NULL,
  `id_pacien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`ID_TURNO`, `FECHA`, `HORA`, `TRATAMIENTO`, `id_odonto`, `id_pacien`) VALUES
(1, '2025-04-01', '10:00', 'Calzar diente', 2, 3),
(2, '2025-04-18', '11:52', 'Colocar Braquets', 2, 1),
(3, '2025-04-18', '15:13', 'Calzar diente', 2, 3),
(4, '2025-04-18', '07:15', 'Colocar Braquets', 1, 1),
(5, '2025-04-17', '22:02', 'Calzar diente', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `CONTRASENIA` varchar(255) DEFAULT NULL,
  `NOMBRE_USUARIO` varchar(255) DEFAULT NULL,
  `ROL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `CONTRASENIA`, `NOMBRE_USUARIO`, `ROL`) VALUES
(1, '1234', 'Laura', 'Odontologo'),
(2, '1234', 'Camilo', 'Odontologo'),
(3, '1234', 'Andrea', 'Secretaria'),
(5, '1234', 'Luna', 'Secretaria');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`ID_HORARIO`);

--
-- Indices de la tabla `odontologo`
--
ALTER TABLE `odontologo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ODONTOLOGO_UNHORARIO_ID_HORARIO` (`UNHORARIO_ID_HORARIO`),
  ADD KEY `FK_ODONTOLOGO_UNUSUARIO_ID_USUARIO` (`UNUSUARIO_ID_USUARIO`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PACIENTE_UNRESPONSABLE_ID` (`UNRESPONSABLE_ID`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `secretario`
--
ALTER TABLE `secretario`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SECRETARIO_UNUSUARIO_ID_USUARIO` (`UNUSUARIO_ID_USUARIO`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`ID_TURNO`),
  ADD KEY `FK_TURNO_id_odonto` (`id_odonto`),
  ADD KEY `FK_TURNO_id_pacien` (`id_pacien`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `ID_HORARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `odontologo`
--
ALTER TABLE `odontologo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `responsable`
--
ALTER TABLE `responsable`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `secretario`
--
ALTER TABLE `secretario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `ID_TURNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `odontologo`
--
ALTER TABLE `odontologo`
  ADD CONSTRAINT `FK_ODONTOLOGO_UNHORARIO_ID_HORARIO` FOREIGN KEY (`UNHORARIO_ID_HORARIO`) REFERENCES `horario` (`ID_HORARIO`),
  ADD CONSTRAINT `FK_ODONTOLOGO_UNUSUARIO_ID_USUARIO` FOREIGN KEY (`UNUSUARIO_ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `FK_PACIENTE_UNRESPONSABLE_ID` FOREIGN KEY (`UNRESPONSABLE_ID`) REFERENCES `responsable` (`ID`);

--
-- Filtros para la tabla `secretario`
--
ALTER TABLE `secretario`
  ADD CONSTRAINT `FK_SECRETARIO_UNUSUARIO_ID_USUARIO` FOREIGN KEY (`UNUSUARIO_ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `FK_TURNO_id_odonto` FOREIGN KEY (`id_odonto`) REFERENCES `odontologo` (`ID`),
  ADD CONSTRAINT `FK_TURNO_id_pacien` FOREIGN KEY (`id_pacien`) REFERENCES `paciente` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
