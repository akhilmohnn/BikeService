-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 24, 2025 at 02:47 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bikeservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  PRIMARY KEY  (`admin_id`),
  UNIQUE KEY `admin_email` (`admin_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `booking_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `service_type` enum('Water Service','Part Change') NOT NULL,
  `description` text,
  `status` enum('Pending','Confirmed','Rejected') default 'Pending',
  `created_at` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`booking_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`booking_id`, `user_id`, `service_type`, `description`, `status`, `created_at`) VALUES
(1, 1, 'Water Service', '', 'Rejected', '2025-05-19 21:23:30'),
(2, 1, 'Part Change', 'jnkl', 'Confirmed', '2025-05-19 21:25:46'),
(3, 1, 'Water Service', 'ssdasd', 'Confirmed', '2025-05-20 09:18:06'),
(4, 1, 'Part Change', 'urgent requirement', 'Confirmed', '2025-05-20 09:44:40'),
(5, 1, 'Part Change', 'immediate ', 'Rejected', '2025-05-20 11:55:53'),
(6, 1, 'Part Change', 'Immediate', 'Pending', '2025-05-20 20:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `service_id` int(11) NOT NULL auto_increment,
  `bike_registration` varchar(50) NOT NULL,
  `service_date` date NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `status` enum('Pending','Finished','Cancelled') default 'Pending',
  `cost` decimal(10,2) default '0.00',
  PRIMARY KEY  (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`service_id`, `bike_registration`, `service_date`, `service_type`, `status`, `cost`) VALUES
(1, 'KL 44 L 6728', '2025-05-22', 'Brake Service', 'Pending', '0.00'),
(2, 'KL 44 L 6728', '2025-05-22', 'Full Inspection', 'Pending', '0.00'),
(3, 'KL 44 L 6728', '2025-05-22', 'Oil Change', 'Pending', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bike_registration` varchar(50) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `email`, `bike_registration`, `user_password`, `phone`, `address`) VALUES
(1, 'Akhil', 'akhil@gmail.com', 'KL 44 L 6728', '2255', '9027976520', 'PLM House,Perumbavoor'),
(3, 'Ribin ', 'rb@gmail.com', 'KL 17 L 3822', '12345', '9211022103', 'R villa,thodupuzha'),
(4, 'Aparna', 'apr@gmail.com', 'KL 07 2 2173', '12345', '9283748282', 'tkt home,kochi'),
(5, 'Jude', 'jbk@gmail.com', 'KL 08 J 3743', '12345', '8938291282', 'krlHouse,thrissur'),
(6, 'Joyal', 'jyl@gmail.com', 'KL 07 O 2817', '0987', '7896253417', 'jhouse,piravom');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD CONSTRAINT `tbl_booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE;
