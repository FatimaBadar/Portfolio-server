-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2025 at 07:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `subheading` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `link` varchar(256) NOT NULL,
  `fileName` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `subheading`, `description`, `tool_id`, `link`, `fileName`) VALUES
(1, 'OneClicks', 'Multi-platform Advertising tool', 'To manage, run, optimize ad campaigns across several platforms like Meta and Google', 0, 'https://github.com/FatimaBadar/OneClicks-frontend', 'projects/OneClicks.JPG'),
(2, 'UniRideHub', 'Carpool Website', 'For drivers and riders to add up a new ride or book a ride to carpool with someone', 0, 'https://github.com/FatimaBadar/UniRideHub', 'projects/UniRideHub.JPG'),
(3, 'Restaurant Management System', 'Management portal', 'To manage the menu, reservations for employers and customers', 0, 'https://github.com/FatimaBadar/Restaurant-management', 'projects/Restaurant.JPG'),
(4, 'Fashion Store', 'E-commerce system', 'To display, buy and sell fashion products by both admin or user', 0, 'https://github.com/FatimaBadar/E-Commerce-Fashion-Store', 'projects/FashionStore.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `project_tools`
--

CREATE TABLE `project_tools` (
  `project_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_tools`
--

INSERT INTO `project_tools` (`project_id`, `tool_id`) VALUES
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(1, 9),
(2, 2),
(2, 3),
(2, 5),
(2, 6),
(2, 9),
(3, 2),
(3, 3),
(3, 6),
(3, 10),
(4, 1),
(4, 2),
(4, 6),
(4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `tool_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`tool_id`, `name`) VALUES
(1, 'HTML'),
(2, 'CSS'),
(3, 'React.js'),
(4, 'Next.js'),
(5, '.NET'),
(6, 'MySQL'),
(7, 'MongoDB'),
(8, 'PrimeReact'),
(9, 'MaterialUI'),
(10, 'PHP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_tools`
--
ALTER TABLE `project_tools`
  ADD PRIMARY KEY (`project_id`,`tool_id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`tool_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `tool_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project_tools`
--
ALTER TABLE `project_tools`
  ADD CONSTRAINT `project_tools_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_tools_ibfk_2` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`tool_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
