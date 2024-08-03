-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2024 at 03:21 PM
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
-- Database: `project_management_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `file_shares`
--

CREATE TABLE `file_shares` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_shares`
--

INSERT INTO `file_shares` (`id`, `sender_id`, `receiver_id`, `file_path`, `created_at`) VALUES
(8, 2, 3, 'assets/uploads/Project Report 2.pdf', '2024-07-20 09:34:06'),
(12, 1, 3, 'assets/uploads/Project Report 2.pdf', '2024-07-22 08:09:02'),
(13, 2, 1, 'assets/uploads/Project Report 2.pdf', '2024-07-22 09:56:10'),
(15, 1, 3, 'assets/uploads/Resume Template 4.pdf', '2024-07-22 11:45:45');

-- --------------------------------------------------------

--
-- Table structure for table `project_list`
--

CREATE TABLE `project_list` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `manager_id` int(30) NOT NULL,
  `user_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_list`
--

INSERT INTO `project_list` (`id`, `name`, `description`, `status`, `start_date`, `end_date`, `manager_id`, `user_ids`, `date_created`) VALUES
(5, 'School Management System', '																		A comprehensive system to manage school operations, including student registration, attendance, grading, and parent communication.																										', 0, '2024-07-20', '2024-07-30', 2, '4,3', '2024-07-20 12:11:58'),
(6, 'Hospital Management System', 'An integrated system to manage hospital operations, including patient admissions, appointments, medical records, and billing.											', 3, '2024-07-22', '2025-01-03', 6, '4,5', '2024-07-22 11:25:23'),
(7, 'Inventory System', '						A system to &lt;b&gt;manage inventory, track stock levels, and streamline the ordering process&lt;/b&gt; for businesses.																', 0, '2024-07-16', '2024-10-22', 6, '4,3,5', '2024-07-22 11:39:30'),
(8, 'Fleet Management System', 'A system to manage a fleet of vehicles, including tracking, maintenance scheduling, and route optimization.											', 0, '2024-07-19', '2024-11-22', 2, '7,8', '2024-07-22 11:58:00'),
(9, 'E-Commerce Platform', '						An online platform to facilitate buying and selling of products with a focus on user experience and security.																', 0, '2024-07-24', '2026-01-22', 6, '7,5', '2024-07-22 12:14:17'),
(10, 'Fitness Tracking App', 'A mobile app to help users track their fitness activities, set goals, and monitor progress.											', 0, '2024-07-26', '2025-03-21', 6, '3,8', '2024-07-22 12:18:22'),
(11, 'Smart Home Automation', 'A system to automate home devices for convenience, energy efficiency, and security.											', 0, '2024-09-30', '2025-01-30', 6, '8,5', '2024-07-22 12:24:16'),
(12, 'Online Learning Platform', '						A platform to deliver online courses, manage content, and track student progress.																', 0, '2024-07-25', '2024-11-29', 6, '4,8', '2024-07-22 12:27:13'),
(13, 'Disaster Management System', 'A system to manage and respond to natural disasters, including resource allocation and communication.											', 0, '2025-02-03', '2025-07-14', 2, '4,3,8', '2024-07-22 12:33:55'),
(14, 'Personal Finance Management System', 'A mobile app to help users manage their personal finances, track expenses, and plan budgets.											', 5, '2024-05-20', '2024-07-22', 2, '4,7', '2024-07-22 12:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'PROJECT MANAGEMENT SYSTEM', 'info@sample.comm', '+6948 8542 623', '2102  Caldwell Road, Rochester, New York, 14608', '');

-- --------------------------------------------------------

--
-- Table structure for table `task_list`
--

CREATE TABLE `task_list` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_list`
--

INSERT INTO `task_list` (`id`, `project_id`, `task`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Sample Task 1', '								&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Fusce ullamcorper mattis semper. Nunc vel risus ipsum. Sed maximus dapibus nisl non laoreet. Pellentesque quis mauris odio. Donec fermentum facilisis odio, sit amet aliquet purus scelerisque eget.&amp;nbsp;&lt;/span&gt;													', 3, '2020-12-03 11:08:58'),
(2, 1, 'Sample Task 2', 'Sample Task 2							', 1, '2020-12-03 13:50:15'),
(3, 2, 'Task Test', 'Sample', 1, '2020-12-03 13:52:25'),
(4, 2, 'test 23', 'Sample test 23', 1, '2020-12-03 13:52:40'),
(5, 3, 'Designing', '																																				Working on the designing part																																		', 3, '2024-07-13 15:47:28'),
(6, 3, 'Test task', '																Test task																			', 3, '2024-07-19 11:19:51'),
(7, 1, 'Development', 'Development							', 2, '2024-07-19 11:21:10'),
(8, 5, 'Student Registration Module', 'Develop a module to handle the registration of new students, including input forms for personal details and academic information.							', 2, '2024-07-20 12:20:58'),
(9, 6, 'Patient Admission System', 'Create a module to manage patient admissions, including forms for patient details, medical history, and room assignment.							', 2, '2024-07-22 11:31:10'),
(10, 6, 'Appointment Scheduling', 'Develop an &lt;b&gt;appointment scheduling system&lt;/b&gt; that allows patients to book appointments with doctors online.							', 1, '2024-07-22 11:33:26'),
(11, 6, 'Electronic Medical Records (EMR)', '&lt;font color=&quot;#00ff00&quot; style=&quot;background-color: rgb(255, 156, 0);&quot;&gt;Implement an EMR system to digitize patient records and make them accessible to authorized medical personnel.							&lt;/font&gt;', 1, '2024-07-22 11:34:55'),
(12, 6, 'Billing and Invoicing', '&lt;b&gt;&lt;i&gt;				Develop a billing system to generate invoices for patients based on treatments, medications, and other services rendered.										&lt;/i&gt;&lt;/b&gt;', 1, '2024-07-22 11:35:55'),
(13, 7, 'Stock Management Module', 'Develop a module to track stock levels, manage inventory, and alert when items are low.							', 3, '2024-07-22 11:40:51'),
(14, 7, 'Order Processing', 'Implement a system to &lt;i&gt;&lt;b&gt;process incoming orders&lt;/b&gt;&lt;/i&gt; and update inventory levels accordingly.							', 1, '2024-07-22 11:42:29'),
(15, 7, 'Supplier Management', 'Develop a module to manage supplier information and track orders placed with suppliers.							', 1, '2024-07-22 11:43:22'),
(16, 7, 'Reporting and Analytics', 'Create reporting tools to analyze inventory trends, sales performance, and supplier efficiency.							', 1, '2024-07-22 11:44:24'),
(17, 5, 'Attendance Tracking', 'Implement an attendance tracking system that allows teachers to record and manage student attendance efficiently.							', 1, '2024-07-22 11:53:32'),
(18, 5, 'Gradebook Integration', 'Create a digital gradebook where teachers can enter grades, and students can view their performance online.							', 1, '2024-07-22 11:54:21'),
(19, 5, 'Parent Portal Development', 'Develop a portal for parents to access their child&amp;#x2019;s academic progress, attendance records, and school announcements.							', 1, '2024-07-22 11:54:52'),
(20, 8, 'Vehicle Tracking', 'Implement a real-time tracking system to monitor the location and status of fleet vehicles.							', 1, '2024-07-22 11:58:57'),
(21, 8, 'Maintenance Scheduling', 'Create a module to schedule and track regular maintenance for fleet vehicles.							', 3, '2024-07-22 12:00:03'),
(22, 8, 'Route Optimization', 'Develop a system to optimize delivery routes based on traffic, distance, and delivery windows.							', 1, '2024-07-22 12:00:47'),
(23, 8, 'Fuel Management', 'Implement a system to monitor fuel consumption and identify opportunities for cost savings.							', 1, '2024-07-22 12:01:28'),
(24, 9, 'Product Catalog', 'Develop a comprehensive catalog to list products with detailed descriptions, images, and prices.							', 2, '2024-07-22 12:15:09'),
(25, 9, 'Shopping Cart', 'Create a shopping cart system that allows users to add, remove, and update product quantities.							', 3, '2024-07-22 12:15:49'),
(26, 9, 'User Authentication', 'Implement a secure user authentication system for account creation and login.							', 1, '2024-07-22 12:16:19'),
(27, 9, 'Payment Gateway Integration', '				Integrate various payment gateways to facilitate secure transactions.										', 2, '2024-07-22 12:16:51'),
(28, 10, 'Activity Logging', 'Develop a feature to log different types of fitness activities, including running, cycling, and swimming.							', 1, '2024-07-22 12:19:55'),
(29, 10, 'Goal Setting', 'Create a module for users to set and track fitness goals.							', 1, '2024-07-22 12:21:50'),
(30, 10, 'Nutrition Tracker', 'Add a module to track daily nutrition intake and provide dietary recommendations.							', 1, '2024-07-22 12:22:37'),
(31, 11, 'Device Integration', 'Integrate various smart home devices such as lights, thermostats, and security cameras.							', 1, '2024-07-22 12:25:01'),
(32, 11, 'Voice Control', 'Implement voice control functionality using assistants like Alexa and Google Home.							', 1, '2024-07-22 12:25:53'),
(33, 12, 'Course Content Management', 'Develop a module to upload and manage course materials, including videos, documents, and quizzes.							', 1, '2024-07-22 12:28:01'),
(34, 12, 'Student Enrollment', 'Create a system for students to enroll in courses and manage their subscriptions.							', 1, '2024-07-22 12:28:39'),
(35, 12, 'Progress Tracking', 'Implement a system to track student progress and provide performance analytics.							', 1, '2024-07-22 12:29:27'),
(36, 12, 'Interactive Learning Tools', 'Develop interactive tools like discussion forums, live chat, and collaborative projects.							', 1, '2024-07-22 12:29:58'),
(37, 13, 'Incident Reporting', 'Develop a module for &lt;b&gt;real-time reporting&lt;/b&gt; of disaster incidents.							', 1, '2024-07-22 12:34:47'),
(38, 13, 'Resource Allocation', 'Create a system to manage and allocate resources such as personnel, equipment, and supplies							', 2, '2024-07-22 12:35:22'),
(39, 13, 'Communication System', 'Implement a communication system for coordinating disaster response teams.							', 1, '2024-07-22 12:36:15'),
(40, 13, 'Public Alerts', 'Set up a system to send alerts and updates to the public during disasters.							', 1, '2024-07-22 12:36:41'),
(41, 14, 'Expense Tracking', 'Develop a module to log daily expenses and categorize them.							', 3, '2024-07-22 12:40:06'),
(42, 14, 'Budget Planning', 'Create a system to set and manage personal budgets for different categories.							', 3, '2024-07-22 12:40:35'),
(43, 14, 'Financial Goals', '				Implement a feature to set and track financial goals like savings or debt reduction.										', 3, '2024-07-22 12:41:04'),
(44, 14, 'Report Generation', '				Develop tools to generate detailed financial reports and visualizations.										', 3, '2024-07-22 12:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, 'no-image-available.png', '2020-11-26 10:57:04'),
(2, 'Smith', 'Gregor', 'smithgr@sample.com', '7e9494020799669f416ef5f4842691c0', 2, '1606978560_avatar.jpg', '2020-12-03 09:26:03'),
(3, 'Jane', 'Doh', 'janedoh@sample.com', '598145236b66d9e29cf3a3451186acfa', 3, '1606958760_47446233-clean-noir-et-gradient-sombre-image-de-fond-abstrait-.jpg', '2020-12-03 09:26:42'),
(4, 'George', 'Wilson', 'gwilson@sample.com', 'd40242fb23c45206fadee4e2418f274f', 3, '1606963560_avatar.jpg', '2020-12-03 10:46:41'),
(5, 'Mike', 'Williams', 'mwilliams@sample.com', '3cc93e9a6741d8b40460457139cf8ced', 3, '1606963620_47446233-clean-noir-et-gradient-sombre-image-de-fond-abstrait-.jpg', '2020-12-03 10:47:06'),
(6, 'Mary', 'Clare', 'marycl@sample.com', '3b1553ef0c0129adf001f1a51a8ebefe', 2, 'no-image-available.png', '2024-07-22 11:22:00'),
(7, 'James', 'Allwy', 'jamesaw@sample.com', '19114e53b9bf97a6812732d278279585', 3, 'no-image-available.png', '2024-07-22 11:48:12'),
(8, 'Mc', 'Gregor', 'mcgregor@sample.com', '7db9b6629e7f009209727eaa444ef669', 3, 'no-image-available.png', '2024-07-22 11:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_productivity`
--

CREATE TABLE `user_productivity` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `subject` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id` int(30) NOT NULL,
  `time_rendered` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_productivity`
--

INSERT INTO `user_productivity` (`id`, `project_id`, `task_id`, `comment`, `subject`, `date`, `start_time`, `end_time`, `user_id`, `time_rendered`, `date_created`) VALUES
(1, 1, 1, '							&lt;p&gt;Sample Progress&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Test 1&lt;/li&gt;&lt;li&gt;Test 2&lt;/li&gt;&lt;li&gt;Test 3&lt;/li&gt;&lt;/ul&gt;																			', 'Sample Progress', '2020-12-03', '08:00:00', '10:00:00', 1, 2, '2020-12-03 12:13:28'),
(2, 1, 1, '							Sample Progress						', 'Sample Progress 2', '2020-12-03', '13:00:00', '14:00:00', 1, 1, '2020-12-03 13:48:28'),
(3, 1, 2, '							Sample						', 'Test', '2020-12-03', '08:00:00', '09:00:00', 5, 1, '2020-12-03 13:57:22'),
(4, 1, 2, 'asdasdasd', 'Sample Progress', '2020-12-02', '08:00:00', '10:00:00', 2, 2, '2020-12-03 14:36:30'),
(6, 2, 4, 'adhhghglhfdw', 'Working on the Admin dashboard', '2024-07-19', '11:34:00', '11:35:00', 3, 0.0166667, '2024-07-19 11:35:16'),
(7, 5, 8, 'Designed and developed the user interface for the student registration form.													', 'Designed and developed the user interface for the student registration form.', '2024-07-20', '12:26:00', '15:27:00', 3, 3.01667, '2024-07-20 12:29:05'),
(8, 14, 41, 'Designed the expense logging interface with customizable categories.													', 'Designed the expense logging interface with customizable categories.', '2024-06-14', '14:44:00', '12:48:00', 7, -1.93333, '2024-07-22 12:44:52'),
(9, 14, 42, 'Integrated budget data with expense tracking for real-time monitoring.													', 'Developed budget planning tools with spending limits and alerts.', '2024-06-26', '13:46:00', '18:46:00', 7, 5, '2024-07-22 12:46:38'),
(10, 14, 43, 'Developed motivational notifications and milestone tracking.													', 'Created goal setting and progress tracking features.', '2024-07-03', '14:49:00', '17:49:00', 4, 3, '2024-07-22 12:49:46'),
(11, 14, 44, 'Implemented data visualization tools to highlight key insights.													', 'Develop tools to generate detailed financial reports and visualizations.', '2024-07-19', '10:51:00', '12:50:00', 4, 1.98333, '2024-07-22 12:52:40'),
(12, 9, 27, '&lt;p&gt;Added &lt;b&gt;mpesa &lt;/b&gt;payment gateway.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Adding Mpesa Payment Gateway', '2024-07-22', '14:18:00', '14:19:00', 7, 0.0166667, '2024-07-22 14:19:47'),
(13, 9, 26, 'Completed adding the Authentication interface', 'Adding Loggin and Registration Interface', '2024-07-22', '14:22:00', '17:24:00', 7, 3.03333, '2024-07-22 14:22:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `file_shares`
--
ALTER TABLE `file_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `project_list`
--
ALTER TABLE `project_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_list`
--
ALTER TABLE `task_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_productivity`
--
ALTER TABLE `user_productivity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `file_shares`
--
ALTER TABLE `file_shares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `project_list`
--
ALTER TABLE `project_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_list`
--
ALTER TABLE `task_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_productivity`
--
ALTER TABLE `user_productivity`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `file_shares`
--
ALTER TABLE `file_shares`
  ADD CONSTRAINT `file_shares_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `file_shares_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
