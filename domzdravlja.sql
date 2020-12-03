-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2020 at 01:09 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `domzdravlja`
--

-- --------------------------------------------------------

--
-- Table structure for table `doktori`
--

CREATE TABLE `doktori` (
  `id` int(20) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `jmbg` varchar(255) DEFAULT NULL,
  `idkategorije` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doktori`
--

INSERT INTO `doktori` (`id`, `ime`, `prezime`, `jmbg`, `idkategorije`) VALUES
(1, 'Milan', 'Živanović', '2212969382287', 1),
(2, 'Dragana', 'Mikanović', '0905988382287', 2),
(3, 'Filip', 'Dejanović', '0303990382287', 3),
(4, 'Milica', 'Rakić', '1701969384787', 4),
(11, 'Dragana', 'Mikanović', '0905988382287', 2),
(12, 'Filip', 'Dejanović', '0303990382287', 3),
(13, 'Milica', 'Rakić', '1701969384787', 4),
(14, 'Branislav', 'Avramović', '0508992382287', 4);

-- --------------------------------------------------------

--
-- Table structure for table `kategorijedoktora`
--

CREATE TABLE `kategorijedoktora` (
  `idkategorije` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategorijedoktora`
--

INSERT INTO `kategorijedoktora` (`idkategorije`, `naziv`) VALUES
(1, 'Opšte prakse'),
(2, 'Dermatolog'),
(3, 'Neurolog'),
(4, 'Otorinolaringolog');

-- --------------------------------------------------------

--
-- Table structure for table `pacijenti`
--

CREATE TABLE `pacijenti` (
  `id` int(20) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `jmbg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pacijenti`
--

INSERT INTO `pacijenti` (`id`, `ime`, `prezime`, `jmbg`) VALUES
(1, 'Danica', 'Vesković', '1901972715678'),
(2, 'Jovana', 'Čordar', '2704998715851'),
(3, 'Nina', 'Mandić', '1605997715899'),
(4, 'Ivan', 'Ivanović', '1203979643902'),
(5, 'Petar', 'Petrović', '3008989678465');

-- --------------------------------------------------------

--
-- Table structure for table `pregledi`
--

CREATE TABLE `pregledi` (
  `id` int(20) NOT NULL,
  `datum` datetime NOT NULL,
  `idpacijenta` int(20) NOT NULL,
  `iddoktora` int(20) NOT NULL,
  `simptomi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pregledi`
--

INSERT INTO `pregledi` (`id`, `datum`, `idpacijenta`, `iddoktora`, `simptomi`) VALUES
(1, '2016-03-20 11:24:09', 1, 1, 'Pacijent se žali na kašalj i bol u grlu'),
(2, '2025-10-20 10:34:09', 2, 2, 'Pacijentu se pojavio osip na koži'),
(3, '2007-06-20 09:34:09', 3, 3, 'Pacijent se žali na bolove u prstima');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doktori`
--
ALTER TABLE `doktori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkategorije` (`idkategorije`);

--
-- Indexes for table `kategorijedoktora`
--
ALTER TABLE `kategorijedoktora`
  ADD PRIMARY KEY (`idkategorije`);

--
-- Indexes for table `pacijenti`
--
ALTER TABLE `pacijenti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pregledi`
--
ALTER TABLE `pregledi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpacijenta` (`idpacijenta`),
  ADD KEY `iddoktora` (`iddoktora`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doktori`
--
ALTER TABLE `doktori`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kategorijedoktora`
--
ALTER TABLE `kategorijedoktora`
  MODIFY `idkategorije` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pacijenti`
--
ALTER TABLE `pacijenti`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pregledi`
--
ALTER TABLE `pregledi`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doktori`
--
ALTER TABLE `doktori`
  ADD CONSTRAINT `doktori_ibfk_1` FOREIGN KEY (`idkategorije`) REFERENCES `kategorijedoktora` (`idkategorije`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
