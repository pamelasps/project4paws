<<<<<<< HEAD
-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 08, 2021 at 12:53 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4paws`
--
CREATE DATABASE IF NOT EXISTS `4paws` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `4paws`;

-- --------------------------------------------------------

--
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
CREATE TABLE `breed` (
  `breed_id` int NOT NULL,
  `breed_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `owner_id` int NOT NULL,
  `owner_firstname` varchar(100) NOT NULL,
  `owner_lastname` varchar(100) NOT NULL,
  `owner_email` varchar(100) NOT NULL,
  `owner_phone` varchar(15) NOT NULL,
  `owner_address` varchar(200) NOT NULL,
  `owner_city` varchar(100) NOT NULL,
  `owner_province` varchar(100) NOT NULL,
  `owner_country` varchar(100) NOT NULL,
  `owner_postalCode` varchar(15) NOT NULL,
  `owner_bankBranch` int NOT NULL,
  `owner_bankAccNum` int NOT NULL,
  `owner_bankAccType` varchar(30) NOT NULL,
  `owner_bankName` varchar(50) NOT NULL,
  `owner_dob` date NOT NULL,
  `owner_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet` (
  `pet_id` int NOT NULL,
  `pet_name` varchar(50) NOT NULL,
  `pet_age` int NOT NULL,
  `pet_color` varchar(30) NOT NULL,
  `breed_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pet_owner`
--

DROP TABLE IF EXISTS `pet_owner`;
CREATE TABLE `pet_owner` (
  `pet_owner_id` int NOT NULL,
  `pet_id` int NOT NULL,
  `owner_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `rating_id` int NOT NULL,
  `rating_start` int NOT NULL,
  `rating_review` varchar(250) NOT NULL,
  `rating_date` date NOT NULL,
  `owner_id` int NOT NULL,
  `sitter_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL,
  `sch_dropOffDate` date NOT NULL,
  `sch_dropOffTime` time NOT NULL,
  `sch_pickUpDate` date NOT NULL,
  `sch_pickUpTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitter`
--

DROP TABLE IF EXISTS `sitter`;
CREATE TABLE `sitter` (
  `sitter_id` int NOT NULL,
  `sitter_firstname` varchar(100) NOT NULL,
  `sitter_lastname` varchar(100) NOT NULL,
  `sitter_email` varchar(100) NOT NULL,
  `sitter_phone` varchar(15) NOT NULL,
  `sitter_address` varchar(200) NOT NULL,
  `sitter_city` varchar(100) NOT NULL,
  `sitter_province` varchar(100) NOT NULL,
  `sitter_country` varchar(100) NOT NULL,
  `sitter_postalCode` varchar(15) NOT NULL,
  `sitter_bankAccNum` int NOT NULL,
  `sitter_bankAccType` varchar(30) NOT NULL,
  `sitter_bankBranch` int NOT NULL,
  `sitter_bankName` varchar(50) NOT NULL,
  `sitter_dob` date NOT NULL,
  `sitter_photo` blob NOT NULL,
  `sitter_policeCheck` blob NOT NULL,
  `sitter_price` double NOT NULL,
  `sitter_intro` varchar(250) NOT NULL,
  `sitter_approved` tinyint(1) NOT NULL,
  `sitter_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitter_breed`
--

DROP TABLE IF EXISTS `sitter_breed`;
CREATE TABLE `sitter_breed` (
  `sitter_breed_id` int NOT NULL,
  `sitter_id` int NOT NULL,
  `breed_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitter_schedule`
--

DROP TABLE IF EXISTS `sitter_schedule`;
CREATE TABLE `sitter_schedule` (
  `sitterchs_id` int NOT NULL,
  `sitter_id` int NOT NULL,
  `schedule_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `breed`
--
ALTER TABLE `breed`
  ADD PRIMARY KEY (`breed_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `pet_breed_fk` (`breed_id`);

--
-- Indexes for table `pet_owner`
--
ALTER TABLE `pet_owner`
  ADD PRIMARY KEY (`pet_owner_id`),
  ADD KEY `petOwner_owner_fk` (`owner_id`),
  ADD KEY `petOwner_pet_fk` (`pet_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `rating_owner_fk` (`owner_id`),
  ADD KEY `rating_sitter_fk` (`sitter_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `sitter`
--
ALTER TABLE `sitter`
  ADD PRIMARY KEY (`sitter_id`);

--
-- Indexes for table `sitter_breed`
--
ALTER TABLE `sitter_breed`
  ADD PRIMARY KEY (`sitter_breed_id`),
  ADD KEY `sitterBreed_sitter_fk` (`sitter_id`),
  ADD KEY `sitterBreed_breed_fk` (`breed_id`);

--
-- Indexes for table `sitter_schedule`
--
ALTER TABLE `sitter_schedule`
  ADD PRIMARY KEY (`sitterchs_id`),
  ADD KEY `sitterSch_sitter_fk` (`sitter_id`),
  ADD KEY `sitterSch_schedule_fk` (`schedule_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `breed`
--
ALTER TABLE `breed`
  MODIFY `breed_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `owner_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet`
--
ALTER TABLE `pet`
  MODIFY `pet_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet_owner`
--
ALTER TABLE `pet_owner`
  MODIFY `pet_owner_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitter`
--
ALTER TABLE `sitter`
  MODIFY `sitter_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitter_breed`
--
ALTER TABLE `sitter_breed`
  MODIFY `sitter_breed_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitter_schedule`
--
ALTER TABLE `sitter_schedule`
  MODIFY `sitterchs_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `pet_breed_fk` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `pet_owner`
--
ALTER TABLE `pet_owner`
  ADD CONSTRAINT `petOwner_owner_fk` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `petOwner_pet_fk` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_owner_fk` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `rating_sitter_fk` FOREIGN KEY (`sitter_id`) REFERENCES `sitter` (`sitter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `sitter_breed`
--
ALTER TABLE `sitter_breed`
  ADD CONSTRAINT `sitterBreed_breed_fk` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sitterBreed_sitter_fk` FOREIGN KEY (`sitter_id`) REFERENCES `sitter` (`sitter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `sitter_schedule`
--
ALTER TABLE `sitter_schedule`
  ADD CONSTRAINT `sitterSch_schedule_fk` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sitterSch_sitter_fk` FOREIGN KEY (`sitter_id`) REFERENCES `sitter` (`sitter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
=======
-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 08, 2021 at 12:53 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4paws`
--
CREATE DATABASE IF NOT EXISTS `4paws` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `4paws`;

-- --------------------------------------------------------

--
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
CREATE TABLE `breed` (
  `breed_id` int NOT NULL,
  `breed_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `owner_id` int NOT NULL,
  `owner_firstname` varchar(100) NOT NULL,
  `owner_lastname` varchar(100) NOT NULL,
  `owner_email` varchar(100) NOT NULL,
  `owner_phone` varchar(15) NOT NULL,
  `owner_address` varchar(200) NOT NULL,
  `owner_city` varchar(100) NOT NULL,
  `owner_province` varchar(100) NOT NULL,
  `owner_country` varchar(100) NOT NULL,
  `owner_postalCode` varchar(15) NOT NULL,
  `owner_bankBranch` int NOT NULL,
  `owner_bankAccNum` int NOT NULL,
  `owner_bankAccType` varchar(30) NOT NULL,
  `owner_bankName` varchar(50) NOT NULL,
  `owner_dob` date NOT NULL,
  `owner_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet` (
  `pet_id` int NOT NULL,
  `pet_name` varchar(50) NOT NULL,
  `pet_age` int NOT NULL,
  `pet_color` varchar(30) NOT NULL,
  `breed_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pet_owner`
--

DROP TABLE IF EXISTS `pet_owner`;
CREATE TABLE `pet_owner` (
  `pet_owner_id` int NOT NULL,
  `pet_id` int NOT NULL,
  `owner_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `rating_id` int NOT NULL,
  `rating_start` int NOT NULL,
  `rating_review` varchar(250) NOT NULL,
  `rating_date` date NOT NULL,
  `owner_id` int NOT NULL,
  `sitter_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL,
  `sch_dropOffDate` date NOT NULL,
  `sch_dropOffTime` time NOT NULL,
  `sch_pickUpDate` date NOT NULL,
  `sch_pickUpTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitter`
--

DROP TABLE IF EXISTS `sitter`;
CREATE TABLE `sitter` (
  `sitter_id` int NOT NULL,
  `sitter_firstname` varchar(100) NOT NULL,
  `sitter_lastname` varchar(100) NOT NULL,
  `sitter_email` varchar(100) NOT NULL,
  `sitter_phone` varchar(15) NOT NULL,
  `sitter_address` varchar(200) NOT NULL,
  `sitter_city` varchar(100) NOT NULL,
  `sitter_province` varchar(100) NOT NULL,
  `sitter_country` varchar(100) NOT NULL,
  `sitter_postalCode` varchar(15) NOT NULL,
  `sitter_bankAccNum` int NOT NULL,
  `sitter_bankAccType` varchar(30) NOT NULL,
  `sitter_bankBranch` int NOT NULL,
  `sitter_bankName` varchar(50) NOT NULL,
  `sitter_dob` date NOT NULL,
  `sitter_photo` blob NOT NULL,
  `sitter_policeCheck` blob NOT NULL,
  `sitter_price` double NOT NULL,
  `sitter_intro` varchar(250) NOT NULL,
  `sitter_approved` tinyint(1) NOT NULL,
  `sitter_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitter_breed`
--

DROP TABLE IF EXISTS `sitter_breed`;
CREATE TABLE `sitter_breed` (
  `sitter_breed_id` int NOT NULL,
  `sitter_id` int NOT NULL,
  `breed_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitter_schedule`
--

DROP TABLE IF EXISTS `sitter_schedule`;
CREATE TABLE `sitter_schedule` (
  `sitterchs_id` int NOT NULL,
  `sitter_id` int NOT NULL,
  `schedule_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `breed`
--
ALTER TABLE `breed`
  ADD PRIMARY KEY (`breed_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `pet_breed_fk` (`breed_id`);

--
-- Indexes for table `pet_owner`
--
ALTER TABLE `pet_owner`
  ADD PRIMARY KEY (`pet_owner_id`),
  ADD KEY `petOwner_owner_fk` (`owner_id`),
  ADD KEY `petOwner_pet_fk` (`pet_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `rating_owner_fk` (`owner_id`),
  ADD KEY `rating_sitter_fk` (`sitter_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `sitter`
--
ALTER TABLE `sitter`
  ADD PRIMARY KEY (`sitter_id`);

--
-- Indexes for table `sitter_breed`
--
ALTER TABLE `sitter_breed`
  ADD PRIMARY KEY (`sitter_breed_id`),
  ADD KEY `sitterBreed_sitter_fk` (`sitter_id`),
  ADD KEY `sitterBreed_breed_fk` (`breed_id`);

--
-- Indexes for table `sitter_schedule`
--
ALTER TABLE `sitter_schedule`
  ADD PRIMARY KEY (`sitterchs_id`),
  ADD KEY `sitterSch_sitter_fk` (`sitter_id`),
  ADD KEY `sitterSch_schedule_fk` (`schedule_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `breed`
--
ALTER TABLE `breed`
  MODIFY `breed_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `owner_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet`
--
ALTER TABLE `pet`
  MODIFY `pet_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet_owner`
--
ALTER TABLE `pet_owner`
  MODIFY `pet_owner_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitter`
--
ALTER TABLE `sitter`
  MODIFY `sitter_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitter_breed`
--
ALTER TABLE `sitter_breed`
  MODIFY `sitter_breed_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitter_schedule`
--
ALTER TABLE `sitter_schedule`
  MODIFY `sitterchs_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `pet_breed_fk` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `pet_owner`
--
ALTER TABLE `pet_owner`
  ADD CONSTRAINT `petOwner_owner_fk` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `petOwner_pet_fk` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_owner_fk` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `rating_sitter_fk` FOREIGN KEY (`sitter_id`) REFERENCES `sitter` (`sitter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `sitter_breed`
--
ALTER TABLE `sitter_breed`
  ADD CONSTRAINT `sitterBreed_breed_fk` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sitterBreed_sitter_fk` FOREIGN KEY (`sitter_id`) REFERENCES `sitter` (`sitter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `sitter_schedule`
--
ALTER TABLE `sitter_schedule`
  ADD CONSTRAINT `sitterSch_schedule_fk` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sitterSch_sitter_fk` FOREIGN KEY (`sitter_id`) REFERENCES `sitter` (`sitter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
>>>>>>> 94b28df63d2978cec02fe5913d9b0c9025a604ce
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;