-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2021 at 02:17 PM
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
-- Database: `my_singers`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `A_ID` smallint(6) NOT NULL,
  `A_NAME` varchar(200) NOT NULL,
  `A_MOBILE` varchar(200) NOT NULL,
  `A_EMAIL` varchar(200) NOT NULL,
  `A_PASSWORD` varchar(200) NOT NULL,
  `A_GENDER` varchar(200) DEFAULT NULL,
  `A_DOB` varchar(200) DEFAULT NULL,
  `A_ADDRESS` text DEFAULT NULL,
  `A_TYPE` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`A_ID`, `A_NAME`, `A_MOBILE`, `A_EMAIL`, `A_PASSWORD`, `A_GENDER`, `A_DOB`, `A_ADDRESS`, `A_TYPE`) VALUES
(3, 'coordinator1', '123456', 'co1@gmail.com', '12345', 'M', '10-2-2012', 'USA', 'Co-Ordinator');

-- --------------------------------------------------------

--
-- Table structure for table `eventcoordinator`
--

CREATE TABLE `eventcoordinator` (
  `EC_ID` smallint(6) NOT NULL,
  `EC_ADMIN_ID` smallint(6) NOT NULL,
  `EC_EVENT_ID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventcoordinator`
--

INSERT INTO `eventcoordinator` (`EC_ID`, `EC_ADMIN_ID`, `EC_EVENT_ID`) VALUES
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `E_ID` smallint(6) NOT NULL,
  `E_USER_ID` smallint(6) NOT NULL,
  `E_NAME` varchar(200) NOT NULL,
  `E_INFO` varchar(225) NOT NULL,
  `E_START_DATE` varchar(200) NOT NULL,
  `E_END_DATE` varchar(200) NOT NULL,
  `E_MOBILE` varchar(200) NOT NULL,
  `E_EMAIL` varchar(200) NOT NULL,
  `E_GENDER` varchar(200) DEFAULT NULL,
  `E_DOB` varchar(200) DEFAULT NULL,
  `E_ADDRESS` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`E_ID`, `E_USER_ID`, `E_NAME`, `E_INFO`, `E_START_DATE`, `E_END_DATE`, `E_MOBILE`, `E_EMAIL`, `E_GENDER`, `E_DOB`, `E_ADDRESS`) VALUES
(1, 1, 'Event1', 'Hi this is the event one', '12-11-2016', '18-11-2016', '1234567', 'event1@gmail.com', NULL, NULL, NULL),
(2, 1, 'Event2', 'This is event2 info', '12-11-2016', '12-12-2016', '1234567', 'event2@gmail.com', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `S_ID` smallint(6) NOT NULL,
  `S_USER_ID` smallint(6) NOT NULL,
  `S_EVENT_ID` smallint(6) NOT NULL,
  `S_NAME` varchar(225) DEFAULT NULL,
  `S_LIKES` int(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`S_ID`, `S_USER_ID`, `S_EVENT_ID`, `S_NAME`, `S_LIKES`) VALUES
(8, 7, 1, 'out10.wav', 5),
(9, 7, 2, 'AppudoIppudo.mp3', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `U_ID` smallint(6) NOT NULL,
  `U_NAME` varchar(200) NOT NULL,
  `U_MOBILE` varchar(200) NOT NULL,
  `U_EMAIL` varchar(200) NOT NULL,
  `U_PASSWORD` varchar(200) NOT NULL,
  `U_GENDER` varchar(200) DEFAULT NULL,
  `U_DOB` varchar(200) DEFAULT NULL,
  `U_ADDRESS` text DEFAULT NULL,
  `U_TYPE` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`U_ID`, `U_NAME`, `U_MOBILE`, `U_EMAIL`, `U_PASSWORD`, `U_GENDER`, `U_DOB`, `U_ADDRESS`, `U_TYPE`) VALUES
(1, 'admin', '1234567', 'admin@gmail.com', 'admin', NULL, NULL, NULL, 'Admin'),
(3, 'Anil', '1234567', 'anil@gmail.com', 'anil', NULL, NULL, NULL, 'Singer'),
(6, 'kumar', '1234567', 'kumar@gmail.com', 'kumar', NULL, NULL, NULL, 'User'),
(7, 'test', '1234567', 'testing@gmail.com', '12345', NULL, NULL, NULL, 'Singer');

-- --------------------------------------------------------

--
-- Table structure for table `winner`
--

CREATE TABLE `winner` (
  `W_ID` smallint(6) NOT NULL,
  `W_USER_ID` smallint(6) DEFAULT NULL,
  `W_EVENT_ID` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winner`
--

INSERT INTO `winner` (`W_ID`, `W_USER_ID`, `W_EVENT_ID`) VALUES
(6, 7, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`A_ID`,`A_NAME`,`A_EMAIL`);

--
-- Indexes for table `eventcoordinator`
--
ALTER TABLE `eventcoordinator`
  ADD PRIMARY KEY (`EC_ID`,`EC_ADMIN_ID`,`EC_EVENT_ID`),
  ADD KEY `FK_EC_ADMIN_ID` (`EC_ADMIN_ID`),
  ADD KEY `FK_EC_EVENT_ID` (`EC_EVENT_ID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`E_ID`),
  ADD KEY `events_ibfk_1` (`E_USER_ID`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`S_ID`),
  ADD KEY `songs_ibfk_1` (`S_USER_ID`),
  ADD KEY `songs_ibfk_2` (`S_EVENT_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`U_ID`),
  ADD UNIQUE KEY `U_EMAIL` (`U_EMAIL`);

--
-- Indexes for table `winner`
--
ALTER TABLE `winner`
  ADD PRIMARY KEY (`W_ID`,`W_EVENT_ID`),
  ADD KEY `winner_ibfk_1` (`W_USER_ID`),
  ADD KEY `winner_ibfk_2` (`W_EVENT_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `A_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eventcoordinator`
--
ALTER TABLE `eventcoordinator`
  MODIFY `EC_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `E_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `S_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `winner`
--
ALTER TABLE `winner`
  MODIFY `W_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `eventcoordinator`
--
ALTER TABLE `eventcoordinator`
  ADD CONSTRAINT `eventcoordinator_ibfk_1` FOREIGN KEY (`EC_ADMIN_ID`) REFERENCES `admin` (`A_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `eventcoordinator_ibfk_2` FOREIGN KEY (`EC_EVENT_ID`) REFERENCES `events` (`E_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`E_USER_ID`) REFERENCES `user` (`U_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`S_USER_ID`) REFERENCES `user` (`U_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`S_EVENT_ID`) REFERENCES `events` (`E_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `winner`
--
ALTER TABLE `winner`
  ADD CONSTRAINT `winner_ibfk_1` FOREIGN KEY (`W_USER_ID`) REFERENCES `user` (`U_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `winner_ibfk_2` FOREIGN KEY (`W_EVENT_ID`) REFERENCES `events` (`E_ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
