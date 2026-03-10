-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2026 at 09:23 AM
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
-- Database: `festora_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`) VALUES
(3, 'admin', '$2y$10$jeU2y1p/y4l5i2sJozr5BumTqaZH0RmBHuNeOGVwp49SDuNIsu1eK', '2025-11-03 04:56:07'),
(4, 'admin1', '$2y$10$6Ox9YVHQTxIWOIYUhctSO.8Fq3KdAAVTlD0REqhvbVgYtnQJ6IimW', '2025-11-03 06:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `contact` char(10) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `fname`, `reason`, `date`, `contact`, `branch`, `created_at`) VALUES
(3, 'Tharinda Gimhana', 'Social Meeting', '2025-11-05', '0716348689', 'Colombo', '2025-11-03 04:22:02'),
(6, 'Jane Smith', 'Birthday Party', '2025-11-12', '0172459875', 'Gampaha', '2025-11-03 06:21:42'),
(7, 'tharinda', 'Birthday Party', '2025-11-04', '0702402231', 'Kalutara', '2025-11-03 06:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `guest_count` int(11) NOT NULL,
  `event_start` datetime NOT NULL,
  `event_end` datetime NOT NULL,
  `event_description` text DEFAULT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `full_name`, `email`, `phone`, `event_type`, `location`, `guest_count`, `event_start`, `event_end`, `event_description`, `booking_date`) VALUES
(14, 1, 'newbook', 'new@gmail.com', '000000000', 'Corporate', 'Galle', 33, '2025-11-12 10:34:00', '2025-11-13 10:34:00', 'recomonned', '2025-11-03 05:05:10'),
(15, 1, 'dfdghhghghg', 'isu@gmail.com', '2435435433', 'Wedding', 'Matara', 2, '2025-11-25 11:22:00', '2025-11-21 11:22:00', 'gdytdtdtytyd', '2025-11-03 05:52:54'),
(16, 1, 'fdc', 'hjhjj@gmail.com', '45521', 'Wedding', 'Matara', 545, '2025-11-12 11:24:00', '2025-11-26 11:24:00', 'bsjbc', '2025-11-03 05:54:24'),
(17, 1, 'isur', 'isuru@gmail.com', '555555555555', 'Wedding', 'Matara', 25, '2025-11-14 12:16:00', '2025-11-20 12:16:00', 'jjyfjhjfjff', '2025-11-03 06:46:29');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message_t` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `fullname`, `telephone`, `email`, `message_t`) VALUES
(2, 'Mark Johnson', '5559991111', 'mark.johnson@example.com', 'Looking for wedding planning packages.'),
(3, 'Laura Chen', '5558882222', 'laura.chen@example.com', 'Need help booking a corporate event.'),
(4, 'Steve Thomas', '5557773333', 'steve.thomas@example.com', 'Interested in technical event support.'),
(5, 'Nina Patel', '5556664444', 'nina.patel@example.com', 'Requesting quote for birthday decorations.'),
(6, 'George Miller', '5555555555', 'george.miller@example.com', 'Want to schedule an appointment for consultation.'),
(8, 'niesha', '077344556', 'the@gmail.com', 'the file is good');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `status` enum('success','failed','pending') DEFAULT 'pending',
  `note` varchar(300) DEFAULT NULL,
  `package` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `email`, `payment_method`, `amount`, `payment_date`, `status`, `note`, `package`, `created_at`, `updated_at`) VALUES
(5, 'brian.smith@example.com', 'Bank Transfer', 800.00, '2025-04-10', 'success', 'Corporate booking deposit', 'Business', '2025-11-03 05:00:03', '2025-11-03 05:00:03'),
(6, 'catherine.lee@example.com', 'PayPal', 500.00, '2025-08-01', 'pending', 'Birthday event reservation', 'Silver', '2025-11-03 05:00:03', '2025-11-03 05:00:03'),
(7, 'david.brown@example.com', 'Credit Card', 1500.00, '2025-09-01', 'failed', 'Conference package payment failed', 'Platinum', '2025-11-03 05:00:03', '2025-11-03 05:00:03'),
(8, 'ella.green@example.com', 'Cash', 1000.00, '2025-03-15', 'success', 'Engagement event payment', 'Standard', '2025-11-03 05:00:03', '2025-11-03 05:00:03'),
(9, 'imashi@gmail.com', 'Bank Transfers', 123.00, '2025-11-20', 'pending', 'hgj', 'Basic', '2025-11-03 05:53:36', '2025-11-03 05:53:36'),
(11, 'imashi@gmail.com', 'Bank Transfers', 1000.00, '2025-11-27', 'pending', 'gcnjj', 'Basic', '2025-11-03 06:48:01', '2025-11-03 06:48:01');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `recommend` enum('yes','no') NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `name`, `email`, `rating`, `comment`, `recommend`, `event_name`, `created_at`, `user_id`, `user_ip`) VALUES
(10, 'sadun', 'user2@gmail.com', 5, 'nice events', 'yes', 'birthday party', '2025-11-03 06:08:30', 4, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `team_selections`
--

CREATE TABLE `team_selections` (
  `organizer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `coordinator` varchar(100) DEFAULT NULL,
  `creative` varchar(255) DEFAULT NULL,
  `technical` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_selections`
--

INSERT INTO `team_selections` (`organizer_id`, `name`, `email`, `phone`, `coordinator`, `creative`, `technical`) VALUES
(3, 'Michael Reed', 'michael.reed@example.com', '555-1002', 'Sara White', 'Stage Decoration', 'Lighting'),
(4, 'Sophia Turner', 'sophia.turner@example.com', '555-1003', 'Daniel Kim', 'Video Editing', 'Sound System'),
(5, 'Olivia Scott', 'olivia.scott@example.com', '555-1004', 'Liam Brooks', 'Event Planning', 'Projector Setup'),
(6, 'James Allen', 'james.allen@example.com', '555-1005', 'Nina Lopez', 'Photography', 'Network Configuration'),
(7, 'tharu', 't@gmail.com', '3456789', 'Shanuka', 'Samadhi', 'Tharinda'),
(8, 'tharu', 'tharu@gmai.com', '245678', 'Dilusha', 'Samadhi', 'Tharinda, Methum');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`) VALUES
(1, 'temp', 'sdeg', 'temp@gmail.com', '12312412', '$2y$10$xXwKFghI3P.4GsfO1j6chO9zlp0EHuBpSxcgI/inLix6LBwlwZltO', '2025-11-01 14:31:33'),
(3, 'temp2', 'temp', 'temp2@gmail.com', '1234567890', '$2y$10$RTno1mYwPmPT/pQXf5bV7OJXNBTEjDxc/QepqoXcf0.HG5t36hn3a', '2025-11-03 05:10:11'),
(4, 'user', '2', 'user2@gmail.com', '0123458888', '$2y$10$YuGQ5oCmO5BOgk/OtLWo/.EjETt.WU1pByMpCVH5WT47blWqZjftW', '2025-11-03 06:07:51'),
(8, 'Robert', 'Johnson', 'robert.johnson@example.com', '9956781234', '1234', '2025-11-03 06:16:16'),
(9, 'Emily', 'Davis', 'emily.davis@example.com', '9008765432', '1234', '2025-11-03 06:16:16'),
(10, 'Michael', 'Wilson', 'michael.wilson@example.com', '9988776655', '1234', '2025-11-03 06:16:16'),
(11, 'Sarah', 'Taylor', 'sarah.taylor@example.com', '9123987654', '1234', '2025-11-03 06:16:16'),
(12, 'David', 'Anderson', 'david.anderson@example.com', '9898989898', '1234', '2025-11-03 06:16:16'),
(13, 'Olivia', 'Thomas', 'olivia.thomas@example.com', '9776655443', '1234', '2025-11-03 06:16:16'),
(14, 'Daniel', 'Lee', 'daniel.lee@example.com', '9554433221', '1234', '2025-11-03 06:16:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_booking_user` (`user_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_review_user` (`user_id`);

--
-- Indexes for table `team_selections`
--
ALTER TABLE `team_selections`
  ADD PRIMARY KEY (`organizer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `team_selections`
--
ALTER TABLE `team_selections`
  MODIFY `organizer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
