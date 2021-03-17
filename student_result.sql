-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for student_result
CREATE DATABASE IF NOT EXISTS `student_result` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `student_result`;

-- Dumping structure for table student_result.results
CREATE TABLE IF NOT EXISTS `results` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `exam_year` smallint(6) NOT NULL,
  `exam_type` enum('SSC','HSC') COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` double(4,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `results_student_id_foreign` (`student_id`),
  CONSTRAINT `results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table student_result.results: ~6 rows (approximately)
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` (`id`, `student_id`, `exam_year`, `exam_type`, `subject`, `grade`, `created_at`, `updated_at`) VALUES
	(1, 1, 2021, 'SSC', 'Sub1', 5.00, '2021-03-16 21:46:39', NULL),
	(2, 1, 2021, 'SSC', 'Sub2', 4.00, '2021-03-16 21:47:07', NULL),
	(3, 1, 2021, 'SSC', 'Sub3', 3.50, '2021-03-16 21:47:50', NULL),
	(4, 2, 2021, 'SSC', 'Sub1', 4.50, '2021-03-16 21:49:26', NULL),
	(5, 2, 2021, 'SSC', 'Sub2', 5.00, '2021-03-16 21:51:23', NULL),
	(6, 2, 2021, 'SSC', 'Sub3', 3.00, '2021-03-16 21:52:12', NULL);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;

-- Dumping structure for table student_result.students
CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regi_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table student_result.students: ~2 rows (approximately)
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`id`, `name`, `regi_number`, `created_at`, `updated_at`) VALUES
	(1, 'student1', 1001, '2021-03-16 21:45:35', NULL),
	(2, 'student2', 1002, '2021-03-16 21:45:57', NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
