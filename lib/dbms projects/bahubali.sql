-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2021 at 02:08 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bahubali`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Number` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `Date` date NOT NULL,
  `Number_of_rentals` int(11) NOT NULL,
  `Bonus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `Name` varchar(250) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Year_of_birth` year(4) DEFAULT NULL,
  `Year_of_death` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `Number` int(11) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Year` year(4) DEFAULT NULL,
  `Type` varchar(250) DEFAULT NULL,
  `Critic` double DEFAULT NULL,
  `Nominations` varchar(250) DEFAULT NULL,
  `Awards_won` int(11) DEFAULT NULL,
  `D_Number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `playes_in`
--

CREATE TABLE `playes_in` (
  `S_number` int(11) DEFAULT NULL,
  `N_number` int(11) DEFAULT NULL,
  `Role` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `star`
--

CREATE TABLE `star` (
  `Number` int(11) DEFAULT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `Birthplace` varchar(250) DEFAULT NULL,
  `Year_of_birth` year(4) DEFAULT NULL,
  `Year_of_death` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tape`
--

CREATE TABLE `tape` (
  `Code` int(11) NOT NULL,
  `Purchase_date` date NOT NULL,
  `Times-rented` time NOT NULL,
  `C_Number` int(11) NOT NULL,
  `M_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
