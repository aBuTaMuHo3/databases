-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июн 06 2017 г., 21:51
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `lab_5`
--
CREATE DATABASE `lab_5` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lab_5`;

-- --------------------------------------------------------

--
-- Структура таблицы `complectation`
--

CREATE TABLE IF NOT EXISTS `complectation` (
  `id_computer` int(10) NOT NULL,
  `id_hardware` int(10) NOT NULL,
  KEY `id_computer` (`id_computer`,`id_hardware`),
  KEY `id_hardware` (`id_hardware`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `complectation`
--

INSERT INTO `complectation` (`id_computer`, `id_hardware`) VALUES
(1, 4),
(1, 7),
(1, 12),
(1, 14),
(2, 3),
(2, 5),
(2, 10),
(2, 13),
(3, 1),
(3, 9),
(3, 11),
(3, 14),
(4, 3),
(4, 8),
(4, 11),
(4, 13);

-- --------------------------------------------------------

--
-- Структура таблицы `computer`
--

CREATE TABLE IF NOT EXISTS `computer` (
  `id_computer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id_computer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `computer`
--

INSERT INTO `computer` (`id_computer`, `name`) VALUES
(1, 'Alpha_1'),
(2, 'Alpha_2'),
(3, 'GamingPC_1'),
(4, 'PC_001');

-- --------------------------------------------------------

--
-- Структура таблицы `hardware`
--

CREATE TABLE IF NOT EXISTS `hardware` (
  `id_hardware` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `id_manufacturer` int(10) NOT NULL,
  `price` int(11) NOT NULL,
  `hardware_type` enum('processor','videocard','RAM','motherboard') NOT NULL,
  PRIMARY KEY (`id_hardware`),
  KEY `id_manufacturer` (`id_manufacturer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `hardware`
--

INSERT INTO `hardware` (`id_hardware`, `name`, `id_manufacturer`, `price`, `hardware_type`) VALUES
(1, 'GTX 1060', 5, 16000, 'videocard'),
(2, 'GTX 1050Ti', 5, 10000, 'videocard'),
(3, 'GTX 1080Ti', 5, 50000, 'videocard'),
(4, 'GT 1030', 5, 5000, 'videocard'),
(5, 'Core i7 7700k', 4, 24000, 'processor'),
(6, 'Core i5 7400', 4, 13000, 'processor'),
(7, 'Pentium g4560', 4, 4000, 'processor'),
(8, 'Ryzen 7 1800x', 1, 37000, 'processor'),
(9, 'Ryzen 5 1400', 1, 12000, 'processor'),
(10, 'PRIME B350-PLUS', 2, 7500, 'motherboard'),
(11, 'PRIME H270-PLUS', 2, 7000, 'motherboard'),
(12, 'H110M PRO-VD', 7, 2800, 'motherboard'),
(13, 'HX424C15F*2K2/16', 6, 8200, 'RAM'),
(14, 'CT4G4DFS8213', 3, 1700, 'RAM'),
(15, 'GTX 1060', 6, 18000, 'videocard');

-- --------------------------------------------------------

--
-- Структура таблицы `hardware_in_storage`
--

CREATE TABLE IF NOT EXISTS `hardware_in_storage` (
  `id_hardware` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `id_storage` int(11) NOT NULL,
  KEY `id_hardware` (`id_hardware`),
  KEY `storage` (`id_storage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hardware_in_storage`
--

INSERT INTO `hardware_in_storage` (`id_hardware`, `amount`, `id_storage`) VALUES
(1, 3, 1),
(2, 5, 1),
(3, 8, 1),
(4, 1, 1),
(5, 11, 1),
(6, 3, 1),
(7, 7, 1),
(8, 5, 1),
(9, 10, 1),
(11, 4, 1),
(12, 6, 1),
(13, 25, 1),
(14, 20, 1),
(15, 8, 1),
(11, 3, 2),
(13, 31, 2),
(6, 10, 2),
(1, 20, 2),
(8, 16, 2),
(3, 5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `id_manufacturer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `manufacturer`
--

INSERT INTO `manufacturer` (`id_manufacturer`, `name`, `address`) VALUES
(1, 'AMD', ''),
(2, 'ASUS', ''),
(3, 'Crucial', ''),
(4, 'Intel', ''),
(5, 'Nvidia', ''),
(6, 'Kingston', ''),
(7, 'MSI', '');

-- --------------------------------------------------------

--
-- Структура таблицы `storage`
--

CREATE TABLE IF NOT EXISTS `storage` (
  `id_storage` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(40) NOT NULL,
  PRIMARY KEY (`id_storage`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `storage`
--

INSERT INTO `storage` (`id_storage`, `address`) VALUES
(1, 'address 1'),
(2, 'address 2');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `complectation`
--
ALTER TABLE `complectation`
  ADD CONSTRAINT `complectation_ibfk_1` FOREIGN KEY (`id_hardware`) REFERENCES `hardware` (`id_hardware`),
  ADD CONSTRAINT `complectation_ibfk_2` FOREIGN KEY (`id_computer`) REFERENCES `computer` (`id_computer`);

--
-- Ограничения внешнего ключа таблицы `hardware`
--
ALTER TABLE `hardware`
  ADD CONSTRAINT `hardware_ibfk_1` FOREIGN KEY (`id_manufacturer`) REFERENCES `manufacturer` (`id_manufacturer`);

--
-- Ограничения внешнего ключа таблицы `hardware_in_storage`
--
ALTER TABLE `hardware_in_storage`
  ADD CONSTRAINT `hardware_in_storage_ibfk_2` FOREIGN KEY (`id_storage`) REFERENCES `storage` (`id_storage`),
  ADD CONSTRAINT `hardware_in_storage_ibfk_1` FOREIGN KEY (`id_hardware`) REFERENCES `hardware` (`id_hardware`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
