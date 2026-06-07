-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 16, 2026 at 02:51 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Movie_Project`
--
CREATE DATABASE IF NOT EXISTS `Movie_Project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Movie_Project`;

-- --------------------------------------------------------

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
CREATE TABLE `Bookings` (
  `Booking_ID` int(11) NOT NULL,
  `Showtime` int(11) NOT NULL,
  `User_Name` varchar(100) NOT NULL,
  `No_of_Seats` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Bookings`
--

INSERT INTO `Bookings` (`Booking_ID`, `Showtime`, `User_Name`, `No_of_Seats`) VALUES
(1, 2, 'Nikos Tassopoulos', 2),
(2, 2, 'Takis', 2),
(3, 2, 'Jim', 5),
(4, 1, 'Dimitra', 1),
(5, 2, 'Nikos', 4),
(6, 4, 'Christina', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Movies`
--

DROP TABLE IF EXISTS `Movies`;
CREATE TABLE `Movies` (
  `Movie_ID` int(11) NOT NULL,
  `Movie_Title` varchar(150) NOT NULL,
  `Movie_Runtime` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Movies`
--

INSERT INTO `Movies` (`Movie_ID`, `Movie_Title`, `Movie_Runtime`) VALUES
(1, 'Moonlight Metro (2024)', 120),
(2, 'The Endless Road (2026)', 100);

-- --------------------------------------------------------

--
-- Table structure for table `Showtimes`
--

DROP TABLE IF EXISTS `Showtimes`;
CREATE TABLE `Showtimes` (
  `Showtime_ID` int(11) NOT NULL,
  `Movie` int(11) NOT NULL,
  `Datetime` datetime NOT NULL,
  `Price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Showtimes`
--

INSERT INTO `Showtimes` (`Showtime_ID`, `Movie`, `Datetime`, `Price`) VALUES
(1, 1, '2026-01-30 22:00:00', 9.50),
(2, 2, '2026-01-30 22:00:00', 9.00),
(4, 1, '2026-01-22 21:00:00', 10.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `FK` (`Showtime`);

--
-- Indexes for table `Movies`
--
ALTER TABLE `Movies`
  ADD PRIMARY KEY (`Movie_ID`);

--
-- Indexes for table `Showtimes`
--
ALTER TABLE `Showtimes`
  ADD PRIMARY KEY (`Showtime_ID`),
  ADD KEY `FK` (`Movie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Bookings`
--
ALTER TABLE `Bookings`
  MODIFY `Booking_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Movies`
--
ALTER TABLE `Movies`
  MODIFY `Movie_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Showtimes`
--
ALTER TABLE `Showtimes`
  MODIFY `Showtime_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`Showtime`) REFERENCES `Showtimes` (`Showtime_ID`);

--
-- Constraints for table `Showtimes`
--
ALTER TABLE `Showtimes`
  ADD CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`Movie`) REFERENCES `Movies` (`Movie_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
