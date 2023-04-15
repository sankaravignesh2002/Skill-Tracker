-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 15, 2023 at 05:27 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skilltracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `date` date DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `present` varchar(10) DEFAULT NULL,
  `absent` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`date`, `name`, `present`, `absent`) VALUES
('2023-04-15', 'sravan@student.tce.edu', 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `attnd`
--

DROP TABLE IF EXISTS `attnd`;
CREATE TABLE IF NOT EXISTS `attnd` (
  `name` varchar(50) DEFAULT NULL,
  `math` int(11) DEFAULT NULL,
  `phy` int(11) DEFAULT NULL,
  `che` int(11) DEFAULT NULL,
  `eng` int(11) DEFAULT NULL,
  `csc` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `form_det`
--

DROP TABLE IF EXISTS `form_det`;
CREATE TABLE IF NOT EXISTS `form_det` (
  `Name` varchar(255) DEFAULT NULL,
  `Roll` varchar(10) DEFAULT NULL,
  `Age` varchar(3) DEFAULT NULL,
  `DOB` varchar(10) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `PWD` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form_det`
--

INSERT INTO `form_det` (`Name`, `Roll`, `Age`, `DOB`, `Mobile`, `PWD`, `Address`, `Email`, `Gender`) VALUES
('admin', ' ', ' ', ' ', ' ', 'admin', ' ', 'admin@gmail.com', ' '),
('alex', '123466', '40', '1986-06-14', '9942997774', 'alex123', '  11,Madurai', 'alex@tce.edu', 'm'),
('sravan', '123456', '20', '2002-09-22', '7010743566', 'sravan123', '  11,Kallupatti', 'sravan@student.tce.edu', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
CREATE TABLE IF NOT EXISTS `mark` (
  `name` varchar(50) DEFAULT NULL,
  `math` int(11) DEFAULT NULL,
  `phy` int(11) DEFAULT NULL,
  `che` int(11) DEFAULT NULL,
  `eng` int(11) DEFAULT NULL,
  `csc` int(11) DEFAULT NULL,
  `test` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
CREATE TABLE IF NOT EXISTS `marks` (
  `Maths` varchar(5) DEFAULT NULL,
  `PHYSICS` varchar(5) DEFAULT NULL,
  `CHEMISTRY` varchar(5) DEFAULT NULL,
  `ENGLISH` varchar(5) DEFAULT NULL,
  `CSC` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
CREATE TABLE IF NOT EXISTS `sports` (
  `name` varchar(50) DEFAULT NULL,
  `achi` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`name`, `achi`) VALUES
('sravan@student.tce.edu', 'won 1st prize in lemon in the spoon');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
