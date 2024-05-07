-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 04, 2024 at 08:09 AM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21701420_umakclinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', '1234567890', '21-12-2023 02:09:58 PM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `doctorId`, `userId`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`) VALUES
(142, 'Dentist', 25, 117, '2024-01-01', '08:00', '2023-12-28 05:20:25', 1, 1, NULL),
(143, 'Dentist', 25, 118, '2024-01-04', '10:00', '2023-12-28 05:20:28', 1, 1, NULL),
(144, 'Nurse', 26, 133, '2023-12-29', '14:00', '2023-12-28 13:45:11', 0, 1, '2023-12-28 13:45:26'),
(145, 'Nurse', 26, 145, '2024-02-22', '08:00', '2024-01-03 11:28:40', 1, 1, NULL),
(146, 'Dentist', 25, 146, '2024-01-17', '14:30', '2024-01-04 09:25:59', 1, 2, '2024-01-04 09:29:33'),
(147, 'Dentist', 25, 146, '2024-01-24', '12:30', '2024-01-04 09:26:42', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auditlog`
--

CREATE TABLE `auditlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auditlog`
--

INSERT INTO `auditlog` (`id`, `uid`, `username`, `userip`, `timestamp`, `action`) VALUES
(72, 117, 'Apalomique.k11937327@umak.edu.ph', '49.144.5.167', '2023-12-28 13:20:25', 'Booked an appointment'),
(73, 118, 'abaracol.k11938992@umak.edu.ph', '61.9.111.41', '2023-12-28 13:20:28', 'Booked an appointment'),
(74, 133, 'mlasam.k11940121@umak.edu.ph', '175.176.45.136', '2023-12-28 21:45:11', 'Booked an appointment'),
(75, 133, 'mlasam.k11940121@umak.edu.ph', '175.176.45.136', '2023-12-28 13:45:26', 'Cancelled their appointment'),
(76, 145, 'dmallorca.k11939061@umak.edu.ph', '130.105.185.246', '2024-01-03 19:28:40', 'Booked an appointment'),
(77, 146, 'nbibera.k11936492@umak.edu.ph', '175.176.33.220', '2024-01-04 17:25:59', 'Booked an appointment'),
(78, 146, 'nbibera.k11936492@umak.edu.ph', '175.176.33.220', '2024-01-04 17:26:42', 'Booked an appointment');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(25, 'Dentist', 'Denise Marie Mallorca', 'J.P. Rizal Extension, Taguig, 1215 Metro Manila', 9611882376, 'dmallorca.k11939061@umak.edu.ph', 'e807f1fcf82d132f9bb018ca6738a19f', '2023-12-27 12:30:48', NULL),
(26, 'Nurse', 'Angelica Baracol', 'J.P. Rizal Extension, Taguig, 1215 Metro Manila', 98817271072, 'abaracol.k11938992@umak.edu.ph', 'e807f1fcf82d132f9bb018ca6738a19f', '2023-12-27 12:32:58', NULL),
(27, 'Dentist', 'Nicole Bibera', 'J.P. Rizal Extension, Taguig, 1215 Metro Manila', 988971073, 'nbibera.k11936492@umak.edu.ph', 'e807f1fcf82d132f9bb018ca6738a19f', '2023-12-27 12:41:44', NULL),
(28, 'Nurse', 'Ma. Alyssa Lasam', 'J.P. Rizal Extension, Taguig, 1215 Metro Manila', 9127177229, 'mlasam.k11940121@umak.edu.ph', 'e807f1fcf82d132f9bb018ca6738a19f', '2023-12-27 12:42:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(278, 25, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-27 13:37:53', '27-12-2023 07:07:55 PM', 1),
(279, 25, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-27 13:38:34', '27-12-2023 07:08:36 PM', 1),
(280, 25, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-27 14:40:25', '27-12-2023 08:10:32 PM', 1),
(281, 25, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-27 14:40:54', '27-12-2023 08:10:57 PM', 1),
(282, 25, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-27 14:41:37', '27-12-2023 08:11:42 PM', 1),
(283, 25, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 14:10:55', '28-12-2023 07:45:08 PM', 1),
(284, 26, 'abaracol.k11938992@umak.edu.ph', 0x36312e392e3131312e34310000000000, '2023-12-30 07:22:46', '30-12-2023 12:53:10 PM', 1),
(285, 26, 'abaracol.k11938992@umak.edu.ph', 0x36312e392e3130332e39340000000000, '2023-12-31 07:13:33', '31-12-2023 12:44:12 PM', 1),
(286, 25, 'dmallorca.k11939061@umak.edu.ph', 0x3137352e3137362e33332e3232300000, '2024-01-04 09:28:33', '04-01-2024 03:02:44 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

CREATE TABLE `doctorspecilization` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(15, 'Dentist', '2023-11-19 16:02:31', '2023-11-19 16:03:03'),
(21, 'Nurse', '2023-11-26 06:24:07', '2023-12-25 15:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `newpassword` varchar(255) DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token_hash` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_reset`
--

INSERT INTO `password_reset` (`id`, `email`, `newpassword`, `reset_token_expires_at`, `token`, `timestamp`, `reset_token_hash`) VALUES
(103, 'abaracol.k11938992@umak.edu.ph', NULL, NULL, 'd339de6179ab3cf3d05d965a0673c945ac1ebf4a5547be6837852c9cc1c1db12', '2023-12-28 05:25:41', NULL),
(104, 'dmallorca.k11939061@umak.edu.ph', NULL, NULL, '3c4f4481242f9112ea28381fa414c57086a06d3827360422d972e4501a22daf6', '2023-12-28 06:59:06', NULL),
(105, 'mlasam.k11940121@umak.edu.ph', NULL, NULL, 'b551400d5a0f7e53dd0f20553df4182afb8ececc18b3ee1ee2957dcab576813b', '2023-12-29 07:05:03', NULL),
(106, 'nbibera.k11936492@umak.edu.ph', NULL, NULL, '140497c73dc5549b01412439145fab68cd79e0164cbd2740bc92dd3d4a708c8d', '2024-01-03 04:39:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(32, 'ANGELICA BARACOL', 'abaracol.k11938992@umak.edu.ph', 987654321, 'merry chirstmas', '2023-12-28 05:27:59', NULL, NULL, NULL),
(33, 'Angelica Baracol', 'abaracol.k11938992@umak.edu.ph', 9282690953, 'hello', '2023-12-31 07:12:40', 'gawa na daw capstone', '2024-01-29 10:38:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

CREATE TABLE `tblmedicalhistory` (
  `ID` int(10) NOT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `DoctorName` varchar(255) DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext DEFAULT NULL,
  `Diagnosis` text DEFAULT NULL,
  `Symptoms` text DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblmedicalhistory`
--

INSERT INTO `tblmedicalhistory` (`ID`, `PatientID`, `DoctorName`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`, `Diagnosis`, `Symptoms`, `CreationDate`) VALUES
(93, 94, 'Denise Marie Mallorca', '90/100', '140', '50kg', '37', 'Buntis two months', 'Waiting for another months', 'everynight', '2024-01-04 09:32:02');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

CREATE TABLE `tblpatient` (
  `ID` int(10) NOT NULL,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext DEFAULT NULL,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `Docid`, `PatientName`, `PatientContno`, `PatientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis`, `CreationDate`, `UpdationDate`) VALUES
(94, 25, 'Nicole Bibera', 961188237, 'dmallorca.k11939061@umak.edu.ph', 'female', '53 D Edsa St. Brgy. Bangkal', 21, 'none', '2024-01-04 09:30:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(401, NULL, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-27 14:33:37', NULL, 0),
(402, NULL, 'mlasam.k11940121@umak.edu.ph', 0x3137352e3137362e34352e3134390000, '2023-12-27 15:02:47', NULL, 0),
(403, NULL, 'mlasam.k11940121@umak.edu.ph', 0x3137352e3137362e34352e3134390000, '2023-12-27 15:04:55', NULL, 0),
(404, NULL, 'mlasam.k11940121@umak.edu.ph', 0x3137352e3137362e34352e3134390000, '2023-12-27 15:05:08', NULL, 0),
(405, NULL, 'mlasam.k11940121@umak.edu.ph', 0x3137352e3137362e34352e3134390000, '2023-12-27 15:05:20', NULL, 0),
(406, NULL, 'Apalomique.k11937327@umak.edu.ph', 0x34392e3134342e352e31363700000000, '2023-12-28 05:09:34', NULL, 0),
(407, NULL, 'Apalomique.k11937327@umak.edu.ph', 0x34392e3134342e352e31363700000000, '2023-12-28 05:11:29', NULL, 0),
(408, NULL, 'Apalomique.k11937327@umak.edu.ph', 0x34392e3134342e352e31363700000000, '2023-12-28 05:11:48', NULL, 0),
(409, 117, 'Apalomique.k11937327@umak.edu.ph', 0x34392e3134342e352e31363700000000, '2023-12-28 05:17:06', NULL, 1),
(410, NULL, 'abaracol.k11938992@umak.edu.ph', 0x36312e392e3131312e34310000000000, '2023-12-28 05:17:21', NULL, 0),
(411, 118, 'abaracol.k11938992@umak.edu.ph', 0x36312e392e3131312e34310000000000, '2023-12-28 05:18:28', '28-12-2023 10:52:50 AM', 1),
(412, 118, 'abaracol.k11938992@umak.edu.ph', 0x36312e392e3131312e34310000000000, '2023-12-28 05:23:18', '28-12-2023 10:55:31 AM', 1),
(413, 118, 'abaracol.k11938992@umak.edu.ph', 0x36312e392e3131312e34310000000000, '2023-12-28 05:26:14', '28-12-2023 10:56:51 AM', 1),
(414, NULL, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 06:30:25', NULL, 0),
(415, NULL, 'denisemari@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 06:31:04', NULL, 0),
(416, NULL, 'denisemarie@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 06:36:39', NULL, 0),
(417, NULL, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 06:37:05', NULL, 0),
(418, NULL, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 06:37:50', NULL, 0),
(419, NULL, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 06:40:11', NULL, 0),
(420, NULL, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 06:41:37', NULL, 0),
(421, 126, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 06:59:40', '28-12-2023 12:32:11 PM', 1),
(422, 127, 'nbibera.k11936492@umak.edu.ph', 0x34392e3134342e33302e313933000000, '2023-12-28 07:03:04', NULL, 1),
(423, 126, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 07:06:50', NULL, 1),
(424, 126, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 07:07:17', '28-12-2023 12:40:22 PM', 1),
(425, 126, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 07:12:07', '28-12-2023 12:50:19 PM', 1),
(426, 126, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 07:20:34', '28-12-2023 12:51:38 PM', 1),
(427, 126, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 07:21:48', '28-12-2023 01:00:52 PM', 1),
(428, 133, 'mlasam.k11940121@umak.edu.ph', 0x3137352e3137362e34352e3133360000, '2023-12-28 13:44:11', NULL, 1),
(429, 131, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2023-12-28 14:10:38', NULL, 1),
(430, 133, 'mlasam.k11940121@umak.edu.ph', 0x3137352e3137362e34352e3133370000, '2023-12-29 07:03:42', '29-12-2023 12:34:24 PM', 1),
(431, 133, 'mlasam.k11940121@umak.edu.ph', 0x3137352e3137362e34352e3133370000, '2023-12-29 07:04:43', '29-12-2023 12:34:48 PM', 1),
(432, 133, 'mlasam.k11940121@umak.edu.ph', 0x3137352e3137362e34352e3133370000, '2023-12-29 07:05:52', NULL, 1),
(433, 140, 'abaracol.k11938992@umak.edu.ph', 0x36312e392e3130332e39340000000000, '2023-12-31 07:10:47', '31-12-2023 12:41:36 PM', 1),
(434, 142, 'latutubo.k11935624@umak.edu.ph', 0x3138302e3139302e39382e3131370000, '2024-01-02 11:18:16', '02-01-2024 04:50:40 PM', 1),
(435, 140, 'abaracol.k11938992@umak.edu.ph', 0x36312e392e3131312e34310000000000, '2024-01-02 15:18:26', '02-01-2024 08:48:57 PM', 1),
(436, 144, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2024-01-03 04:47:05', '03-01-2024 10:18:21 AM', 1),
(437, 144, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2024-01-03 04:48:30', '03-01-2024 10:42:58 AM', 1),
(438, 145, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2024-01-03 11:23:59', NULL, 1),
(439, 145, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2024-01-03 11:24:12', NULL, 1),
(440, 146, 'nbibera.k11936492@umak.edu.ph', 0x3137352e3137362e33332e3232300000, '2024-01-04 09:21:34', '04-01-2024 02:57:46 PM', 1),
(441, 146, 'nbibera.k11936492@umak.edu.ph', 0x3137352e3137362e33332e3232300000, '2024-01-04 09:33:06', '04-01-2024 03:08:02 PM', 1),
(442, 147, 'dmallorca.k11939061@umak.edu.ph', 0x3133302e3130352e3138352e32343600, '2024-01-07 09:13:18', NULL, 1),
(443, 148, 'jquitilen.a12240323@umak.edu.ph', 0x3133302e3130352e3138352e32300000, '2024-04-30 04:24:48', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `otp` varchar(10) NOT NULL,
  `status` varchar(255) NOT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `otp`, `status`, `regDate`, `updationDate`) VALUES
(41, 'Ari Apug', 'makati na taguig', 'Wee', 'male', 'ariben.apugan@umak.edu.ph', '83422503bcfc01d303030e8a7cc80efc', '', '1', '2023-11-21 05:35:25', '2023-11-21 05:35:58'),
(117, 'Renz', 'Poblacion Makati ', 'Makati', 'male', 'Apalomique.k11937327@umak.edu.ph', '2224fdd48769beb13c396dff92b8eb5e', '823502', '0', '2023-12-28 05:12:45', NULL),
(133, 'Alyssa C. Lasam', '215-D Guiho st. Cembo', 'Makati City', 'female', 'mlasam.k11940121@umak.edu.ph', '42f749ade7f9e195bf475f37a44cafcb', '', '1', '2023-12-28 13:43:45', '2023-12-29 07:05:38'),
(140, 'ANGELICA BARACOL', '4333 Tinio St. Bangkal', 'Makati City', 'female', 'abaracol.k11938992@umak.edu.ph', '6fb42da0e32e07b61c9f0251fe627a9c', '', '1', '2023-12-31 07:10:02', '2024-01-02 15:18:14'),
(142, 'leunamme atutubo', '83 Block 4 Extension West Rembo', 'Makati City', 'female', 'latutubo.k11935624@umak.edu.ph', 'd80ef0ce4ba6c8fafe1b3b60e11939f9', '', '1', '2024-01-02 11:17:19', '2024-01-02 11:17:35'),
(143, 'Juliana Eunice G. Mojar', '165 U 22nd Avenue East Rembo ', 'Taguig City ', 'female', 'juliana.mojar@umak.edu.ph', '934c8f85af6949c0ad3f11d8d12e13d4', '841234', '0', '2024-01-02 11:28:16', NULL),
(146, 'nicole bibera', '299', 'makati', 'female', 'nbibera.k11936492@umak.edu.ph', 'e10adc3949ba59abbe56e057f20f883e', '723674', '0', '2024-01-04 09:21:19', NULL),
(147, 'Denise Marie ', 'Bangkal', 'Makati', 'female', 'dmallorca.k11939061@umak.edu.ph', 'e10adc3949ba59abbe56e057f20f883e', '', '1', '2024-01-07 09:12:41', '2024-01-07 09:12:57'),
(148, 'Joselito C. Quitilen Jr.', '13-B Makabuhay St. Western Bicutan', 'Taguig City', 'male', 'jquitilen.a12240323@umak.edu.ph', '144979e46cd710cdb6be63be526a9e98', '', '1', '2024-04-30 04:24:17', '2024-04-30 04:24:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auditlog`
--
ALTER TABLE `auditlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorslog`
--
ALTER TABLE `doctorslog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatient`
--
ALTER TABLE `tblpatient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `auditlog`
--
ALTER TABLE `auditlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `doctorslog`
--
ALTER TABLE `doctorslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `tblpatient`
--
ALTER TABLE `tblpatient`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
