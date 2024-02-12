-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2023 at 04:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13
use `OrderingPlatform`;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `equantom`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `detailAddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `detailAddress`) VALUES
(1, 'FLAT 12.17/f PACIFIC TRADE CENTRE'),
(2, 'Room 813B, 8/F, Argyle Centre Phase 1, 688 Nathan Road, MK, KLN'),
(3, 'G/F, 207A Sha Tsui Road, Tsuen Wan'),
(4, '旺角彌敦道688號 旺角中心一期 18樓 1808室'),
(5, '元州街350號家壹10號地舖'),
(6, 'Shop B, 4D Nassau St., G/F., Mei Foo Sun Chuen, Kowloon, Hong Kong'),
(7, 'Unit 3009, 30/F, Metroplaza Tower2, 223 Hing Fong Road, Kwai Fong, N.T.'),
(8, 'Room 910, 9/F, OFFICE TOWER ONE, GRAND PLAZA, 639 NATHAN ROAD. LOWLOON'),
(1184, 'long long long long long address, it is the longest among the doctors. HI.');

-- --------------------------------------------------------

--
-- Table structure for table `bleach_stl`
--

CREATE TABLE `bleach_stl` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 1,
  `count` int(11) NOT NULL DEFAULT 1,
  `stlType` int(2) NOT NULL DEFAULT 0,
  `stls1` varchar(255) DEFAULT NULL,
  `stls2` varchar(255) DEFAULT NULL,
  `stls3` varchar(255) DEFAULT NULL,
  `stls4` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `case_log`
--

CREATE TABLE `case_log` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `event` varchar(255) NOT NULL,
  `unread` int(1) NOT NULL DEFAULT 1,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `case_log`
--

INSERT INTO `case_log` (`id`, `order_id`, `event`, `unread`, `time`) VALUES
(303, 5796, 'Draft case.', 1, '2023-06-09 09:12:43'),
(304, 5800, 'Draft case.', 1, '2023-06-09 09:13:02'),
(305, 5813, 'Draft case.', 1, '2023-06-09 09:13:03'),
(306, 5814, 'Draft case.', 1, '2023-06-09 09:13:03'),
(307, 5822, 'Draft case.', 1, '2023-06-09 09:13:04'),
(308, 5841, 'Draft case.', 1, '2023-06-09 09:13:04'),
(309, 5853, 'Draft case.', 1, '2023-06-09 09:13:05'),
(310, 5857, 'Draft case.', 1, '2023-06-09 09:13:05'),
(311, 5862, 'Draft case.', 1, '2023-06-09 09:13:06'),
(312, 5866, 'Draft case.', 1, '2023-06-09 09:13:06'),
(313, 5875, 'Draft case.', 1, '2023-06-09 09:13:07'),
(314, 5880, 'Draft case.', 1, '2023-06-09 09:13:08'),
(315, 5898, 'Draft case.', 1, '2023-06-09 09:13:08'),
(316, 5901, 'Draft case.', 1, '2023-06-09 09:13:09'),
(317, 5911, 'Draft case.', 1, '2023-06-09 09:13:09'),
(318, 5912, 'Draft case.', 1, '2023-06-09 09:13:10'),
(319, 5923, 'Draft case.', 1, '2023-06-09 09:13:10'),
(320, 5927, 'Draft case.', 1, '2023-06-09 09:13:11'),
(321, 5935, 'Draft case.', 1, '2023-06-09 09:13:11'),
(322, 5941, 'Draft case.', 1, '2023-06-09 09:13:12'),
(324, 5941, 'Prescription Submitted', 1, '2023-06-09 09:31:06'),
(325, 5935, 'Prescription Submitted', 1, '2023-06-09 09:35:10'),
(326, 5927, 'Prescription Submitted', 1, '2023-06-09 09:38:49'),
(327, 5923, 'Prescription Submitted', 1, '2023-06-09 09:41:19'),
(328, 5912, 'Prescription Submitted', 1, '2023-06-09 09:44:21'),
(329, 5911, 'Prescription Submitted', 1, '2023-06-09 09:48:08'),
(330, 5901, 'Prescription Submitted', 1, '2023-06-09 09:51:08'),
(331, 5898, 'Prescription Submitted', 1, '2023-06-09 09:54:49'),
(332, 5880, 'Prescription Submitted', 1, '2023-06-09 09:59:54'),
(333, 5875, 'Prescription Submitted', 1, '2023-06-09 10:04:08'),
(334, 5866, 'Prescription Submitted', 1, '2023-06-09 10:14:16'),
(335, 5862, 'Prescription Submitted', 1, '2023-06-09 10:17:09'),
(336, 5857, 'Prescription Submitted', 1, '2023-06-09 10:21:12'),
(337, 5853, 'Prescription Submitted', 1, '2023-06-09 10:24:43'),
(338, 5841, 'Prescription Submitted', 1, '2023-06-09 10:27:59'),
(339, 5822, 'Prescription Submitted', 1, '2023-06-09 10:31:50'),
(340, 5814, 'Prescription Submitted', 1, '2023-06-09 10:34:06'),
(341, 5813, 'Prescription Submitted', 1, '2023-06-09 10:35:57'),
(342, 5800, 'Prescription Submitted', 1, '2023-06-09 10:37:25'),
(343, 5796, 'Prescription Submitted', 1, '2023-06-09 10:39:48'),
(344, 5804, 'Draft case.', 1, '2023-06-09 10:44:55'),
(345, 5805, 'Draft case.', 1, '2023-06-09 10:44:56'),
(346, 5938, 'Draft case.', 1, '2023-06-09 10:44:57'),
(347, 5830, 'Draft case.', 1, '2023-06-09 10:44:58'),
(348, 5836, 'Draft case.', 1, '2023-06-09 10:44:58'),
(349, 5845, 'Draft case.', 1, '2023-06-09 10:44:59'),
(350, 5846, 'Draft case.', 1, '2023-06-09 10:44:59'),
(351, 5849, 'Draft case.', 1, '2023-06-09 10:45:00'),
(352, 5869, 'Draft case.', 1, '2023-06-09 10:45:01'),
(353, 5871, 'Draft case.', 1, '2023-06-09 10:45:01'),
(354, 5876, 'Draft case.', 1, '2023-06-09 10:45:02'),
(355, 5879, 'Draft case.', 1, '2023-06-09 10:45:02'),
(356, 5881, 'Draft case.', 1, '2023-06-09 10:45:03'),
(357, 5884, 'Draft case.', 1, '2023-06-09 10:45:03'),
(358, 5887, 'Draft case.', 1, '2023-06-09 10:45:04'),
(359, 5890, 'Draft case.', 1, '2023-06-09 10:45:04'),
(360, 5891, 'Draft case.', 1, '2023-06-09 10:45:05'),
(361, 5916, 'Draft case.', 1, '2023-06-09 10:45:05'),
(362, 5920, 'Draft case.', 1, '2023-06-09 10:45:06'),
(363, 5931, 'Draft case.', 1, '2023-06-09 10:45:06'),
(364, 5931, 'Draft case.', 1, '2023-06-09 10:45:07'),
(365, 5938, 'Prescription Submitted', 1, '2023-06-09 11:03:00'),
(366, 5931, 'Prescription Submitted', 1, '2023-06-09 11:18:24'),
(367, 5920, 'Prescription Submitted', 1, '2023-06-09 11:19:15'),
(368, 5916, 'Prescription Submitted', 1, '2023-06-09 11:19:48'),
(369, 5891, 'Prescription Submitted', 1, '2023-06-09 11:20:23'),
(370, 5890, 'Prescription Submitted', 1, '2023-06-09 11:21:03'),
(371, 5887, 'Prescription Submitted', 1, '2023-06-09 11:21:32'),
(372, 5884, 'Prescription Submitted', 1, '2023-06-09 11:21:59'),
(373, 5881, 'Prescription Submitted', 1, '2023-06-09 11:22:35'),
(374, 5879, 'Prescription Submitted', 1, '2023-06-09 11:23:09'),
(375, 5876, 'Prescription Submitted', 1, '2023-06-09 11:23:40'),
(376, 5871, 'Prescription Submitted', 1, '2023-06-09 11:24:09'),
(377, 5869, 'Prescription Submitted', 1, '2023-06-09 11:24:37'),
(378, 5849, 'Prescription Submitted', 1, '2023-06-09 11:26:27'),
(379, 5846, 'Prescription Submitted', 1, '2023-06-09 11:27:15'),
(380, 5845, 'Prescription Submitted', 1, '2023-06-09 11:27:41'),
(381, 5836, 'Prescription Submitted', 1, '2023-06-09 11:28:35'),
(382, 5830, 'Prescription Submitted', 1, '2023-06-09 11:29:06'),
(383, 5809, 'Prescription Submitted', 1, '2023-06-09 11:30:24'),
(384, 5809, 'Doctor edits patient profile.', 1, '2023-06-09 11:30:51'),
(385, 5809, 'Doctor edits patient profile.', 1, '2023-06-09 11:31:10'),
(386, 5809, 'Doctor edits patient profile.', 1, '2023-06-09 11:31:59'),
(387, 5805, 'Prescription Submitted', 1, '2023-06-09 11:51:07'),
(388, 5804, 'Prescription Submitted', 1, '2023-06-09 11:51:35'),
(389, 5934, 'Draft case.', 1, '2023-06-09 12:00:14'),
(390, 5934, 'Prescription Submitted', 1, '2023-06-09 12:00:38'),
(391, 5858, 'Draft case.', 1, '2023-06-09 12:05:30'),
(392, 5858, 'Prescription Submitted', 1, '2023-06-09 12:05:56'),
(393, 5821, 'Draft case.', 1, '2023-06-09 12:08:20'),
(394, 5821, 'Prescription Submitted', 1, '2023-06-09 12:08:40'),
(395, 5902, 'Draft case.', 1, '2023-06-09 12:12:08'),
(396, 5902, 'Prescription Submitted', 1, '2023-06-09 12:12:36'),
(397, 5820, 'Draft case.', 1, '2023-06-09 12:15:28'),
(398, 5820, 'Prescription Submitted', 1, '2023-06-09 12:15:51'),
(399, 5812, 'Draft case.', 1, '2023-06-09 12:17:34'),
(400, 5812, 'Prescription Submitted', 1, '2023-06-09 12:17:52'),
(420, 5945, 'Draft case.', 1, '2023-06-10 14:04:50'),
(421, 5945, 'Prescription Submitted', 1, '2023-06-10 14:05:29'),
(422, 5952, 'Draft case.', 1, '2023-06-10 14:05:46'),
(423, 5952, 'Prescription Submitted', 1, '2023-06-10 14:06:29'),
(424, 5953, 'Draft case.', 1, '2023-06-10 14:06:36'),
(425, 5953, 'Prescription Submitted', 1, '2023-06-10 14:07:04'),
(426, 5956, 'Draft case.', 1, '2023-06-10 14:07:23'),
(427, 5956, 'Prescription Submitted', 1, '2023-06-10 14:07:56'),
(428, 5958, 'Draft case.', 1, '2023-06-10 14:08:20'),
(429, 5958, 'Prescription Submitted', 1, '2023-06-10 14:08:42'),
(430, 5948, 'Draft case.', 1, '2023-06-10 14:09:29'),
(431, 5948, 'Prescription Submitted', 1, '2023-06-10 14:10:18'),
(432, 5946, 'Draft case.', 1, '2023-06-10 14:10:59'),
(433, 5946, 'Prescription Submitted', 1, '2023-06-10 14:15:33'),
(434, 5949, 'Draft case.', 1, '2023-06-10 14:19:03'),
(435, 5949, 'Prescription Submitted', 1, '2023-06-10 14:21:54'),
(436, 5957, 'Draft case.', 1, '2023-06-10 14:23:11'),
(437, 5957, 'Prescription Submitted', 1, '2023-06-10 14:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `buttonText` varchar(255) NOT NULL,
  `categoryUrl` varchar(255) DEFAULT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `createdTime` datetime NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `buttonText`, `categoryUrl`, `published`, `createdTime`, `updateTime`) VALUES
(1, 'Aligner', 'Aligner', '+ Aligner<br>(Treatment)', 'newAligner', 1, '2022-11-23 15:35:34', '2023-06-01 14:05:47'),
(2, 'Retainer', 'Clear Retainers', '+ Retainer<br>(Clear 1mm Hard)', 'clearRetainer', 1, '2022-11-23 15:35:53', '2023-06-10 12:17:41'),
(3, 'Hawley', 'Hawley Retainer', '+ Hawley <br />(Retainer)', 'hawley', 1, '2023-03-18 10:31:59', '2023-04-10 06:10:51'),
(4, 'Guard', 'Mounth Guard', '+ Mouth Guard<br>(Soft 2mm)', 'guard', 1, '2023-03-18 10:31:59', '2023-06-10 12:53:21'),
(5, 'Bleach', 'Bleaching Tray', '+ Bleaching Tray <br><br>', 'bleach', 1, '2023-03-18 10:31:59', '2023-05-23 11:51:46'),
(6, 'singleZirconiaCrown', 'Single Zirconia Crown', '+ Zirconia Crown<br/>(Single)', 'singleZirconiaCrown', 1, '2023-03-18 10:31:59', '2023-03-25 18:58:51'),
(7, 'bridgeZirconiaCrown', 'Bridge Zirconia Crown', '+ Zirconia Crown<br>(Bridge)', 'bridgeZirconiaCrown', 1, '2023-03-18 10:31:59', '2023-06-01 13:58:41'),
(8, 'implantZirconiaCrownBridge', 'Implant Zirconia Crown', '+ Implant<br>Zirconia Crown (Bridge)', 'implantZirconiaCrownBridge', 1, '2023-03-18 10:31:59', '2023-06-09 16:13:01'),
(9, 'implantZirconiaCrown', 'Implant Zirconia Crown', '+ Implant<br>Zirconia Crown', 'implantZirconiaCrown', 1, '2023-03-18 10:31:59', '2023-05-23 11:53:01'),
(10, 'printingService', '3D model printing services ', '+ 3D model<br>printing services', 'printingService', 1, '2023-03-18 10:31:59', '2023-05-31 12:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `chatrooms`
--

CREATE TABLE `chatrooms` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `fromId` int(11) NOT NULL,
  `content` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `isFile` tinyint(1) NOT NULL DEFAULT 0,
  `path` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clear_retainer_stl`
--

CREATE TABLE `clear_retainer_stl` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 1,
  `count` int(11) NOT NULL DEFAULT 1,
  `stlType` int(2) NOT NULL DEFAULT 0,
  `stls1` varchar(255) DEFAULT NULL,
  `stls2` varchar(255) DEFAULT NULL,
  `stls3` varchar(255) DEFAULT NULL,
  `stls4` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clear_retainer_stl`
--

INSERT INTO `clear_retainer_stl` (`id`, `order_id`, `count`, `stlType`, `stls1`, `stls2`, `stls3`, `stls4`, `last_modified_time`) VALUES
(67, 161, 1, 0, NULL, NULL, NULL, NULL, '2023-06-01 19:43:48'),
(68, 162, 1, 2, '', '', '', '', '2023-06-01 22:18:39'),
(94, 5941, 1, 0, '/clearRetainer/Data/1686303065866.stl', '/clearRetainer/Data/1686303065909.stl', '/clearRetainer/Data/1686303065941.stl', '/clearRetainer/Data/1686303065967.stl', '2023-06-08 18:15:10'),
(95, 5935, 1, 0, '/clearRetainer/Data/1686303310385.stl', '/clearRetainer/Data/1686303310433.stl', '/clearRetainer/Data/1686303310466.stl', '/clearRetainer/Data/1686303310502.stl', '2023-06-06 19:30:26'),
(96, 5927, 1, 0, '/clearRetainer/Data/1686303529145.stl', '/clearRetainer/Data/1686303529190.stl', '/clearRetainer/Data/1686303529232.stl', '/clearRetainer/Data/1686303529281.stl', '2023-06-05 18:16:06'),
(97, 5923, 1, 0, '/clearRetainer/Data/1686303679368.stl', '/clearRetainer/Data/1686303679405.stl', '/clearRetainer/Data/1686303679439.stl', '/clearRetainer/Data/1686303679470.stl', '2023-06-03 16:31:20'),
(98, 5912, 1, 0, '/clearRetainer/Data/1686303861119.stl', '/clearRetainer/Data/1686303861172.stl', '/clearRetainer/Data/1686303861214.stl', '/clearRetainer/Data/1686303861243.stl', '2023-06-01 18:00:05'),
(99, 5911, 1, 0, '/clearRetainer/Data/1686304087904.stl', '/clearRetainer/Data/1686304087957.stl', '/clearRetainer/Data/1686304087994.stl', '/clearRetainer/Data/1686304088022.stl', '2023-06-01 12:23:10'),
(100, 5901, 1, 0, '/clearRetainer/Data/1686304267861.stl', '/clearRetainer/Data/1686304267899.stl', '/clearRetainer/Data/1686304267938.stl', '/clearRetainer/Data/1686304267974.stl', '2023-05-25 17:39:02'),
(101, 5898, 1, 0, '/clearRetainer/Data/1686304489517.stl', '/clearRetainer/Data/1686304489565.stl', '/clearRetainer/Data/1686304489612.stl', '/clearRetainer/Data/1686304489651.stl', '2023-05-25 11:47:32'),
(102, 5880, 1, 0, '/clearRetainer/Data/1686304794498.stl', '/clearRetainer/Data/1686304794541.stl', '/clearRetainer/Data/1686304794576.stl', '/clearRetainer/Data/1686304794607.stl', '2023-05-19 19:25:44'),
(103, 5875, 1, 0, '/clearRetainer/Data/1686305047928.stl', '/clearRetainer/Data/1686305047960.stl', '/clearRetainer/Data/1686305047991.stl', '/clearRetainer/Data/1686305048023.stl', '2023-05-19 11:00:51'),
(104, 5866, 1, 0, '/clearRetainer/Data/1686305656420.stl', '/clearRetainer/Data/1686305656464.stl', '/clearRetainer/Data/1686305656502.stl', '/clearRetainer/Data/1686305656533.stl', '2023-05-16 19:37:56'),
(105, 5862, 1, 0, '/clearRetainer/Data/1686305829315.stl', '/clearRetainer/Data/1686305829356.stl', '/clearRetainer/Data/1686305829393.stl', '/clearRetainer/Data/1686305829429.stl', '2023-05-16 13:40:47'),
(106, 5857, 1, 0, '/clearRetainer/Data/1686306072365.stl', '/clearRetainer/Data/1686306072401.stl', '/clearRetainer/Data/1686306072440.stl', '/clearRetainer/Data/1686306072474.stl', '2023-05-15 14:00:45'),
(107, 5853, 1, 0, '/clearRetainer/Data/1686306283225.stl', '/clearRetainer/Data/1686306283273.stl', '/clearRetainer/Data/1686306283304.stl', '/clearRetainer/Data/1686306283338.stl', '2023-05-13 14:00:51'),
(108, 5841, 1, 0, '/clearRetainer/Data/1686306479757.stl', '/clearRetainer/Data/1686306479785.stl', '/clearRetainer/Data/1686306479823.stl', '/clearRetainer/Data/1686306479851.stl', '2023-05-11 17:08:13'),
(109, 5822, 1, 0, '/clearRetainer/Data/1686306710383.stl', '/clearRetainer/Data/1686306710422.stl', '/clearRetainer/Data/1686306710453.stl', '/clearRetainer/Data/1686306710483.stl', '2023-05-06 17:54:29'),
(110, 5814, 1, 0, '/clearRetainer/Data/1686306845891.stl', '/clearRetainer/Data/1686306845933.stl', '/clearRetainer/Data/1686306845968.stl', '/clearRetainer/Data/1686306846007.stl', '2023-05-06 12:52:16'),
(111, 5813, 1, 0, '/clearRetainer/Data/1686306957118.stl', '/clearRetainer/Data/1686306957167.stl', '/clearRetainer/Data/1686306957212.stl', '/clearRetainer/Data/1686306957253.stl', '2023-05-06 12:13:41'),
(112, 5800, 1, 0, '/clearRetainer/Data/1686307045612.stl', '/clearRetainer/Data/1686307045697.stl', '/clearRetainer/Data/1686307045774.stl', '/clearRetainer/Data/1686307045814.stl', '2023-05-02 17:48:24'),
(113, 5796, 1, 0, '/clearRetainer/Data/1686307187725.stl', '/clearRetainer/Data/1686307187821.stl', '/clearRetainer/Data/1686307187932.stl', '/clearRetainer/Data/1686307188010.stl', '2023-05-02 11:38:48'),
(135, 5938, 1, 2, '', '', '', '', '2023-06-09 19:02:02'),
(136, 5931, 1, 2, '', '', '', '', '2023-06-09 19:18:07'),
(137, 5920, 1, 2, '', '', '', '', '2023-06-09 19:18:58'),
(138, 5916, 1, 2, '', '', '', '', '2023-06-09 19:19:20'),
(139, 5891, 1, 2, '', '', '', '', '2023-06-09 19:19:52'),
(140, 5890, 1, 2, '', '', '', '', '2023-06-09 19:20:27'),
(141, 5887, 1, 2, '', '', '', '', '2023-06-09 19:21:11'),
(142, 5884, 1, 2, '', '', '', '', '2023-06-09 19:21:36'),
(143, 5881, 1, 2, '', '', '', '', '2023-06-09 19:22:18'),
(144, 5879, 1, 2, '', '', '', '', '2023-06-09 19:22:39'),
(145, 5876, 1, 2, '', '', '', '', '2023-06-09 19:23:17'),
(146, 5871, 1, 2, '', '', '', '', '2023-06-09 19:23:46'),
(147, 5869, 1, 2, '', '', '', '', '2023-06-09 19:24:13'),
(148, 5849, 1, 2, '', '', '', '', '2023-06-09 19:26:07'),
(149, 5846, 1, 2, '', '', '', '', '2023-06-09 19:26:55'),
(150, 5845, 1, 2, '', '', '', '', '2023-06-09 19:27:21'),
(151, 5836, 1, 2, '', '', '', '', '2023-06-09 19:28:15'),
(152, 5830, 1, 2, '', '', '', '', '2023-06-09 19:28:48'),
(153, 5809, 1, 2, '', '', '', '', '2023-06-09 19:29:53'),
(154, 5805, 1, 2, '', '', '', '', '2023-06-09 19:50:53'),
(155, 5804, 1, 2, '', '', '', '', '2023-06-09 19:51:22'),
(157, 5921, 1, 2, '', '', '', '', '2023-06-09 20:05:30'),
(158, 5934, 1, 2, '', '', '', '', '2023-06-09 20:08:20'),
(159, 5902, 1, 2, '', '', '', '', '2023-06-09 20:12:08'),
(160, 5820, 1, 2, '', '', '', '', '2023-06-09 20:15:28'),
(161, 5812, 1, 2, '', '', '', '', '2023-06-09 20:17:34'),
(162, 1, 1, 2, NULL, NULL, NULL, NULL, '2023-06-09 21:03:49'),
(164, 5945, 1, 2, '', '', '', '', '2023-06-10 22:04:50'),
(165, 5952, 1, 2, '', '', '', '', '2023-06-10 22:05:46'),
(166, 5953, 1, 2, '', '', '', '', '2023-06-10 22:06:36'),
(167, 5956, 1, 2, '', '', '', '', '2023-06-10 22:07:23'),
(168, 5958, 1, 2, '', '', '', '', '2023-06-10 22:08:20'),
(169, 5948, 1, 2, '', '', '', '', '2023-06-10 22:09:29'),
(170, 5946, 1, 0, '/clearRetainer/Data/1686406532826.stl', '/clearRetainer/Data/1686406532911.stl', '/clearRetainer/Data/1686406533015.stl', '/clearRetainer/Data/1686406533090.stl', '2023-06-10 11:26:59'),
(171, 5949, 1, 0, '/clearRetainer/Data/1686406914457.stl', '/clearRetainer/Data/1686406914551.stl', '/clearRetainer/Data/1686406914624.stl', '/clearRetainer/Data/1686406914706.stl', '2023-06-10 12:02:03'),
(172, 5957, 1, 0, '/clearRetainer/Data/1686407129124.stl', '/clearRetainer/Data/1686407129221.stl', '/clearRetainer/Data/1686407129300.stl', '/clearRetainer/Data/1686407129364.stl', '2023-06-10 16:50:11');

-- --------------------------------------------------------

--
-- Table structure for table `customeraddress`
--

CREATE TABLE `customeraddress` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customeraddress`
--

INSERT INTO `customeraddress` (`id`, `customer_id`, `address_id`) VALUES
(1, 3, 1),
(2, 55, 3),
(3, 50, 2),
(4, 87, 6),
(56, 103, 4),
(57, 120, 5),
(58, 228, 7),
(59, 1354, 8),
(60, 17, 1184);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_access`
--

CREATE TABLE `doctor_access` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_access`
--

INSERT INTO `doctor_access` (`id`, `doctor_id`, `category_id`) VALUES
(3, 4, 1),
(4, 4, 2),
(5, 4, 3),
(29, 4, 4),
(47, 4, 5),
(46, 4, 6),
(45, 4, 7),
(43, 4, 8),
(31, 4, 9),
(44, 4, 10),
(32, 13, 9),
(7, 17, 1),
(8, 17, 2),
(30, 17, 3),
(10, 17, 4),
(11, 17, 5),
(12, 17, 6),
(13, 17, 7),
(14, 17, 8),
(33, 17, 9),
(35, 17, 10),
(34, 23, 9),
(36, 26, 1),
(38, 27, 1),
(37, 27, 2),
(39, 27, 3),
(42, 28, 2),
(40, 28, 3),
(48, 28, 4),
(49, 50, 1),
(50, 50, 2),
(51, 50, 3),
(52, 50, 4),
(53, 50, 5),
(99, 50, 10),
(54, 53, 1),
(55, 53, 2),
(56, 53, 3),
(58, 53, 4),
(57, 53, 5),
(100, 53, 10),
(59, 55, 1),
(60, 55, 2),
(61, 55, 3),
(62, 55, 4),
(63, 55, 5),
(101, 55, 10),
(64, 87, 1),
(65, 87, 2),
(66, 87, 3),
(67, 87, 4),
(68, 87, 5),
(102, 87, 10),
(69, 103, 1),
(70, 103, 2),
(71, 103, 3),
(72, 103, 4),
(73, 103, 5),
(103, 103, 10),
(74, 120, 1),
(75, 120, 2),
(76, 120, 3),
(77, 120, 4),
(78, 120, 5),
(104, 120, 10),
(79, 191, 1),
(80, 191, 2),
(81, 191, 3),
(82, 191, 4),
(83, 191, 5),
(105, 191, 10),
(84, 228, 1),
(85, 228, 2),
(86, 228, 3),
(87, 228, 4),
(88, 228, 5),
(106, 228, 10),
(89, 1118, 1),
(90, 1118, 2),
(91, 1118, 3),
(92, 1118, 4),
(93, 1118, 5),
(107, 1118, 10),
(94, 1354, 1),
(95, 1354, 2),
(96, 1354, 3),
(97, 1354, 4),
(98, 1354, 5),
(108, 1354, 10);

--
-- Triggers `doctor_access`
--
DELIMITER $$
CREATE TRIGGER `doctorAddAcess` AFTER INSERT ON `doctor_access` FOR EACH ROW INSERT INTO doctor_info_change(doctor_id,notification)
VALUES(NEW.doctor_id,CONCAT("Doctor ",(SELECT username from users where users.id=NEW.doctor_id)," gains access:",(SELECT name from category where category.id=NEW.category_id)))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `doctorLoseAccess` AFTER DELETE ON `doctor_access` FOR EACH ROW INSERT INTO doctor_info_change(doctor_id,notification)
VALUES(OLD.doctor_id,CONCAT("Doctor ",(SELECT username from users where users.id=OLD.doctor_id)," loses access:",(SELECT name from category where category.id=OLD.category_id)))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_info_change`
--

CREATE TABLE `doctor_info_change` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `notification` varchar(255) NOT NULL,
  `unread` int(11) NOT NULL DEFAULT 1,
  `create_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_info_change`
--

INSERT INTO `doctor_info_change` (`id`, `doctor_id`, `notification`, `unread`, `create_time`) VALUES
(85, 3, 'new user Dr HO registered.', 1, '2023-06-08 01:10:49'),
(86, 29, 'new user Feng Yue chao registered.', 1, '2023-06-08 01:10:49'),
(87, 7, 'User Feng Yue chao ,change information.', 1, '2023-06-08 01:11:10'),
(88, 31, 'new user  registered.', 1, '2023-06-08 01:11:29'),
(89, 50, 'User  ,change information.', 1, '2023-06-08 01:11:46'),
(90, 50, 'User  ,change information.', 1, '2023-06-08 01:11:53'),
(91, 50, 'User  ,change information.', 1, '2023-06-08 01:12:01'),
(92, 50, 'User  ,change information.', 1, '2023-06-08 01:12:05'),
(93, 50, 'User kon yiu tang ,change information.', 1, '2023-06-08 01:12:17'),
(94, 50, 'User kon yiu tang ,change information.', 1, '2023-06-08 01:12:21'),
(95, 50, 'User kon yiu tang ,change information.', 1, '2023-06-08 01:12:30'),
(96, 50, 'User kon yiu tang ,change information.', 1, '2023-06-08 01:12:41'),
(97, 50, 'User kon yiu tang ,change information.', 1, '2023-06-08 01:13:05'),
(98, 53, 'new user rtrte gfdgdgd registered.', 1, '2023-06-08 01:17:51'),
(99, 54, 'new user Shao Stephanie registered.', 1, '2023-06-08 01:20:13'),
(100, 54, 'User Shao Stephanie ,change information.', 1, '2023-06-08 01:20:44'),
(101, 54, 'User Shao Stephanie ,change information.', 1, '2023-06-08 01:21:14'),
(102, 55, 'new user Chan Fat Shung registered.', 1, '2023-06-08 01:24:07'),
(103, 87, 'User Chan Fat Shung ,change information.', 1, '2023-06-08 01:24:34'),
(104, 55, 'User Shao Stephanie ,change information.', 1, '2023-06-08 01:30:15'),
(105, 103, 'new user Wong Hung Leung registered.', 1, '2023-06-08 01:32:20'),
(106, 120, 'new user Chan Ming Chak Calvin registered.', 1, '2023-06-08 01:33:38'),
(107, 228, 'new user Chan Ming Chak Calvin registered.', 1, '2023-06-08 01:35:59'),
(108, 228, 'User Chan Ming Chak Calvin ,change information.', 1, '2023-06-08 01:36:46'),
(109, 228, 'User Chi Hong Ng ,change information.', 1, '2023-06-08 01:36:50'),
(110, 228, 'User Chi Hong Ng ,change information.', 1, '2023-06-08 01:37:01'),
(111, 191, 'new user Sze Van Flora, Lam registered.', 1, '2023-06-08 01:39:56'),
(112, 1118, 'new user Sandy, Chen registered.', 1, '2023-06-08 01:39:56'),
(113, 1354, 'new user Hon Wing Kwok registered.', 1, '2023-06-08 01:40:56'),
(114, 2, 'new user technician Pang registered.', 1, '2023-06-08 01:53:54'),
(115, 50, 'Doctor kon yiu tang gains access:Aligner', 1, '2023-06-09 16:44:54'),
(116, 50, 'Doctor kon yiu tang gains access:Retainer', 1, '2023-06-09 16:44:58'),
(117, 50, 'Doctor kon yiu tang gains access:Hawley', 1, '2023-06-09 16:45:10'),
(118, 50, 'Doctor kon yiu tang gains access:Guard', 1, '2023-06-09 16:45:13'),
(119, 50, 'Doctor kon yiu tang gains access:Bleach', 1, '2023-06-09 16:45:15'),
(120, 53, 'Doctor rtrte gfdgdgd gains access:Aligner', 1, '2023-06-09 16:45:21'),
(121, 53, 'Doctor rtrte gfdgdgd gains access:Retainer', 1, '2023-06-09 16:45:24'),
(122, 53, 'Doctor rtrte gfdgdgd gains access:Hawley', 1, '2023-06-09 16:45:26'),
(123, 53, 'Doctor rtrte gfdgdgd gains access:Bleach', 1, '2023-06-09 16:45:29'),
(124, 53, 'Doctor rtrte gfdgdgd gains access:Guard', 1, '2023-06-09 16:48:33'),
(125, 55, 'Doctor Shao Stephanie gains access:Aligner', 1, '2023-06-09 16:49:22'),
(126, 55, 'Doctor Shao Stephanie gains access:Retainer', 1, '2023-06-09 16:49:24'),
(127, 55, 'Doctor Shao Stephanie gains access:Hawley', 1, '2023-06-09 16:49:27'),
(128, 55, 'Doctor Shao Stephanie gains access:Guard', 1, '2023-06-09 16:49:30'),
(129, 55, 'Doctor Shao Stephanie gains access:Bleach', 1, '2023-06-09 16:49:33'),
(130, 87, 'Doctor Chan Fat Shung gains access:Aligner', 1, '2023-06-09 16:49:36'),
(131, 87, 'Doctor Chan Fat Shung gains access:Retainer', 1, '2023-06-09 16:49:38'),
(132, 87, 'Doctor Chan Fat Shung gains access:Hawley', 1, '2023-06-09 16:49:40'),
(133, 87, 'Doctor Chan Fat Shung gains access:Guard', 1, '2023-06-09 16:49:43'),
(134, 87, 'Doctor Chan Fat Shung gains access:Bleach', 1, '2023-06-09 16:49:46'),
(135, 103, 'Doctor Wong Hung Leung gains access:Aligner', 1, '2023-06-09 16:49:51'),
(136, 103, 'Doctor Wong Hung Leung gains access:Retainer', 1, '2023-06-09 16:49:53'),
(137, 103, 'Doctor Wong Hung Leung gains access:Hawley', 1, '2023-06-09 16:49:56'),
(138, 103, 'Doctor Wong Hung Leung gains access:Guard', 1, '2023-06-09 16:49:58'),
(139, 103, 'Doctor Wong Hung Leung gains access:Bleach', 1, '2023-06-09 16:50:01'),
(140, 120, 'Doctor Chan Ming Chak Calvin gains access:Aligner', 1, '2023-06-09 16:50:03'),
(141, 120, 'Doctor Chan Ming Chak Calvin gains access:Retainer', 1, '2023-06-09 16:50:05'),
(142, 120, 'Doctor Chan Ming Chak Calvin gains access:Hawley', 1, '2023-06-09 16:50:08'),
(143, 120, 'Doctor Chan Ming Chak Calvin gains access:Guard', 1, '2023-06-09 16:50:11'),
(144, 120, 'Doctor Chan Ming Chak Calvin gains access:Bleach', 1, '2023-06-09 16:50:14'),
(145, 191, 'Doctor Sze Van Flora, Lam gains access:Aligner', 1, '2023-06-09 16:50:16'),
(146, 191, 'Doctor Sze Van Flora, Lam gains access:Retainer', 1, '2023-06-09 16:50:18'),
(147, 191, 'Doctor Sze Van Flora, Lam gains access:Hawley', 1, '2023-06-09 16:50:20'),
(148, 191, 'Doctor Sze Van Flora, Lam gains access:Guard', 1, '2023-06-09 16:50:22'),
(149, 191, 'Doctor Sze Van Flora, Lam gains access:Bleach', 1, '2023-06-09 16:50:25'),
(150, 228, 'Doctor Chi Hong Ng gains access:Aligner', 1, '2023-06-09 16:50:27'),
(151, 228, 'Doctor Chi Hong Ng gains access:Retainer', 1, '2023-06-09 16:50:29'),
(152, 228, 'Doctor Chi Hong Ng gains access:Hawley', 1, '2023-06-09 16:50:32'),
(153, 228, 'Doctor Chi Hong Ng gains access:Guard', 1, '2023-06-09 16:50:34'),
(154, 228, 'Doctor Chi Hong Ng gains access:Bleach', 1, '2023-06-09 16:50:37'),
(155, 1118, 'Doctor Sandy, Chen gains access:Aligner', 1, '2023-06-09 16:50:39'),
(156, 1118, 'Doctor Sandy, Chen gains access:Retainer', 1, '2023-06-09 16:50:42'),
(157, 1118, 'Doctor Sandy, Chen gains access:Hawley', 1, '2023-06-09 16:50:44'),
(158, 1118, 'Doctor Sandy, Chen gains access:Guard', 1, '2023-06-09 16:50:47'),
(159, 1118, 'Doctor Sandy, Chen gains access:Bleach', 1, '2023-06-09 16:50:51'),
(160, 1354, 'Doctor Hon Wing Kwok gains access:Aligner', 1, '2023-06-09 16:50:53'),
(161, 1354, 'Doctor Hon Wing Kwok gains access:Retainer', 1, '2023-06-09 16:50:56'),
(162, 1354, 'Doctor Hon Wing Kwok gains access:Hawley', 1, '2023-06-09 16:50:58'),
(163, 1354, 'Doctor Hon Wing Kwok gains access:Guard', 1, '2023-06-09 16:51:00'),
(164, 1354, 'Doctor Hon Wing Kwok gains access:Bleach', 1, '2023-06-09 16:51:02'),
(165, 50, 'Doctor kon yiu tang gains access:printingService', 1, '2023-06-09 16:51:13'),
(166, 53, 'Doctor rtrte gfdgdgd gains access:printingService', 1, '2023-06-09 16:51:15'),
(167, 55, 'Doctor Shao Stephanie gains access:printingService', 1, '2023-06-09 16:51:17'),
(168, 87, 'Doctor Chan Fat Shung gains access:printingService', 1, '2023-06-09 16:51:20'),
(169, 103, 'Doctor Wong Hung Leung gains access:printingService', 1, '2023-06-09 16:51:25'),
(170, 120, 'Doctor Chan Ming Chak Calvin gains access:printingService', 1, '2023-06-09 16:51:28'),
(171, 191, 'Doctor Sze Van Flora, Lam gains access:printingService', 1, '2023-06-09 16:51:29'),
(172, 228, 'Doctor Chi Hong Ng gains access:printingService', 1, '2023-06-09 16:51:31'),
(173, 1118, 'Doctor Sandy, Chen gains access:printingService', 1, '2023-06-09 16:51:33'),
(174, 1354, 'Doctor Hon Wing Kwok gains access:printingService', 1, '2023-06-09 16:51:34'),
(175, 55, 'User Stephanie Shao ,change information.', 1, '2023-06-09 18:43:43'),
(176, 87, 'User Fat Shung Chan ,change information.', 1, '2023-06-09 20:11:37'),
(177, 4, 'User admin ,change information.', 1, '2023-06-09 20:24:41'),
(178, 4, 'User admin ,change information.', 1, '2023-06-09 20:24:44'),
(179, 4, 'User admin ,change information.', 1, '2023-06-09 20:25:40'),
(180, 4, 'User admin ,change information.', 1, '2023-06-09 20:26:09'),
(181, 5, 'new user tony du registered.', 1, '2023-06-09 21:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `event` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event`) VALUES
(0, 'Case Draft'),
(1, 'Prescription Submitted'),
(2, 'Awaiting More records'),
(3, 'Confirmed All Materials Received'),
(4, 'Treatment Plan Change Request Received'),
(5, 'Treatment Plan Complete'),
(6, 'Treatment Plan Awaiting Review From Distributor'),
(7, 'Production In Progress'),
(8, 'Aligners Set Despatched'),
(9, 'Refinements Prescription Received'),
(10, 'Dispatched'),
(11, 'Finished'),
(12, 'Treatmentplan Approved');

-- --------------------------------------------------------

--
-- Table structure for table `guard_stl`
--

CREATE TABLE `guard_stl` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 1,
  `count` int(11) NOT NULL DEFAULT 1,
  `stlType` int(2) NOT NULL DEFAULT 0,
  `stls1` varchar(255) DEFAULT NULL,
  `stls2` varchar(255) DEFAULT NULL,
  `stls3` varchar(255) DEFAULT NULL,
  `stls4` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hawley_stl`
--

CREATE TABLE `hawley_stl` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 1,
  `count` int(11) NOT NULL DEFAULT 1,
  `stlType` int(2) NOT NULL DEFAULT 0,
  `stls1` varchar(255) DEFAULT NULL,
  `stls2` varchar(255) DEFAULT NULL,
  `stls3` varchar(255) DEFAULT NULL,
  `stls4` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `customer_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `complete_time` datetime DEFAULT NULL,
  `draft_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `order_status`, `customer_id`, `patient_id`, `category_id`, `address_id`, `recipient`, `phone`, `fax`, `complete_time`, `draft_time`) VALUES
(1, 1, 17, 1, 2, 3, NULL, '', NULL, '2023-05-02 17:12:43', '2023-05-02 17:12:43'),
(5796, 1, 55, 171, 2, 3, NULL, '', NULL, '2023-05-02 17:12:43', '2023-05-02 17:12:43'),
(5800, 1, 55, 172, 2, 3, NULL, '', NULL, '2023-05-02 17:13:02', '2023-05-02 17:13:02'),
(5804, 1, 50, 192, 2, 2, NULL, '', NULL, '2023-05-03 18:44:55', '2023-05-03 18:44:55'),
(5805, 1, 50, 193, 2, 2, NULL, '', NULL, '2023-05-03 18:44:56', '2023-05-03 18:44:56'),
(5809, 1, 50, 194, 2, 2, '', '', '', '2023-05-05 18:44:57', '2023-05-05 18:44:57'),
(5812, 1, 87, 218, 2, 6, NULL, '', NULL, '2023-05-05 20:17:52', '2023-05-05 20:17:34'),
(5813, 1, 55, 173, 2, 3, NULL, '', NULL, '2023-05-06 17:13:03', '2023-05-06 17:13:03'),
(5814, 1, 55, 174, 2, 3, NULL, '', NULL, '2023-05-06 17:13:03', '2023-05-06 17:13:03'),
(5820, 1, 87, 217, 2, 6, NULL, '', NULL, '2023-05-06 20:15:51', '2023-05-06 20:15:28'),
(5821, 1, 228, 215, 2, 7, NULL, '', NULL, '2023-05-06 20:08:40', '2023-05-06 20:08:20'),
(5822, 1, 55, 175, 2, 3, NULL, '', NULL, '2023-05-06 17:13:04', '2023-05-06 17:13:04'),
(5830, 1, 50, 195, 2, 2, NULL, '', NULL, '2023-05-10 18:44:58', '2023-05-10 18:44:58'),
(5836, 1, 50, 196, 2, 2, NULL, '', NULL, '2023-05-11 18:44:58', '2023-05-11 18:44:58'),
(5841, 1, 55, 176, 2, 3, NULL, '', NULL, '2023-05-11 17:13:04', '2023-05-11 17:13:04'),
(5845, 1, 50, 197, 2, 2, NULL, '', NULL, '2023-05-12 18:44:59', '2023-05-12 18:44:59'),
(5846, 1, 50, 198, 2, 2, NULL, '', NULL, '2023-05-12 18:44:59', '2023-05-12 18:44:59'),
(5849, 1, 50, 199, 2, 2, NULL, '', NULL, '2023-05-12 18:45:00', '2023-05-12 18:45:00'),
(5853, 1, 55, 177, 2, 3, NULL, '', NULL, '2023-05-13 17:13:05', '2023-05-13 17:13:05'),
(5857, 1, 55, 178, 2, 3, NULL, '', NULL, '2023-05-15 17:13:05', '2023-05-15 17:13:05'),
(5858, 1, 228, 214, 2, 7, NULL, '', NULL, '2023-05-15 20:05:56', '2023-05-15 20:05:30'),
(5862, 1, 55, 179, 2, 3, NULL, '', NULL, '2023-05-16 17:13:06', '2023-05-16 17:13:06'),
(5866, 1, 55, 180, 2, 3, NULL, '', NULL, '2023-05-16 17:13:06', '2023-05-16 17:13:06'),
(5869, 1, 50, 200, 2, 2, NULL, '', NULL, '2023-05-17 18:45:01', '2023-05-17 18:45:01'),
(5871, 1, 50, 201, 2, 2, NULL, '', NULL, '2023-05-17 18:45:01', '2023-05-17 18:45:01'),
(5875, 1, 55, 181, 2, 3, NULL, '', NULL, '2023-05-19 17:13:07', '2023-05-19 17:13:07'),
(5876, 1, 50, 202, 2, 2, NULL, '', NULL, '2023-05-19 18:45:02', '2023-05-19 18:45:02'),
(5879, 1, 50, 203, 2, 2, NULL, '', NULL, '2023-05-19 18:45:02', '2023-05-19 18:45:02'),
(5880, 1, 55, 182, 2, 3, NULL, '', NULL, '2023-05-19 17:13:08', '2023-05-19 17:13:08'),
(5881, 1, 50, 204, 2, 2, NULL, '', NULL, '2023-05-20 18:45:03', '2023-05-20 18:45:03'),
(5884, 1, 50, 205, 2, 2, NULL, '', NULL, '2023-05-20 18:45:03', '2023-05-20 18:45:03'),
(5887, 1, 50, 206, 2, 2, NULL, '', NULL, '2023-05-22 18:45:04', '2023-05-22 18:45:04'),
(5890, 1, 50, 207, 2, 2, NULL, '', NULL, '2023-05-23 18:45:04', '2023-05-23 18:45:04'),
(5891, 1, 50, 208, 2, 2, NULL, '', NULL, '2023-05-23 18:45:05', '2023-05-23 18:45:05'),
(5898, 1, 55, 183, 2, 3, NULL, '', NULL, '2023-05-25 17:13:08', '2023-05-25 17:13:08'),
(5901, 1, 55, 184, 2, 3, NULL, '', NULL, '2023-05-25 17:13:09', '2023-05-25 17:13:09'),
(5902, 1, 87, 216, 2, 6, NULL, '', NULL, '2023-05-25 20:12:36', '2023-05-25 20:12:08'),
(5911, 1, 55, 185, 2, 3, NULL, '', NULL, '2023-06-01 17:13:09', '2023-06-01 17:13:09'),
(5912, 1, 55, 186, 2, 3, NULL, '', NULL, '2023-06-01 17:13:10', '2023-06-01 17:13:10'),
(5916, 1, 50, 209, 2, 2, NULL, '', NULL, '2023-06-02 18:45:05', '2023-06-02 18:45:05'),
(5920, 1, 50, 210, 2, 2, NULL, '', NULL, '2023-06-02 18:45:06', '2023-06-02 18:45:06'),
(5923, 1, 55, 187, 2, 3, NULL, '', NULL, '2023-06-03 17:13:10', '2023-06-03 17:13:10'),
(5927, 1, 55, 188, 2, 3, NULL, '', NULL, '2023-06-05 17:13:11', '2023-06-05 17:13:11'),
(5931, 1, 50, 211, 2, 2, NULL, '', NULL, '2023-06-06 18:45:06', '2023-06-06 18:45:06'),
(5934, 1, 228, 213, 2, 7, NULL, '', NULL, '2023-06-06 20:00:38', '2023-06-06 20:00:14'),
(5935, 1, 55, 189, 2, 3, NULL, '', NULL, '2023-06-06 17:13:11', '2023-06-06 17:13:11'),
(5938, 1, 50, 212, 2, 2, NULL, '', NULL, '2023-06-07 18:45:07', '2023-06-07 18:45:07'),
(5941, 1, 55, 190, 2, 3, NULL, '', NULL, '2023-06-08 17:13:12', '2023-06-08 17:13:12'),
(5945, 1, 50, 231, 2, 2, NULL, '', NULL, '2023-06-10 22:05:29', '2023-06-10 22:04:50'),
(5946, 1, 55, 237, 2, 3, NULL, '', NULL, '2023-06-10 22:15:33', '2023-06-10 22:10:59'),
(5948, 1, 228, 236, 2, 7, NULL, '', NULL, '2023-06-10 22:10:18', '2023-06-10 22:09:29'),
(5949, 1, 55, 238, 2, 3, NULL, '', NULL, '2023-06-10 22:21:54', '2023-06-10 22:19:03'),
(5952, 1, 50, 232, 2, 2, NULL, '', NULL, '2023-06-10 22:06:29', '2023-06-10 22:05:46'),
(5953, 1, 50, 233, 2, 2, NULL, '', NULL, '2023-06-10 22:07:04', '2023-06-10 22:06:36'),
(5956, 1, 50, 234, 2, 2, NULL, '', NULL, '2023-06-10 22:07:56', '2023-06-10 22:07:23'),
(5957, 1, 55, 239, 2, 3, NULL, '', NULL, '2023-06-10 22:25:29', '2023-06-10 22:23:11'),
(5958, 1, 50, 235, 2, 2, NULL, '', NULL, '2023-06-10 22:08:42', '2023-06-10 22:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `patient_info`
--

CREATE TABLE `patient_info` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_image_path` varchar(255) NOT NULL DEFAULT '/img/default/defaultAvator.jpeg',
  `patient_gender` char(255) NOT NULL DEFAULT 'Male',
  `birthday` date DEFAULT NULL,
  `remarks` varchar(2047) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_info`
--

INSERT INTO `patient_info` (`id`, `patient_name`, `patient_image_path`, `patient_gender`, `birthday`, `remarks`) VALUES
(1, 'test patient', '/img/default/smile.gif', 'Female', '1992-04-07', 'CLEAR X1'),
(169, ' LAM HIO WAI', '/img/default/smile.gif', 'Female', '1992-04-07', 'CLEAR X1'),
(170, NULL, '/img/default/smile.gif', '', NULL, NULL),
(171, 'LI CHUN YIN', '/img/default/smile.gif', 'Female', '1997-10-26', 'CLAER x2 pair'),
(172, 'MA SO TING', '/img/default/smile.gif', 'Female', '1997-12-19', 'CLEAR X2 PAIR'),
(173, 'LAM YING LEE AMBER', '/img/default/smile.gif', 'Female', '2009-10-19', 'UPPER X1'),
(174, 'HO PO YAN', '/img/default/smile.gif', 'Female', '1996-06-28', 'CLEAR X2 PAIR'),
(175, 'CHAN CHING YEE', '/img/default/smile.gif', 'Female', '2001-07-02', 'CLEAR X2 PAIR'),
(176, 'YIP WUI WA', '/img/default/smile.gif', 'Female', '2000-04-21', 'CLEAR X1 PAIR'),
(177, 'SUM WING HEI', '/img/default/smile.gif', 'Female', '2007-03-16', 'CLEAR X1 PAIR'),
(178, 'LEUNG HAU YEE', '/img/default/smile.gif', 'Female', '1971-04-30', 'CLEAR UPPER X1'),
(179, 'TONG LING YIU', '/img/default/smile.gif', 'Female', '1991-07-29', 'CLEAR X1 PAIR'),
(180, 'MOK WING YEE', '/img/default/smile.gif', 'Female', '1996-05-27', 'CLEAR X1 PAIR'),
(181, 'Yiu Chau Yu', '/img/default/smile.gif', 'Female', '1995-10-10', 'Clear x1 pair'),
(182, 'LAU SIU FUNG', '/img/default/smile.gif', 'Male', '2008-11-05', 'CLEAR X1 PAIR'),
(183, 'GONG QINGQING', '/img/default/smile.gif', 'Female', '1988-12-06', 'CLEAR UPPER X1'),
(184, 'wong yuen yu', '/img/default/smile.gif', 'Female', '2006-03-01', 'clear x 1 pair'),
(185, 'CHAN WING DIAN', '/img/default/smile.gif', 'Female', '1997-04-21', 'CLEAR X1 PAIR'),
(186, 'CHAN WING DIAN', '/img/default/smile.gif', 'Female', '1997-04-21', 'CLEAR X1 PAIR'),
(187, 'LAM PUI LING', '/img/default/smile.gif', 'Female', '1980-10-28', 'CLEAR X1 PAIR'),
(188, 'CHAN PING YAN', '/img/default/smile.gif', 'Female', '2000-12-24', 'CLEAR X1'),
(189, 'LAM HIO WAI', '/img/default/smile.gif', 'Female', '1992-04-07', 'CLEAR X1 PAIR'),
(190, 'KONG SHING YAN', '/img/default/smile.gif', 'Female', '1995-11-07', 'CLEAR X1'),
(191, NULL, '/img/default/smile.gif', '', NULL, NULL),
(192, 'LUI SUM YI', '/img/default/smile.gif', 'Female', '2001-03-20', 'total 1 set'),
(193, 'CHAN KAREN KA LAM', '/img/default/smile.gif', 'Female', '1987-10-20', 'total 1 set'),
(194, 'KWOK CHEUK KWAN CAROL', '/img/default/smile.gif', 'Female', '2001-12-04', 'total 1 set'),
(195, 'leung ka wing', '/img/default/smile.gif', 'Female', '1995-12-15', '1 set 15/05 back'),
(196, 'TSOI YAN SIN', '/img/default/smile.gif', 'Female', '1996-10-30', 'total 3 set'),
(197, 'XING HOI MEI', '/img/default/smile.gif', 'Female', '2005-03-18', '1 set 18/05 send back'),
(198, 'tang po yi', '/img/default/smile.gif', 'Female', '2004-03-07', '1 set 17/05 back'),
(199, 'SHUM CHUN WAI', '/img/default/smile.gif', 'Male', '1997-04-09', 'TOTAL 1 SET DELIVER 17/5'),
(200, 'WONG OI FONG', '/img/default/smile.gif', 'Female', '1988-10-28', 'total 1 set deliver at 22/5 thanks'),
(201, 'SUEN PUI MAN', '/img/default/smile.gif', 'Female', '1995-04-04', 'total 1 set ,deliver at 22/5,thanks'),
(202, 'CHAN YUEN TON', '/img/default/smile.gif', 'Female', '2005-07-16', 'TOTAL 1 SET 24 /05 BACK'),
(203, 'YUEN SUM YAU', '/img/default/smile.gif', 'Female', '1999-06-23', 'TOTAL 1 SET 24/5返 THANKS'),
(204, 'LEUNG TSZ YAN', '/img/default/smile.gif', 'Female', '2007-12-28', 'total 1 set deliver at 24/5 thanks'),
(205, 'CHEUNG HAU MAN', '/img/default/smile.gif', 'Female', '1997-06-22', 'total 1 set 25/5 返thanks'),
(206, 'YIM TSZ YAN', '/img/default/smile.gif', 'Female', '1992-06-18', 'TOTAL 1 SET 27/5 返 THANKS'),
(207, 'CHAN HIU LAAM', '/img/default/smile.gif', 'Female', '1990-07-26', 'total 1 lower only deliver at 27/5 thanks'),
(208, 'WONG WING YING', '/img/default/smile.gif', 'Female', '2008-09-11', 'TOTAL 1 STE DELIVER AT 27/5 THANKS'),
(209, 'LAI PO KEI', '/img/default/smile.gif', 'Female', '2008-11-14', 'retainer x1, 07/06morning send back'),
(210, 'CHAN HOI YAN VANDORA', '/img/default/smile.gif', 'Female', '1990-08-03', 'retainer send back 14/06'),
(211, 'LEUNG PIK TUNG', '/img/default/smile.gif', 'Female', '1998-03-13', 'total 1 set 10/6 返'),
(212, 'MAK SZE TING', '/img/default/smile.gif', 'Female', '1994-01-25', 'total 1 set'),
(213, 'Tsoi Yan Tung', '/img/default/smile.gif', 'Female', '2000-10-06', '只要1 Set Retainer'),
(214, 'Liu Wing Ming', '/img/default/smile.gif', 'Female', '2003-02-26', '只要 1 Set Retainer'),
(215, 'Kogi Poon Hei Yau', '/img/default/smile.gif', 'Female', '2007-11-06', '只要 1 Set Retainer'),
(216, 'Sin Ching Fung', '/img/default/smile.gif', 'Male', '1998-05-15', 'U/L Essix retainer x2'),
(217, 'Das Aranya', '/img/default/smile.gif', 'Male', '2010-07-23', 'Lower Essix retainer x2'),
(218, 'Lam Ting Ting', '/img/default/smile.gif', 'Female', '1990-02-12', 'Upper Essix retainer x2'),
(231, 'MA JASMINE WHITNEY', '/img/default/smile.gif', 'Male', '1997-01-27', '1 SET 16/06 SEND BACK'),
(232, 'CHEUNG MUNG TING', '/img/default/smile.gif', 'Female', '1993-10-28', 'TOTAL: 1SET RETAINER'),
(233, 'LAM HO YAN', '/img/default/smile.gif', 'Female', '1998-01-31', '1 SET 17/06 BACK'),
(234, 'NG KA YEE', '/img/default/smile.gif', 'Female', '1983-10-04', '1 SET 16/06 BACK'),
(235, 'HO HIU WAI', '/img/default/smile.gif', 'Female', '1994-01-31', '1 SET 16/06 BACK'),
(236, 'Tang Yuet Mei', '/img/default/smile.gif', 'Female', '1985-01-13', '只要1 SET RETAINER'),
(237, 'LO KA YIU PANDORA', '/img/default/smile.gif', 'Female', '1994-08-11', 'CLEAR X1 PAIR'),
(238, 'LI CHI WA', '/img/default/smile.gif', 'Male', '1985-09-05', 'CLEAR X1 PAIR'),
(239, 'CHIU HEI TUNG', '/img/default/smile.gif', 'Female', '2010-02-10', 'CLEAR X2 PAIR');

-- --------------------------------------------------------

--
-- Table structure for table `printingservice_stl`
--

CREATE TABLE `printingservice_stl` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 1,
  `count` int(11) NOT NULL DEFAULT 1,
  `stlType` int(2) NOT NULL DEFAULT 0,
  `stls1` varchar(255) DEFAULT NULL,
  `stls2` varchar(255) DEFAULT NULL,
  `stls3` varchar(255) DEFAULT NULL,
  `stls4` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleid` int(11) NOT NULL,
  `rolename` char(255) NOT NULL DEFAULT 'guest'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleid`, `rolename`) VALUES
(1, 'admin'),
(2, 'technician'),
(3, 'doctor');

-- --------------------------------------------------------

--
-- Table structure for table `standard_aligner_photo`
--

CREATE TABLE `standard_aligner_photo` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 1,
  `count` int(11) NOT NULL DEFAULT 1,
  `photoType` int(2) NOT NULL DEFAULT 0,
  `images1` varchar(255) DEFAULT NULL,
  `images2` varchar(255) DEFAULT NULL,
  `images3` varchar(255) DEFAULT NULL,
  `images4` varchar(255) DEFAULT NULL,
  `images5` varchar(255) DEFAULT NULL,
  `images6` varchar(255) DEFAULT NULL,
  `images7` varchar(255) DEFAULT NULL,
  `images8` varchar(255) DEFAULT NULL,
  `images9` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standard_aligner_question`
--

CREATE TABLE `standard_aligner_question` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `Q0` int(2) NOT NULL DEFAULT 3,
  `Q1` int(2) NOT NULL DEFAULT 1,
  `Q2` int(2) NOT NULL DEFAULT 1,
  `Q3` int(2) NOT NULL DEFAULT 1,
  `Q4` int(2) NOT NULL DEFAULT 1,
  `Q5` int(2) NOT NULL DEFAULT 1,
  `Q6` int(2) NOT NULL DEFAULT 1,
  `Q7` int(2) NOT NULL DEFAULT 1,
  `Q8` int(2) NOT NULL DEFAULT 1,
  `Q9` int(2) NOT NULL DEFAULT 1,
  `Q10` int(2) NOT NULL DEFAULT 1,
  `Q11` int(2) NOT NULL DEFAULT 1,
  `Q12` int(2) NOT NULL DEFAULT 1,
  `Q13` int(2) NOT NULL DEFAULT 1,
  `3_18` tinyint(1) NOT NULL DEFAULT 0,
  `3_17` tinyint(1) NOT NULL DEFAULT 0,
  `3_16` tinyint(1) NOT NULL DEFAULT 0,
  `3_15` tinyint(1) NOT NULL DEFAULT 0,
  `3_14` tinyint(1) NOT NULL DEFAULT 0,
  `3_13` tinyint(1) NOT NULL DEFAULT 0,
  `3_12` tinyint(1) NOT NULL DEFAULT 0,
  `3_11` tinyint(1) NOT NULL DEFAULT 0,
  `3_21` tinyint(1) NOT NULL DEFAULT 0,
  `3_22` tinyint(1) NOT NULL DEFAULT 0,
  `3_23` tinyint(1) NOT NULL DEFAULT 0,
  `3_24` tinyint(1) NOT NULL DEFAULT 0,
  `3_25` tinyint(1) NOT NULL DEFAULT 0,
  `3_26` tinyint(1) NOT NULL DEFAULT 0,
  `3_27` tinyint(1) NOT NULL DEFAULT 0,
  `3_28` tinyint(1) NOT NULL DEFAULT 0,
  `3_48` tinyint(1) NOT NULL DEFAULT 0,
  `3_47` tinyint(1) NOT NULL DEFAULT 0,
  `3_46` tinyint(1) NOT NULL DEFAULT 0,
  `3_45` tinyint(1) NOT NULL DEFAULT 0,
  `3_44` tinyint(1) NOT NULL DEFAULT 0,
  `3_43` tinyint(1) NOT NULL DEFAULT 0,
  `3_42` tinyint(1) NOT NULL DEFAULT 0,
  `3_41` tinyint(1) NOT NULL DEFAULT 0,
  `3_31` tinyint(1) NOT NULL DEFAULT 0,
  `3_32` tinyint(1) NOT NULL DEFAULT 0,
  `3_33` tinyint(1) NOT NULL DEFAULT 0,
  `3_34` tinyint(1) NOT NULL DEFAULT 0,
  `3_35` tinyint(1) NOT NULL DEFAULT 0,
  `3_36` tinyint(1) NOT NULL DEFAULT 0,
  `3_37` tinyint(1) NOT NULL DEFAULT 0,
  `3_38` tinyint(1) NOT NULL DEFAULT 0,
  `7_1` tinyint(1) NOT NULL DEFAULT 0,
  `ttbe` varchar(1023) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standard_aligner_radiograph`
--

CREATE TABLE `standard_aligner_radiograph` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 1,
  `count` int(11) NOT NULL DEFAULT 1,
  `radiographType` int(2) NOT NULL DEFAULT 0,
  `radiographs1` varchar(255) DEFAULT NULL,
  `radiographs2` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standard_aligner_stl`
--

CREATE TABLE `standard_aligner_stl` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 1,
  `count` int(11) NOT NULL DEFAULT 1,
  `stlType` int(2) NOT NULL DEFAULT 0,
  `stls1` varchar(255) DEFAULT NULL,
  `stls2` varchar(255) DEFAULT NULL,
  `stls3` varchar(255) DEFAULT NULL,
  `stls4` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `standard_aligner_treatmentplan`
--

CREATE TABLE `standard_aligner_treatmentplan` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 1,
  `count` int(11) NOT NULL DEFAULT 1,
  `treatmentplan` varchar(255) DEFAULT NULL,
  `model_link` varchar(511) DEFAULT NULL,
  `isApproved` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `passwordSalt` varchar(255) DEFAULT NULL,
  `roleid` int(11) NOT NULL DEFAULT 3,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `createDate` datetime NOT NULL DEFAULT current_timestamp(),
  `gender` char(255) DEFAULT NULL,
  `clinicName` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `passwordSalt`, `roleid`, `active`, `createDate`, `gender`, `clinicName`, `phone`) VALUES
(2, 'technician Pang', 'Jonahe320@gmail.com', '2EE265DCE1889FC538E2FFF42D5A2EA88F349FA1', 'e4NfADs=', 2, 1, '2021-11-13 03:48:24', 'Male', '', '64395516'),
(3, 'Dr HO', 'premiumaligner@gmail.com', 'CC04DA1AC1707CBC6E3AC2FCC5ADAB7BF1DE5B94', 'yHHb7Ws=', 3, 1, '2021-11-13 02:53:37', 'Male', '', '62882327'),
(4, 'admin', 'admin@admin.com', '$2a$10$xAFfIQ1R20oEuEodwkuE1.4mXnuYDVzjbSwV/k1VwZ2sxm7IdPqqa', '', 1, 1, '2022-11-21 00:00:00', 'Male', 'admin clinic', '12345678'),
(5, 'tony du', 'east.ddh@gmail.com', '058A52B8C069411739A536F773B59E3DC0B7C140', 'p1Hl9i0=', 2, 1, '2021-11-13 03:48:24', 'Male', '', '64395516'),
(7, 'Feng Yue chao', '455709741@qq.com', 'FB7965B572B2DDB4F79B04355968F3527743F38C', 'GrShGs0=', 3, 1, '2021-11-26 10:24:30', 'Female', '', NULL),
(13, 'tech', 'dduaa@ust.hk', '$2a$10$wE8Q1TLakyiiIm.cingt7eqyWZTfkM5l1SoKs/8OVdSJccVFXyiv6', NULL, 2, 1, '2022-11-21 00:00:00', 'Male', '', '12345678'),
(17, 'testdoctor', 'testdoctor@ust.hk', '$2a$10$c1cIyQ0h71o9Q9oeWACCbOxtg8LIKST6TGr9AzZzig8WB28QtFbe2', NULL, 3, 1, '2022-11-25 00:00:00', 'Male', 'my clinic', '852-12345648'),
(50, 'kon yiu tang', 'drtangky@hotmail.com', '016C98810D42C46F4211513D49AC8117CD93C0F5', 'Q/fLGz0=', 3, 1, '2022-02-12 10:02:56', 'Male', '', '23856881'),
(53, 'rtrte gfdgdgd', 'retrer@125.com', 'D20D94236EDAC4DD5B33779848501886E4526F04', '/nGuNkk=', 3, 1, '2022-02-13 08:00:32', 'Male', '', NULL),
(55, 'Stephanie Shao', 'glorydental.hk@gmail.com', '3EAF5B2AF55A3F632342E732294B25378818D9C7', '4mZIEZ8=', 3, 1, '2022-02-14 07:04:48', 'Female', '', '36110077'),
(87, 'Fat Shung Chan', 'terrencechan1992@hotmail.com', 'EAEC65390153527C304A69EFC41300D0C52C690B', 'WZ44kPM=', 3, 1, '2022-02-26 05:13:11', 'Male', '', '27445870'),
(103, 'Wong Hung Leung', 'drwongdentalclinic@gmail.com', '77665198627C617DC77558EC04631E7D45D9EDBD', 'DmJRSRs=', 3, 1, '2022-03-07 08:12:23', 'Male', '', '23818434'),
(120, 'Chan Ming Chak Calvin', 'drmcchandentalclinic@gmail.com', '423ADF399311BFC7E43732A260D95D8CD85C32FC', 'N0A/3bY=', 3, 1, '2022-03-12 08:47:35', 'Male', '', '98892805'),
(191, 'Sze Van Flora, Lam', 'cheerysmileshk@gmail.com', '76F463BB66839C84E988318E6B2DF219DBD85B08', '61tyzCw=', 3, 1, '2022-04-04 04:52:41', 'Female', '', NULL),
(228, 'Chi Hong Ng', 'ngchihongclinic@gmail.com', 'CDF3A0221287D6394364F6BB3616ABCCA6588815', 'MDI2kpU=', 3, 1, '2022-04-20 02:10:04', 'Male', '', '24806888'),
(1118, 'Sandy, Chen', 'jonahe203@gmail.com', '8A8FE29F6C42076BA0A5250738D78112E4D7422A', '1jLu9ek=', 3, 1, '2022-08-02 02:35:44', 'Female', '', NULL),
(1354, 'Hon Wing Kwok', 'drkwokhonwing@yahoo.com.hk', '876E9FFBD3241BB39635D57EFE867641AE1E8AFE', 'T+HXTVk=', 3, 1, '2022-09-05 06:27:50', 'Male', '', '27291181');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `new_user` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO doctor_info_change(doctor_id,notification)
VALUES(NEW.id,CONCAT("new user ",NEW.username," registered."))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_change` AFTER UPDATE ON `users` FOR EACH ROW INSERT INTO doctor_info_change(doctor_id,notification)
VALUES(NEW.id,CONCAT("User ",NEW.username," ,change information."))
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bleach_stl`
--
ALTER TABLE `bleach_stl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stl_orderid` (`order_id`);

--
-- Indexes for table `case_log`
--
ALTER TABLE `case_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caseLog_orderId` (`order_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatrooms`
--
ALTER TABLE `chatrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatroom_orderid` (`orderId`);

--
-- Indexes for table `clear_retainer_stl`
--
ALTER TABLE `clear_retainer_stl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stl_orderid` (`order_id`);

--
-- Indexes for table `customeraddress`
--
ALTER TABLE `customeraddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`customer_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `doctor_access`
--
ALTER TABLE `doctor_access`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctor_id` (`doctor_id`,`category_id`);

--
-- Indexes for table `doctor_info_change`
--
ALTER TABLE `doctor_info_change`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guard_stl`
--
ALTER TABLE `guard_stl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stl_orderid` (`order_id`);

--
-- Indexes for table `hawley_stl`
--
ALTER TABLE `hawley_stl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stl_orderid` (`order_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pick_up_address_order` (`address_id`),
  ADD KEY `c_order` (`category_id`),
  ADD KEY `patient_id_order` (`patient_id`),
  ADD KEY `customer_order` (`customer_id`);

--
-- Indexes for table `patient_info`
--
ALTER TABLE `patient_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printingservice_stl`
--
ALTER TABLE `printingservice_stl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stl_orderid` (`order_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `standard_aligner_photo`
--
ALTER TABLE `standard_aligner_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photo_orderid` (`order_id`);

--
-- Indexes for table `standard_aligner_question`
--
ALTER TABLE `standard_aligner_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_orderid` (`order_id`);

--
-- Indexes for table `standard_aligner_radiograph`
--
ALTER TABLE `standard_aligner_radiograph`
  ADD PRIMARY KEY (`id`),
  ADD KEY `radio_orderid` (`order_id`);

--
-- Indexes for table `standard_aligner_stl`
--
ALTER TABLE `standard_aligner_stl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stl_orderid` (`order_id`);

--
-- Indexes for table `standard_aligner_treatmentplan`
--
ALTER TABLE `standard_aligner_treatmentplan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `radio_orderid` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1185;

--
-- AUTO_INCREMENT for table `bleach_stl`
--
ALTER TABLE `bleach_stl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `case_log`
--
ALTER TABLE `case_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chatrooms`
--
ALTER TABLE `chatrooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `clear_retainer_stl`
--
ALTER TABLE `clear_retainer_stl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `customeraddress`
--
ALTER TABLE `customeraddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `doctor_access`
--
ALTER TABLE `doctor_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `doctor_info_change`
--
ALTER TABLE `doctor_info_change`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `guard_stl`
--
ALTER TABLE `guard_stl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `hawley_stl`
--
ALTER TABLE `hawley_stl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5959;

--
-- AUTO_INCREMENT for table `patient_info`
--
ALTER TABLE `patient_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `printingservice_stl`
--
ALTER TABLE `printingservice_stl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `standard_aligner_photo`
--
ALTER TABLE `standard_aligner_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `standard_aligner_question`
--
ALTER TABLE `standard_aligner_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `standard_aligner_radiograph`
--
ALTER TABLE `standard_aligner_radiograph`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `standard_aligner_stl`
--
ALTER TABLE `standard_aligner_stl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `standard_aligner_treatmentplan`
--
ALTER TABLE `standard_aligner_treatmentplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1355;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `case_log`
--
ALTER TABLE `case_log`
  ADD CONSTRAINT `caseLog_orderId` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `chatrooms`
--
ALTER TABLE `chatrooms`
  ADD CONSTRAINT `chatroom_orderid` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`);

--
-- Constraints for table `standard_aligner_photo`
--
ALTER TABLE `standard_aligner_photo`
  ADD CONSTRAINT `photo_orderid` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `standard_aligner_question`
--
ALTER TABLE `standard_aligner_question`
  ADD CONSTRAINT `question_orderid` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `standard_aligner_radiograph`
--
ALTER TABLE `standard_aligner_radiograph`
  ADD CONSTRAINT `radio_orderid` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `standard_aligner_stl`
--
ALTER TABLE `standard_aligner_stl`
  ADD CONSTRAINT `stl_orderid` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
