/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.32-MariaDB : Database - dblaundry
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dblaundry` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dblaundry`;

/*Table structure for table `tbl_detail_transaksi` */

DROP TABLE IF EXISTS `tbl_detail_transaksi`;

CREATE TABLE `tbl_detail_transaksi` (
  `id_transaksi` char(16) NOT NULL,
  `id_jenis` char(5) NOT NULL,
  `qty` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  KEY `tbl_detail_transaksi_ibfk_1` (`id_jenis`),
  KEY `tbl_detail_transaksi_ibfk_2` (`id_transaksi`),
  CONSTRAINT `tbl_detail_transaksi_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `tbl_jenis` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tbl_detail_transaksi_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `tbl_transaksi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_detail_transaksi` */

insert  into `tbl_detail_transaksi`(`id_transaksi`,`id_jenis`,`qty`,`harga`) values ('120180627001','PKN',2,12000),('120180627001','KTL',3,60000),('120180627002','PKN',3,18000),('PG00120180627001','PKN',3,18000),('PG00120180627001','SPR',1,15000);

/*Table structure for table `tbl_jenis` */

DROP TABLE IF EXISTS `tbl_jenis`;

CREATE TABLE `tbl_jenis` (
  `id` char(3) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `harga` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jenis` */

insert  into `tbl_jenis`(`id`,`nama`,`satuan`,`harga`) values ('KTL','Kontol','Cm',20000),('PKN','Pakaian','Kg',6000),('SPR','Sepray','Kg',15000);

/*Table structure for table `tbl_menu` */

DROP TABLE IF EXISTS `tbl_menu`;

CREATE TABLE `tbl_menu` (
  `id` int(2) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `parent` int(2) DEFAULT NULL,
  `hak_akses` enum('pemilik','pegawai') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_menu` */

insert  into `tbl_menu`(`id`,`nama`,`url`,`icon`,`parent`,`hak_akses`) values (1,'Pegawai','pegawai',NULL,0,'pemilik'),(2,'Jenis','jenis',NULL,0,'pemilik'),(3,'Transaksi','transaksi',NULL,0,'pemilik'),(4,'Transaksi','transaksi',NULL,NULL,'pegawai');

/*Table structure for table `tbl_transaksi` */

DROP TABLE IF EXISTS `tbl_transaksi`;

CREATE TABLE `tbl_transaksi` (
  `id` char(16) NOT NULL,
  `id_pegawai` char(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `dihapus` enum('1','0') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_transaksi_ibfk_1` (`id_pegawai`),
  CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tbl_user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_transaksi` */

insert  into `tbl_transaksi`(`id`,`id_pegawai`,`nama`,`telp`,`tgl_masuk`,`tgl_keluar`,`dihapus`) values ('120180627001','1','1','11','2018-06-27',NULL,'0'),('120180627002','1','Udin','019123123','2018-06-27',NULL,'0'),('PG00120180627001','PG001','kuprisad','113','2018-06-27','2018-06-27','0');

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id` char(5) NOT NULL,
  `noKtp` char(16) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `hak_akses` enum('pemilik','pegawai') DEFAULT NULL,
  `dihapus` enum('1','0') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id`,`noKtp`,`nama`,`alamat`,`telp`,`jk`,`password`,`hak_akses`,`dihapus`) values ('1','123','ILHAM','Gunung Batu 58','085759898063','L','356a192b7913b04c54574d18c28d46e6395428ab','pemilik','0'),('PG001','00','000','00000','000000','P','3e89ccef7997572c6f64ae0d37c5875bb5f3e4f5','pegawai','0'),('PG002','123','123','123','123','P','50f16abf40cdeabe401002ca9fd2b30fe251b1df','pegawai','1'),('PG003','1','11','111','1111','P','d9cb31ae7cbc65939e5a55309efb21ab263ebfde','pegawai','1'),('PG004','3','33','333','3333','P','e78bfea96d152b8d285fdc6c56191bfbb8c787fd','pegawai','1'),('PG005','33','33333','333333','123132','P','94eb924df236b0c306096b6fd61d29915cf8478d','pegawai','1');

/*Table structure for table `v_detail_transaksi` */

DROP TABLE IF EXISTS `v_detail_transaksi`;

/*!50001 DROP VIEW IF EXISTS `v_detail_transaksi` */;
/*!50001 DROP TABLE IF EXISTS `v_detail_transaksi` */;

/*!50001 CREATE TABLE  `v_detail_transaksi`(
 `id_transaksi` char(16) ,
 `id_jenis` char(5) ,
 `nama_jenis` varchar(20) ,
 `qty` int(3) ,
 `satuan` varchar(10) ,
 `harga` int(10) 
)*/;

/*Table structure for table `v_transaksi` */

DROP TABLE IF EXISTS `v_transaksi`;

/*!50001 DROP VIEW IF EXISTS `v_transaksi` */;
/*!50001 DROP TABLE IF EXISTS `v_transaksi` */;

/*!50001 CREATE TABLE  `v_transaksi`(
 `id` char(16) ,
 `id_pegawai` char(5) ,
 `nama_pegawai` varchar(50) ,
 `nama` varchar(30) ,
 `telp` varchar(15) ,
 `tgl_masuk` date ,
 `tgl_keluar` date ,
 `jumlah_jenis` bigint(21) ,
 `total` decimal(32,0) ,
 `dihapus` enum('1','0') 
)*/;

/*View structure for view v_detail_transaksi */

/*!50001 DROP TABLE IF EXISTS `v_detail_transaksi` */;
/*!50001 DROP VIEW IF EXISTS `v_detail_transaksi` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_transaksi` AS (select `tbl_detail_transaksi`.`id_transaksi` AS `id_transaksi`,`tbl_detail_transaksi`.`id_jenis` AS `id_jenis`,`tbl_jenis`.`nama` AS `nama_jenis`,`tbl_detail_transaksi`.`qty` AS `qty`,`tbl_jenis`.`satuan` AS `satuan`,`tbl_detail_transaksi`.`harga` AS `harga` from (`tbl_detail_transaksi` join `tbl_jenis`) where (`tbl_detail_transaksi`.`id_jenis` = `tbl_jenis`.`id`)) */;

/*View structure for view v_transaksi */

/*!50001 DROP TABLE IF EXISTS `v_transaksi` */;
/*!50001 DROP VIEW IF EXISTS `v_transaksi` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_transaksi` AS (select `tbl_transaksi`.`id` AS `id`,`tbl_transaksi`.`id_pegawai` AS `id_pegawai`,`tbl_user`.`nama` AS `nama_pegawai`,`tbl_transaksi`.`nama` AS `nama`,`tbl_transaksi`.`telp` AS `telp`,`tbl_transaksi`.`tgl_masuk` AS `tgl_masuk`,`tbl_transaksi`.`tgl_keluar` AS `tgl_keluar`,(select count(`tbl_detail_transaksi`.`id_jenis`) from `tbl_detail_transaksi` where (`tbl_detail_transaksi`.`id_transaksi` = `tbl_transaksi`.`id`)) AS `jumlah_jenis`,(select sum(`tbl_detail_transaksi`.`harga`) from `tbl_detail_transaksi` where (`tbl_detail_transaksi`.`id_transaksi` = `tbl_transaksi`.`id`)) AS `total`,`tbl_transaksi`.`dihapus` AS `dihapus` from (`tbl_transaksi` join `tbl_user`) where (`tbl_transaksi`.`id_pegawai` = `tbl_user`.`id`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
