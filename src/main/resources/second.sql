/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.1.49-community : Database - twohand
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`twohand` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `twohand`;

/*Table structure for table `comments` */

CREATE TABLE `comments` (
  `ID` varchar(28) NOT NULL,
  `No` varchar(16) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` text,
  `loc` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `comments` */

insert  into `comments`(`ID`,`No`,`time`,`content`,`loc`,`parentid`,`cid`) values ('user2','2020102user1','2020-05-06 10:12:19','感觉还可以',-1,-1,1),('user2','2020102user1','2020-05-07 10:15:31','店家有货吗',-1,-1,2),('user3','2020102user1','2020-05-01 10:16:09','还有其他款式的嘛',-1,-1,3),('user3','2020102user1','2020-05-06 10:12:19','感觉开心',-1,-1,4),('hello','2020102user1','2020-06-08 00:00:00','什么料子',-1,-1,5),('hello','20200405user2','2020-06-10 00:00:00','很拉风，风韵不减当年',-1,-1,6),('hello','2020102user1','2020-06-11 00:00:00','演示测试',-1,-1,7),('hello','20200405user1','2020-06-11 00:00:00','123',-1,-1,8),('opl','2020102user1','2020-09-11 00:00:00','几成新？',-1,-1,9),('opl','2020102user1','2020-09-13 00:00:00','wow gre',-1,-1,10),('opl','2020102user1','2020-09-13 00:00:00','wow gre',-1,-1,11),('opl','2020102user1','2020-09-13 00:00:00','qqq',-1,-1,12),('opl','2020102user1','2020-09-13 00:00:00','牛的牛的牛的牛的',-1,-1,13),('opl','2020102user1','2020-09-17 00:00:00','多来几个',-1,-1,14),('opl','2020102user1','2020-09-17 00:00:00','这是回复信息',2,2,15),('opl','2020102user1','2020-09-17 00:00:00','微微儿',7,7,16),('hello','2020102user1','2020-09-17 00:00:00','试试看回复2',2,15,17),('user5','2020102user1','2020-09-17 00:00:00','这不牛吗',-1,-1,18),('user5','2020102user1','2020-09-17 00:00:00','测试测试',7,16,19),('user5','2020102user1','2020-09-17 00:00:00','牛！',-1,-1,20),('user5','2020102user1','2020-09-17 00:00:00','嗷嗷嗷嗷嗷',-1,-1,21),('opl','2020102user1','2020-09-17 00:00:00','123',2,17,22);

/*Table structure for table `distribute` */

CREATE TABLE `distribute` (
  `No` varchar(16) NOT NULL,
  `ID` varchar(28) NOT NULL,
  `acc` varchar(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distribute` */

insert  into `distribute`(`No`,`ID`,`acc`,`time`) values ('20180606user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('20190101user1','user5','飞鸢澈野','2020-08-12 15:37:19'),('20190606user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200101user2','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200111user2','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200203','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200203user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200203user2','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200301user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200303user2','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200304user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200405user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200405user2','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200505user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200601user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('2020060501','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200606user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200606user2','user5','飞鸢澈野','2020-07-24 15:37:15'),('20200809user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('2020102user1','user5','飞鸢澈野','2020-07-24 15:37:15'),('2064user5','user5','飞鸢澈野','2020-06-09 16:13:36'),('2067user5','user5','飞鸢澈野','2020-07-24 15:37:15'),('2092hello','hello','蜡笔小新','2020-09-14 13:36:49'),('234567654','user5','飞鸢澈野','2020-07-24 15:37:15');

/*Table structure for table `goods` */

CREATE TABLE `goods` (
  `No` varchar(16) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `desc` text,
  `comments` text,
  `pic` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`No`,`type`,`name`,`price`,`desc`,`comments`,`pic`) values ('20180606user1','衣服','卫衣',120,'穿了三天',NULL,'img/20200606user2.jpg'),('20190101user1','衣服','不是风衣',111,'修改后的描述',NULL,'img/20200606user1.jpg'),('20190606user1','衣服','T袖',200,'买来没穿过',NULL,'img/20200606user2.jpg'),('20200101user2','衣服','T桖',11,'挪个控件',NULL,'img/20200606user1.jpg'),('20200111user2','衣服','卫衣',33,'纯送人的价格',NULL,'img/20200606user2.jpg'),('20200203','衣服','过大卫衣',43,'转让',NULL,'img/20200606user2.jpg'),('20200203user1','衣服','郭小卫衣',11,'便宜送',NULL,'img/20200606user2.jpg'),('20200203user2','衣服','T桖',12,'无话可说',NULL,'img/20200606user2.jpg'),('20200301user1','衣服','卫衣',234,'你爱要不要把',NULL,'img/2020060501.jpg'),('20200303user2','衣服','卫衣',44,'认了认了',NULL,'img/20200606user1.jpg'),('20200304user1','衣服','卫衣',122,'腾个空间',NULL,'img/20200606user1.jpg'),('20200405user1','衣服','T桖',22,'不要了',NULL,'img/20200606user2.jpg'),('20200405user2','衣服','风衣',55,'陈年旧事',NULL,'img/2020060501.jpg'),('20200505user1','衣服','卫衣',33,'便宜',NULL,'img/20200606user1.jpg'),('20200601user1','衣服','T桖',11,'垃圾扔了',NULL,'img/20200606user1.jpg'),('2020060501','衣服','破旧风衣',20,'三年没穿，不想要了',NULL,'img/2020060501.jpg'),('20200606user1','衣服','破旧风衣',20,'三年没穿，不想要了',NULL,'img/2020060501.jpg'),('20200606user2','衣服','破旧卫衣',100,'便宜送人',NULL,'img/20200606user1.jpg'),('20200809user1','衣服','卫衣',111,'急用钱',NULL,'img/20200606user2.jpg'),('2020102user1','衣服','T桖',44,'9成新',NULL,'img/20200606user1.jpg'),('2064user5','书本','五年高考',12,'公司很多',NULL,'img/2064user5.jpg'),('2067user5','学习','猫咪',300,'假的猫咪',NULL,'img/2067user5.jpg'),('2092hello','书本','学校海报',22,'学校的海报',NULL,'img/2094hello.jpg'),('234567654','学习','测试',12,'nothing',NULL,'img/20200606user2.jpg');

/*Table structure for table `mesg` */

CREATE TABLE `mesg` (
  `from` varchar(28) DEFAULT NULL,
  `to` varchar(28) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isnew` tinyint(1) DEFAULT NULL,
  `content` text,
  `frompic` varchar(50) DEFAULT NULL,
  `topic` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mesg` */

insert  into `mesg`(`from`,`to`,`time`,`isnew`,`content`,`frompic`,`topic`) values ('opl','hello','2020-09-13 19:59:09',0,'你好','img/picopl.jpeg','img/picl.jpg'),('opl','hello','2020-09-12 19:59:09',0,'在不','img/picopl.jpeg','img/picl.jpg'),('hello','user5','2020-09-13 21:42:11',0,'测试数据->opl','img/pic1.jpg','img/picuser5.jpeg'),('hello','user5','2020-09-13 21:42:17',0,'还有货吗','img/pic1.jpg','img/picuser5.jpeg'),('opl','user5','2020-09-13 21:42:21',0,'测试数据','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-13 21:42:26',0,'测试测试','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-13 21:43:56',0,'测试测试','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-13 21:29:51',0,'再次测试\n            ','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-13 21:34:15',0,'测试数据123','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-13 22:07:53',0,'最终数据','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-13 22:17:12',0,'can you hear me','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-13 22:23:59',0,'相信科学','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-13 22:26:56',0,'发生什么事了','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-13 22:27:22',0,'还能收到吗','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-14 10:17:55',0,'hello!!!!!!!!!!!!!!!!!!!!','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-14 10:18:16',0,'uuiihihi','img/picopl.jpeg','img/picuser5.jpeg'),('user5','opl','2020-09-14 10:18:39',0,'方法方法付付','img/picuser5.jpeg','img/picopl.jpeg'),('user5','opl','2020-09-14 10:19:46',0,'111111','img/picuser5.jpeg','img/picopl.jpeg'),('opl','user5','2020-09-14 10:19:50',0,'4546464','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-17 09:11:50',0,'以解封','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-17 15:11:57',0,'111111','img/picopl.jpeg','img/picuser5.jpeg'),('user5','opl','2020-09-17 15:18:06',0,'在？','img/picuser5.jpeg','img/picopl.jpeg'),('opl','user5','2020-09-17 15:16:35',0,'121213131','img/picopl.jpeg','img/picuser5.jpeg'),('opl','user5','2020-09-17 15:18:32',0,'在的','img/picopl.jpeg','img/picuser5.jpeg');

/*Table structure for table `trades` */

CREATE TABLE `trades` (
  `tradeNo` varchar(20) NOT NULL,
  `ID` varchar(28) DEFAULT NULL,
  `acc` varchar(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `No` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`tradeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `trades` */

insert  into `trades`(`tradeNo`,`ID`,`acc`,`time`,`name`,`No`) values ('20200607898','hello','蜡笔小新','2020-06-03 15:46:56','卫衣','2020102user1'),('202061020250','hello','蜡笔小新','2020-06-10 20:25:03','T桖','2020102user1'),('202061110360','hello','蜡笔小新','2020-06-11 10:36:58','T桖','20200405user1'),('20206817150','hello','蜡笔小新','2020-06-08 00:00:00','T桖','2020102user1'),('20206817360','hello','蜡笔小新','2020-06-08 17:36:47','风衣','20200405user2'),('20206918570','user1','张三丰','2020-06-09 18:57:33','五年高考','2073user1'),('202091110410','user5','飞鸢澈野','2020-09-11 10:41:13','风衣','20200405user2'),('202091110500','opl','小黑','2020-09-11 10:50:45','风衣','20200405user2'),('202091313430','opl','小黑','2020-09-13 13:43:13','T桖','2020102user1'),('20209178210','opl','小黑','2020-09-17 08:21:30','T桖','2020102user1');

/*Table structure for table `user` */

CREATE TABLE `user` (
  `ID` varchar(28) NOT NULL,
  `acc` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `pic` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`ID`,`acc`,`password`,`pic`) values ('fantas','福山润','222222','img/picfantas.jpeg'),('hello','蜡笔小新','222222','img/pic1.jpg'),('opl','小黑','222222','img/picopl.jpeg'),('super','你的背包','222222','img/picsuper.jpg'),('user1','张三丰','222222','img/pic1.jpg'),('user11','承佳琪','222222','img/picuser11.jpg'),('user2','张无忌','222222','img/pic1.jpg'),('user21','测试用户','222222','img/picuser21.jpeg'),('user3','法海','222222','img/pic1.jpg'),('user4','所罗门','222222','img/pic1.jpg'),('user5','飞鸢澈野','222222','img/picuser5.jpeg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
