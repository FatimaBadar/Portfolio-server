-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2025 at 06:44 AM
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
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `sender` varchar(256) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `sender`, `message`) VALUES
(1, 'test@gmail.com', 'Hi. I\'m testing database insert statement'),
(2, 'test@gmail.com', 'Hi. I\'m testing database insert statement with promise'),
(3, 'test2@gmail.com', 'Testing toasters'),
(4, 'test2@gmail.com', 'Testing toasters'),
(5, 'test2@gmail', 'Testing toasters'),
(7, 'rabel@gmail.com', 'Hello Fatima. How are you?'),
(8, 'rabel@gmail.com', 'Hello Fatima. How are you now?'),
(9, 'rabel@gmail.com', 'Hello Fatima. How are you now?'),
(10, 'test@gmail.com', 'Testing the contact form');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `subheading` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  `link` varchar(256) NOT NULL,
  `fileName` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `subheading`, `description`, `link`, `fileName`) VALUES
(1, 'OneClicks', 'Multi-platform Advertising tool', 'An advertising campaign optimization tool that integrates platforms like Facebook and Google to streamline campaign management. The tool provides a user-friendly interface, efficient data handling, and unifies campaign tracking across multiple platforms.', 'https://github.com/FatimaBadar/OneClicks-frontend', 'projects/OneClicks.JPG'),
(2, 'UniRideHub', 'Carpool Website', 'A user-friendly carpooling platform using Entity Framework for efficient data management. The platform utilized the MVC architecture to improve system organization, offering a seamless, role-based experience tailored to both drivers and riders. It allowed ', 'https://github.com/FatimaBadar/UniRideHub', 'projects/UniRideHub.JPG'),
(3, 'Restaurant Management System', 'Management portal', 'A comprehensive restaurant management system designed to streamline workflows and operations. The platform efficiently manages menus, orders, reservations, employee scheduling, inventory, and customer information. By providing a centralized and intuitive s', 'https://github.com/FatimaBadar/Restaurant-management', 'projects/Restaurant.JPG'),
(4, 'Fashion Store', 'E-commerce system', 'An online fashion store with a visually appealing UI. The platform provided a seamless shopping experience, featuring user-friendly navigation for customers and comprehensive admin control for managing products and orders. It allowed both admins and users ', 'https://github.com/FatimaBadar/E-Commerce-Fashion-Store', 'projects/FashionStore.JPG');

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
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `logo` varchar(256) NOT NULL,
  `category` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `logo`, `category`) VALUES
(1, 'HTML', 'icons/HTML.svg', 'Web Development'),
(2, 'CSS', 'icons/CSS.svg', 'Web Development'),
(3, 'JavaScript', 'icons/Javascript.svg', 'Web Development'),
(4, 'React', 'icons/React.svg', 'Web Development'),
(5, 'Angular', 'icons/Angular.svg', 'Web Development'),
(6, '.NET', 'icons/.NET.svg', 'Web Development'),
(7, 'MySQL', 'icons/MySQL.svg', 'Database'),
(8, 'MongoDB', 'icons/MongoDB.svg', 'Database'),
(9, 'C', 'icons/C.svg', 'Programming'),
(10, 'C++', 'icons/C++.svg', 'Programming'),
(11, 'C#', 'icons/Csharp.svg', 'Programming'),
(12, 'Python', 'icons/Python.svg', 'Programming'),
(13, 'Ms Excel', 'icons/Excel.svg', 'Data Analytics'),
(14, 'Power BI', 'icons/PowerBI.svg', 'Data Analytics'),
(15, 'Figma', 'icons/Figma2.svg', 'Design'),
(16, 'LucidChart', 'icons/LucidChart.png', 'Design'),
(17, 'Spline', 'icons/Spline.webp', 'Design'),
(18, 'AWS', 'icons/AWS.svg', 'Cloud'),
(19, 'Azure Devops', 'icons/AzureDevops.png', 'Cloud');

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
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`tool_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
