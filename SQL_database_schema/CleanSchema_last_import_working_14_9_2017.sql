-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2017 at 01:09 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `securify`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `carID` int(11) NOT NULL,
  `time_stamp` timestamp NOT NULL,
  `temp` double DEFAULT NULL,
  `humidity` int(11) DEFAULT NULL,
  `odometer` double DEFAULT NULL,
  `GPS_long` double DEFAULT NULL,
  `GPS_lat` double DEFAULT NULL,
  `battery_status` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `joblist`
--

CREATE TABLE `joblist` (
  `carID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  `keyID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registerID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isJobActive` tinyint(1) NOT NULL,
  `time_stamp_created` timestamp NOT NULL,
  `time_stamp_lastupdated` timestamp NOT NULL,
  `isJobApproved` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registercar`
--

CREATE TABLE `registercar` (
  `userID` int(11) NOT NULL,
  `carID` int(11) NOT NULL,
  `keyID` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registerationID` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nameAlias` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_stamp_last_serviced` timestamp NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `fname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass_hashed` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass_salt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `fname`, `lname`, `email`, `phone`, `pass_hashed`, `pass_salt`, `role`) VALUES
(1, 'Ananda', 'Utama', 'ananda_utama@y7mail.com', '0416039148', '43c3d938994fc9817fdc8dde992986c1f0df15e9', '1234567', 'technician'),
(2, 'Ananda', 'Utama', 'autam1@live.com', '0416039148', 'fbfae7e675d51e347c7ed3a6812627267062472a', 'Z&3nxLS', 'Manager'),
(3, 'a', 'a', 'jakeSilva@gmail.com', '0416039148', '7f6279a4bfc3b635007d8873554feeb6c0c0023d', '*hOzlV5', 'Manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`carID`,`time_stamp`);

--
-- Indexes for table `joblist`
--
ALTER TABLE `joblist`
  ADD PRIMARY KEY (`jobID`),
  ADD KEY `carID` (`carID`);

--
-- Indexes for table `registercar`
--
ALTER TABLE `registercar`
  ADD PRIMARY KEY (`carID`),
  ADD UNIQUE KEY `email` (`keyID`,`registerationID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `joblist`
--
ALTER TABLE `joblist`
  MODIFY `jobID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `registercar`
--
ALTER TABLE `registercar`
  MODIFY `carID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

