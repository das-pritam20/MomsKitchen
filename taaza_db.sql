-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2024 at 07:04 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taaza_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(190) NOT NULL,
  `resettoken` varchar(190) NOT NULL,
  `resettokenexpire` date DEFAULT NULL,
  `enable_table_booking` tinyint(4) NOT NULL,
  `enable_menu_page` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `name`, `password`, `resettoken`, `resettokenexpire`, `enable_table_booking`, `enable_menu_page`) VALUES
(2, 'admin@gmail.com', 'Rohit Kumar Rana', 'Rohit@123', '1', '0000-00-00', 1, 1),
(3, 'samim@gmail.com', 'Samim Ansari', 'samim@121', '', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_message`
--

CREATE TABLE `admin_message` (
  `id` int(11) NOT NULL,
  `message` varchar(5000) NOT NULL,
  `enable_meessage` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_message`
--

INSERT INTO `admin_message` (`id`, `message`, `enable_meessage`) VALUES
(1, 'Hii', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `email` varchar(90) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `feedback_text` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lend_hand`
--

CREATE TABLE `lend_hand` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(90) NOT NULL,
  `amount` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `show_detail` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `description`, `category`, `price`, `quantity`, `available`, `image_path`) VALUES
(1, 'Biryani', 'Tandoori vurydsavd', 'Non-Veg', '120.00', 1, 1, ',jsfgy');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `item` varchar(30) NOT NULL,
  `quantity` varchar(30) NOT NULL,
  `total_price` varchar(30) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `name`, `email`, `address`, `item`, `quantity`, `total_price`, `timestamp`) VALUES
(0, 'dkjbjfbh', 'papun@gmail.com', 'dffef efefefef', 'Biryani', '1', '120', '2024-03-28 16:10:11');

-- --------------------------------------------------------

--
-- Table structure for table `registered_users`
--

CREATE TABLE `registered_users` (
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(18) NOT NULL,
  `state` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `verification_code` varchar(225) NOT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `resettoken` varchar(255) DEFAULT NULL,
  `resettokenexpire` date DEFAULT NULL,
  `is_vip` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registered_users`
--

INSERT INTO `registered_users` (`name`, `email`, `password`, `gender`, `state`, `district`, `verification_code`, `is_verified`, `resettoken`, `resettokenexpire`, `is_vip`) VALUES
('Samim Ansari', 'samimsam099@gmail.com', '$2y$10$ex2G5bfkkCCn3dKQmjEt4OKfoowD42cD1q8J7m//mjLlh3Z62YRUm', 'Male', 'Odisha', 'Mayurbhanj', 'd10d5aed64f62cf396722c2c42cac4cf', 0, NULL, NULL, 0),
('masum', 'masum@gmail.com', '2fca6fac81e7eb9409cfc54aca57c192', 'Male', 'Odisha', 'Udala', '125456', 1, '1445745', '0000-00-00', 1),
('Rohit Kumar', 'rohit@gmail.com', '$2y$10$GAs9XvN.wM3qPCPUAVHBN.tTrqNYQEIuXzcnN8zl9188C60eR6emS', 'Male', 'Odisha', 'MBJ', 'c52e2ba86741a1b2be0b632607d70ca3', 0, NULL, NULL, 0),
('dkjbjfbh', 'papun@gmail.com', '$2y$10$BjYOVHLlpW.Y08YFp59Z4ObUqU9Zm79Gqqkb.lOVn/..4MtffgijC', 'Male', 'dffef', 'efefefef', '', 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_booking_ground`
--

CREATE TABLE `table_booking_ground` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `section` varchar(30) NOT NULL,
  `seat` varchar(30) DEFAULT NULL,
  `date` date NOT NULL,
  `time` varchar(50) NOT NULL,
  `payment` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `table_booking_vip`
--

CREATE TABLE `table_booking_vip` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `section` varchar(30) NOT NULL,
  `seat` varchar(30) NOT NULL,
  `decor` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(20) NOT NULL,
  `payment` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
