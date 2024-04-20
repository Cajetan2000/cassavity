-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2024 at 12:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chores_mgt`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigned_people`
--

CREATE TABLE `assigned_people` (
  `pid` int(11) NOT NULL,
  `assignmentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `assignmentid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `date_assign` date NOT NULL,
  `date_due` date NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_completed` date DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `who_assigned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chores`
--

CREATE TABLE `chores` (
  `cid` int(11) NOT NULL,
  `chorename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_name`
--

CREATE TABLE `family_name` (
  `fid` int(11) NOT NULL,
  `fam_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `family_name`
--

INSERT INTO `family_name` (`fid`, `fam_name`) VALUES
(1, 'Father'),
(2, 'Mother'),
(3, 'Son'),
(4, 'Daughter'),
(5, 'Sister'),
(6, 'Brother');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `pid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` int(11) NOT NULL,
  `dob` date NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`pid`, `rid`, `fid`, `fname`, `lname`, `gender`, `dob`, `tel`, `email`, `passwd`) VALUES
(9, 1, 1, 'Cajetan', 'Songwae', 0, '1998-01-01', '+233553084580', 'cajetan.songwae@ashesi.edu.gh', '$2y$10$oUHWhiVVqJ15nTiJBELX1urFumeYA2Yk9OOrnnrmnxOOrqNHnu9fe'),
(16, 3, 3, 'Jacob', 'Setorglo', 0, '2002-12-29', '+233553084580', 'songwae2@gmail.com', '$2y$10$AgcGj/q/s1rY4mNv4CLIJOBBz7.p2I7RtK9V.9YWZ4B4DQ5fr/Ssi'),
(17, 3, 6, 'Gabriel', 'Domoninge Naa', 0, '2024-03-07', '+233553084580', 'gabriel.naa@ashesi.edu.gh', '$2y$10$WERD/rvwxBs8N3MHhMAgaeRlNePKa0B6ep/80/VcTqd6bZnX7e0aS');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `rid` int(11) NOT NULL,
  `rname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`rid`, `rname`) VALUES
(1, 'superadmin'),
(2, 'admin'),
(3, 'standard');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `sid` int(11) NOT NULL,
  `sname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`sid`, `sname`) VALUES
(1, 'Assigned'),
(2, 'InProgress'),
(3, 'Completed'),
(4, 'Incomplete');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_people`
--
ALTER TABLE `assigned_people`
  ADD KEY `assignmentid` (`assignmentid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`assignmentid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `who_assigned` (`who_assigned`);

--
-- Indexes for table `chores`
--
ALTER TABLE `chores`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `family_name`
--
ALTER TABLE `family_name`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `assignmentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chores`
--
ALTER TABLE `chores`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `family_name`
--
ALTER TABLE `family_name`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_people`
--
ALTER TABLE `assigned_people`
  ADD CONSTRAINT `assigned_people_ibfk_1` FOREIGN KEY (`assignmentid`) REFERENCES `assignment` (`assignmentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_people_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `people` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `chores` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `status` (`sid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `assignment_ibfk_3` FOREIGN KEY (`who_assigned`) REFERENCES `people` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `people_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `family_name` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
