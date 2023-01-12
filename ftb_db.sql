-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 10, 2023 at 03:06 AM
-- Server version: 10.6.11-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ftb_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE `aircraft` (
  `aircraft_id` bigint(20) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `number_of_seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`aircraft_id`, `manufacturer`, `model`, `number_of_seats`) VALUES
(3, 'Boeing', 'Boeing 307', 100),
(4, 'Boeing', 'Boeing 737', 300),
(16, 'Airbus', 'Airbus A220', 200),
(20, 'Airbus', 'Airbus A340', 340),
(23, 'Airbus', 'Airbus A440', 400),
(36, 'Boeing', 'Boeing 201', 180);

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `airport_id` int(11) NOT NULL,
  `airport_code` varchar(255) DEFAULT NULL,
  `airport_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`airport_id`, `airport_code`, `airport_name`, `city`, `country`, `state`) VALUES
(1, 'DAL', 'Dallas Love Field', 'Dallas', 'United States', 'Dallas'),
(2, 'DCG', 'Dubai Creek SPB', 'Dubai', 'United Arab Emirates', 'Dubai'),
(15, 'CID', 'Cedar Rapid Airport', 'IOWA', 'United States', 'Iowa'),
(19, 'CHI', 'Chicago Airport', 'Chicago', 'United States', 'Illinois'),
(31, 'CLN', 'California Airport', 'California', 'United States', 'California'),
(35, 'TEX', 'Texas Airport', 'Texas', 'United States', 'Texas'),
(41, 'KLIA', 'Kuala Lumpur International Airport', 'Sepang', 'Malaysia', 'Selangor');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` bigint(20) NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_time` varchar(255) DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `departure_time` varchar(255) DEFAULT NULL,
  `flight_charge` double NOT NULL,
  `flight_number` varchar(255) DEFAULT NULL,
  `aircraft_aircraft_id` bigint(20) DEFAULT NULL,
  `departure_airport_airport_id` int(11) DEFAULT NULL,
  `destination_airport_airport_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `arrival_date`, `arrival_time`, `departure_date`, `departure_time`, `flight_charge`, `flight_number`, `aircraft_aircraft_id`, `departure_airport_airport_id`, `destination_airport_airport_id`) VALUES
(5, '2019-08-01', '10:30', '2019-08-01', '08:00', 1200, 'dallas-dubai100', 3, 1, 2),
(6, '2019-08-02', '00:20', '2019-08-02', '10:20', 1600, 'dubai-dalas110', 3, 2, 1),
(25, '2019-08-08', '09:00', '2019-08-08', '07:00', 250, 'chi-cedar01', 3, 19, 15),
(26, '2019-08-03', '16:00', '2019-08-03', '14:00', 180, 'ced-chi05', 16, 15, 19),
(33, '2019-08-16', '21:00', '2019-08-16', '00:00', 500, 'dal - cal', 4, 1, 31),
(37, '2019-08-31', '14:40', '2019-08-31', '08:00', 650, 'IA-TEX101', 36, 15, 35),
(39, '2023-01-02', '03:50', '2023-01-02', '02:50', 30, '123', 3, 1, 2),
(42, '2023-01-12', '11:00', '2023-01-12', '09:00', 300, '12345', 3, 41, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(44),
(44),
(44),
(44);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passenger_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `passport_number` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `flight_flight_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passenger_id`, `address`, `email`, `first_name`, `last_name`, `passport_number`, `phone_number`, `flight_flight_id`, `user_id`) VALUES
(8, '1000 N 4th Street, MUM', 'john@mum.edu', 'John', 'Doe', '78998787', '6414513308', 5, 0),
(24, '1000 N 4th Street, MUM, MR#100', 'anna@gmail.com', 'Anna', 'Smith', '02538467', '6414513308', 5, 0),
(29, '1000 N 4th Street, MUM, MR#15', 'chibusi@gmail.com', 'Chibusi', 'Kelvin', '45687997', '6414513308', 6, 0),
(30, '1000 N 4th Street, MUM, MR#48', 'alimohammad.ahmadi2008@gmail.com', 'Ali Mohammed', 'Ahmadi', '45687997', '6414513308', 5, 0),
(34, '1000 N 4th Street, Maharishi University of Management', 'churn@mum.com', 'Chinedu', 'Urbanus', 'A20193885', '23456789', 33, 0),
(38, '9 Jalan 3/2k Seksyen 3', 'gladdygarcia10@gmail.com', '\'Alya', 'Bakri', '214325135315', '60136415080', 5, 0),
(43, '9 Jalan 3/2k Seksyen 3', 'gladdygarcia10@gmail.com', '\'Aly', 'Bakri', '214325135315', '0136415080', 42, 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_AGENT');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `firstname`, `lastname`, `middlename`, `password`, `username`) VALUES
(1, 'john@gmail.com', 'John', 'Doe', NULL, '$2a$10$dRM33.Fy7SYDraG5vMagXOgIhsB6Tl40VI9pwMlNhB4yfLaZpQj.m', 'john'),
(2, 'mike@gmail.com', 'Mike', 'Jacson', NULL, '$2a$10$vukSIdxmmtLYcy/uNMBUHeyj/qbNPcaX8lqTbXGciJ9HxaLQOmRO.', 'mike');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`aircraft_id`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`airport_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `FK98q69epkawxnm44tayvrppdbs` (`aircraft_aircraft_id`),
  ADD KEY `FK3oa47xgnaiy3jyqk2j1a4bdmq` (`departure_airport_airport_id`),
  ADD KEY `FKtk8ruym4g6f4flrcnnop2mnah` (`destination_airport_airport_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passenger_id`),
  ADD KEY `FKffb69w8vqqqv7dqnf91o7yl91` (`flight_flight_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `roles_users_roles_idx` (`role_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `FK3oa47xgnaiy3jyqk2j1a4bdmq` FOREIGN KEY (`departure_airport_airport_id`) REFERENCES `airport` (`airport_id`),
  ADD CONSTRAINT `FK98q69epkawxnm44tayvrppdbs` FOREIGN KEY (`aircraft_aircraft_id`) REFERENCES `aircraft` (`aircraft_id`),
  ADD CONSTRAINT `FKtk8ruym4g6f4flrcnnop2mnah` FOREIGN KEY (`destination_airport_airport_id`) REFERENCES `airport` (`airport_id`);

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `FKffb69w8vqqqv7dqnf91o7yl91` FOREIGN KEY (`flight_flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `roles_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_users_roles` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
