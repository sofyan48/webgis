-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.0.20-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for db_gps
CREATE DATABASE IF NOT EXISTS `db_gps` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_gps`;


-- Dumping structure for table db_gps.datagps
CREATE TABLE IF NOT EXISTS `datagps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datagps` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_gps.datagps: ~0 rows (approximately)
/*!40000 ALTER TABLE `datagps` DISABLE KEYS */;
/*!40000 ALTER TABLE `datagps` ENABLE KEYS */;


-- Dumping structure for table db_gps.tb_jalan
CREATE TABLE IF NOT EXISTS `tb_jalan` (
  `id_jalan` varchar(50) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `start` text NOT NULL,
  `finish` text NOT NULL,
  `jarak` float NOT NULL,
  PRIMARY KEY (`id_jalan`),
  KEY `FK_tb_jalan_tb_pengguna` (`id_pengguna`),
  CONSTRAINT `FK_tb_jalan_tb_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_gps.tb_jalan: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_jalan` DISABLE KEYS */;
REPLACE INTO `tb_jalan` (`id_jalan`, `id_pengguna`, `start`, `finish`, `jarak`) VALUES
	('101', 1, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 2780),
	('102', 1, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 1171),
	('103', 1, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 3209),
	('104', 1, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 3669),
	('105', 1, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2817),
	('106', 1, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 3280),
	('110', 1, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2471),
	('112', 1, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 3645),
	('113', 1, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1007),
	('114', 1, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1400),
	('115', 1, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 902),
	('116', 1, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1759),
	('120', 1, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1404),
	('121', 1, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 2852),
	('123', 1, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2460),
	('124', 1, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2852),
	('125', 1, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2695),
	('126', 1, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 3424),
	('130', 1, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2141),
	('131', 1, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 1026),
	('132', 1, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 2093),
	('134', 1, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 392),
	('135', 1, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 392),
	('136', 1, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 964),
	('140', 1, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1965),
	('141', 1, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 1418),
	('142', 1, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 1917),
	('143', 1, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 392),
	('145', 1, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 691),
	('146', 1, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 580),
	('150', 1, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2490),
	('151', 1, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 902),
	('152', 1, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 2485),
	('153', 1, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 392),
	('154', 1, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 691),
	('156', 1, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 780),
	('160', 1, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1706),
	('161', 1, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 1587),
	('162', 1, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 2488),
	('163', 1, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 964),
	('164', 1, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 580),
	('165', 1, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 780),
	('201', 2, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 2780),
	('202', 2, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 1171),
	('203', 2, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 3209),
	('204', 2, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 3669),
	('205', 2, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2817),
	('206', 2, 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 3280),
	('210', 2, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2471),
	('212', 2, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 3645),
	('213', 2, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1007),
	('214', 2, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1400),
	('215', 2, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 902),
	('216', 2, 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1759),
	('220', 2, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1404),
	('221', 2, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 2852),
	('223', 2, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2460),
	('224', 2, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2852),
	('225', 2, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2695),
	('226', 2, 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 3424),
	('230', 2, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2141),
	('231', 2, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 1026),
	('232', 2, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 2093),
	('234', 2, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 392),
	('235', 2, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 392),
	('236', 2, 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 964),
	('240', 2, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1965),
	('241', 2, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 1418),
	('242', 2, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 1917),
	('243', 2, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 392),
	('245', 2, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 691),
	('246', 2, 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 580),
	('250', 2, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 2490),
	('251', 2, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 902),
	('252', 2, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 2485),
	('253', 2, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 392),
	('254', 2, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 691),
	('256', 2, 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 780),
	('260', 2, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 1706),
	('261', 2, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia', 1587),
	('262', 2, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia', 2488),
	('263', 2, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 964),
	('264', 2, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 580),
	('265', 2, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia', 780);
/*!40000 ALTER TABLE `tb_jalan` ENABLE KEYS */;


-- Dumping structure for table db_gps.tb_log
CREATE TABLE IF NOT EXISTS `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mobil` varchar(50) NOT NULL,
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `speed` int(11) NOT NULL DEFAULT '0',
  `waktu` datetime DEFAULT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tb_log_tb_mobil` (`id_mobil`),
  CONSTRAINT `FK_tb_log_tb_mobil` FOREIGN KEY (`id_mobil`) REFERENCES `tb_mobil` (`id_mobil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_gps.tb_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_log` ENABLE KEYS */;


-- Dumping structure for table db_gps.tb_log_penumpang
CREATE TABLE IF NOT EXISTS `tb_log_penumpang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penumpang` varchar(50) NOT NULL DEFAULT '0',
  `asal` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_gps.tb_log_penumpang: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_log_penumpang` DISABLE KEYS */;
REPLACE INTO `tb_log_penumpang` (`id`, `penumpang`, `asal`) VALUES
	(1, 'Aristo', '1');
/*!40000 ALTER TABLE `tb_log_penumpang` ENABLE KEYS */;


-- Dumping structure for table db_gps.tb_mobil
CREATE TABLE IF NOT EXISTS `tb_mobil` (
  `id_mobil` varchar(50) NOT NULL,
  `nama_supir` text,
  `no_hp` text,
  PRIMARY KEY (`id_mobil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_gps.tb_mobil: ~10 rows (approximately)
/*!40000 ALTER TABLE `tb_mobil` DISABLE KEYS */;
REPLACE INTO `tb_mobil` (`id_mobil`, `nama_supir`, `no_hp`) VALUES
	('357671031485631', 'aristo', '0'),
	('3576710314856310', 'Handry', '0'),
	('357671031485632', 'iank', '0'),
	('357671031485633', 'Oka', '0'),
	('357671031485634', 'Tias', '0'),
	('357671031485635', 'Wildan', '0'),
	('357671031485636', 'Agus', '0'),
	('357671031485637', 'Komodo', '0'),
	('357671031485638', 'Fanrani', '0'),
	('357671031485639', 'Inal', '0');
/*!40000 ALTER TABLE `tb_mobil` ENABLE KEYS */;


-- Dumping structure for table db_gps.tb_pengguna
CREATE TABLE IF NOT EXISTS `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table db_gps.tb_pengguna: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_pengguna` DISABLE KEYS */;
REPLACE INTO `tb_pengguna` (`id_pengguna`, `username`, `password`) VALUES
	(1, 'aristo', '123456'),
	(2, 'iank', '123456');
/*!40000 ALTER TABLE `tb_pengguna` ENABLE KEYS */;


-- Dumping structure for table db_gps.tb_penumpang
CREATE TABLE IF NOT EXISTS `tb_penumpang` (
  `id_penumpang` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` int(11) DEFAULT NULL,
  `posisi_terakhir` text,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id_penumpang`),
  KEY `FK__tb_pengguna` (`id_pengguna`),
  CONSTRAINT `FK__tb_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='jangan saat pembuatan script tambah penumpang juga memasukan data untuk yang ini';

-- Dumping data for table db_gps.tb_penumpang: ~2 rows (approximately)
/*!40000 ALTER TABLE `tb_penumpang` DISABLE KEYS */;
REPLACE INTO `tb_penumpang` (`id_penumpang`, `id_pengguna`, `posisi_terakhir`, `latitude`, `longitude`) VALUES
	(1, 1, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', -0.8870625999999999, 119.8609783),
	(2, 2, 'Jl. Undata, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia', -0.8870625999999999, 119.8609783);
/*!40000 ALTER TABLE `tb_penumpang` ENABLE KEYS */;


-- Dumping structure for table db_gps.tb_posisi
CREATE TABLE IF NOT EXISTS `tb_posisi` (
  `id` varchar(50) NOT NULL,
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `speed` int(11) NOT NULL DEFAULT '0',
  `waktu` datetime DEFAULT NULL,
  `status` text,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_tb_posisi_tb_mobil` FOREIGN KEY (`id`) REFERENCES `tb_mobil` (`id_mobil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_gps.tb_posisi: ~7 rows (approximately)
/*!40000 ALTER TABLE `tb_posisi` DISABLE KEYS */;
REPLACE INTO `tb_posisi` (`id`, `latitude`, `longitude`, `speed`, `waktu`, `status`) VALUES
	('357671031485631', -0.88447, 119.851903, 0, '2015-09-02 10:03:31', 'AUTOLOW'),
	('357671031485632', -0.888648, 119.870718, 0, '2015-09-09 15:58:40', 'AUTOLOW'),
	('357671031485633', -0.891806, 119.854913, 0, '2015-09-14 01:13:43', 'AUTOLOW'),
	('357671031485634', -0.89211, 119.864911, 0, '2015-09-15 02:38:27', 'AUTOLOW'),
	('357671031485635', -0.891309, 119.861963, 0, '2015-09-16 20:02:49', 'AUTOLOW'),
	('357671031485636', -0.889421, 119.865826, 0, '2015-09-16 20:12:43', 'AUTOLOW');
/*!40000 ALTER TABLE `tb_posisi` ENABLE KEYS */;


-- Dumping structure for table db_gps.tb_posisi_terakhir
CREATE TABLE IF NOT EXISTS `tb_posisi_terakhir` (
  `id_posisi` int(11) NOT NULL AUTO_INCREMENT,
  `id_mobil` varchar(50) NOT NULL DEFAULT '0',
  `jalan` text NOT NULL,
  PRIMARY KEY (`id_posisi`),
  KEY `FK_tb_posisi_terakhir_tb_mobil` (`id_mobil`),
  CONSTRAINT `FK_tb_posisi_terakhir_tb_mobil` FOREIGN KEY (`id_mobil`) REFERENCES `tb_mobil` (`id_mobil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table db_gps.tb_posisi_terakhir: ~6 rows (approximately)
/*!40000 ALTER TABLE `tb_posisi_terakhir` DISABLE KEYS */;
REPLACE INTO `tb_posisi_terakhir` (`id_posisi`, `id_mobil`, `jalan`) VALUES
	(1, '357671031485631', 'Jl. Cumi Cumi, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia'),
	(2, '357671031485632', 'Jl. Samratulangi, Palu Tim., Kota Palu, Sulawesi Tengah 94118, Indonesia'),
	(3, '357671031485633', 'Jl. Diponegoro No.43A, Palu Bar., Kota Palu, Sulawesi Tengah 94221, Indonesia'),
	(4, '357671031485634', 'Jl. Kyai Maja, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia'),
	(5, '357671031485635', 'Jl. Rajamoili, Palu Bar., Kota Palu, Sulawesi Tengah 94111, Indonesia'),
	(6, '357671031485636', 'Jl. Hayam Wuruk, Palu Tim., Kota Palu, Sulawesi Tengah 94111, Indonesia');
/*!40000 ALTER TABLE `tb_posisi_terakhir` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
