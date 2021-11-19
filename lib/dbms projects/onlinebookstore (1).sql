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
-- Database: `onlinebookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `u_name` varchar(255) NOT NULL DEFAULT '',
  `pwd` varchar(255) DEFAULT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`u_name`, `pwd`, `admin_id`) VALUES
('admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `barcode` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `author` varchar(100) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_type` varchar(255) DEFAULT NULL,
  `i_name` varchar(255) NOT NULL DEFAULT '',
  `i_price` varchar(255) DEFAULT NULL,
  `i_quantity` varchar(255) DEFAULT NULL,
  `i_pic` varchar(2000) DEFAULT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_type`, `i_name`, `i_price`, `i_quantity`, `i_pic`, `admin_id`) VALUES
('Science Fiction', 'SCI_FI', '32', '2', 'sci_fi.jpg', 1),
('Action and Adventure', 'The Testaments', '23', '4', 'The_Testaments.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  `c_email` varchar(255) DEFAULT NULL,
  `c_mobile` varchar(255) DEFAULT NULL,
  `c_msg` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_register`
--

CREATE TABLE `customer_register` (
  `cus_id` int(11) NOT NULL,
  `cus_pwd` varchar(255) DEFAULT NULL,
  `cus_email` varchar(255) DEFAULT NULL,
  `cus_number` varchar(255) DEFAULT NULL,
  `cus_addrs` varchar(3000) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_register`
--

INSERT INTO `customer_register` (`cus_id`, `cus_pwd`, `cus_email`, `cus_number`, `cus_addrs`, `status`, `admin_id`) VALUES
(123, '123', 'customer@gmail.com', '1234567890', 'Hyderabad', 'Student Unlocked', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `Order_id` int(255) DEFAULT NULL,
  `Cus_id` int(255) DEFAULT NULL,
  `i_pic` varchar(2000) DEFAULT NULL,
  `i_type` varchar(255) DEFAULT NULL,
  `i_name` varchar(255) DEFAULT NULL,
  `i_price` varchar(255) DEFAULT NULL,
  `i_quantity` varchar(255) DEFAULT NULL,
  `timeanddate` varchar(255) DEFAULT NULL,
  `confirmtime` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `item_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `Order_id`, `Cus_id`, `i_pic`, `i_type`, `i_name`, `i_price`, `i_quantity`, `timeanddate`, `confirmtime`, `status`, `item_status`) VALUES
(12, 49511, 123, 'The_Testaments.jpg', 'Action and Adventure', 'The Testaments', '23', '1', 'Tue Nov 02 23:09:36 GMT-12:00 2021', 'Not Ready', 'Pending', 'Clear'),
(13, 99603, 123, 'sci_fi.jpg', 'Science Fiction', 'SCI_FI', '32', '1', 'Tue Nov 02 23:11:48 GMT-12:00 2021', 'Not Ready', 'Pending', 'Clear');

-- --------------------------------------------------------

--
-- Table structure for table `orderhistory`
--

CREATE TABLE `orderhistory` (
  `o_id` int(11) NOT NULL,
  `Order_id` int(255) DEFAULT NULL,
  `Cus_id` int(255) DEFAULT NULL,
  `i_pic` varchar(2000) DEFAULT NULL,
  `i_type` varchar(255) DEFAULT NULL,
  `i_name` varchar(255) DEFAULT NULL,
  `i_price` varchar(255) DEFAULT NULL,
  `i_quantity` varchar(255) DEFAULT NULL,
  `timeanddate` varchar(255) DEFAULT NULL,
  `confirmtime` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `item_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderhistory`
--

INSERT INTO `orderhistory` (`o_id`, `Order_id`, `Cus_id`, `i_pic`, `i_type`, `i_name`, `i_price`, `i_quantity`, `timeanddate`, `confirmtime`, `status`, `item_status`) VALUES
(24, 49511, 123, 'The_Testaments.jpg', 'Action and Adventure', 'The Testaments', '23', '1', 'Tue Nov 02 23:09:36 GMT-12:00 2021', 'Not Ready', 'Pending', 'Que'),
(25, 99603, 123, 'sci_fi.jpg', 'Science Fiction', 'SCI_FI', '32', '1', 'Tue Nov 02 23:11:48 GMT-12:00 2021', 'Not Ready', 'Pending', 'Que');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `amount` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `exp` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `Cus_id` int(11) DEFAULT NULL,
  `pay_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`amount`, `name`, `card`, `exp`, `cvv`, `Cus_id`, `pay_id`) VALUES
('55', 'VISA', '123456789', '12/21', '125', 123, 34);

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `r_id` int(11) NOT NULL,
  `customer_id` int(255) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `items` varchar(255) DEFAULT NULL,
  `day` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`r_id`, `customer_id`, `amount`, `items`, `day`) VALUES
(17, 123, '55', '[The Testaments, 1, 23, SCI_FI, 1, 32]', 'Tue Nov 02 23:25:18 GMT-12:00 2021');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(100) NOT NULL,
  `mailid` varchar(100) NOT NULL,
  `usertype` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`barcode`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`i_name`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `adm_id` (`admin_id`);

--
-- Indexes for table `customer_register`
--
ALTER TABLE `customer_register`
  ADD PRIMARY KEY (`cus_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `std_id` (`Cus_id`),
  ADD KEY `Order_id` (`Order_id`),
  ADD KEY `orderdetails_ibfk_3` (`i_name`);

--
-- Indexes for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `std_id` (`Cus_id`),
  ADD KEY `orderdetails_ibfk_2` (`Order_id`),
  ADD KEY `orderdetails_ibfk_4` (`i_name`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `payment` (`Cus_id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `student_id` (`customer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orderhistory`
--
ALTER TABLE `orderhistory`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contactus`
--
ALTER TABLE `contactus`
  ADD CONSTRAINT `adm_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_register`
--
ALTER TABLE `customer_register`
  ADD CONSTRAINT `customer_register_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`Cus_id`) REFERENCES `customer_register` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_3` FOREIGN KEY (`i_name`) REFERENCES `categories` (`i_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`Order_id`) REFERENCES `orderdetails` (`Order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_4` FOREIGN KEY (`i_name`) REFERENCES `categories` (`i_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment` FOREIGN KEY (`Cus_id`) REFERENCES `customer_register` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_register` (`cus_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
