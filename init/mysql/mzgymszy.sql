# Host: 183.175.14.78  (Version 5.7.15)
# Date: 2017-05-31 10:58:33
# Generator: MySQL-Front 5.4  (Build 1.21)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tb_ccr"
#

DROP TABLE IF EXISTS `tb_ccr`;
CREATE TABLE `tb_ccr` (
  `C_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C_XM` varchar(20) NOT NULL,
  `C_XB` tinyint(1) NOT NULL DEFAULT '0',
  `C_MZ` varchar(20) DEFAULT NULL,
  `C_CSNY` date NOT NULL DEFAULT '1900-01-01',
  `C_WHCD` varchar(20) NOT NULL DEFAULT '无',
  `C_JG` varchar(100) NOT NULL DEFAULT '',
  `C_LXFS` varchar(200) NOT NULL DEFAULT '',
  `C_LXDZ` varchar(100) NOT NULL DEFAULT '',
  `C_TSSY` varchar(100) DEFAULT NULL,
  `C_CYQSN` varchar(50) DEFAULT NULL,
  `C_SC` int(11) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "tb_ccr"
#

INSERT INTO `tb_ccr` VALUES (14,'阿有西',0,'','1980-01-30','无','','13948028793','阿拉善盟右旗雅布来填努日盖嘎查','','',0),(17,'（陶）格日勒\t',0,'蒙古族','1986-06-05','不祥','不祥','13614830382\t','不祥','不祥','不祥',14);

#
# Structure for table "tb_fold"
#

DROP TABLE IF EXISTS `tb_fold`;
CREATE TABLE `tb_fold` (
  `F_ID` int(11) NOT NULL AUTO_INCREMENT,
  `F_PARENT_ID` int(11) DEFAULT NULL,
  `F_NAME` varchar(100) NOT NULL,
  `F_FULLPATH` varchar(1000) NOT NULL,
  `F_DEPTH` int(38) NOT NULL,
  `F_DEL_FLAG` int(38) NOT NULL DEFAULT '0',
  `F_CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `F_UPDATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `F_IS_LEAF` int(38) NOT NULL DEFAULT '1',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "tb_fold"
#

INSERT INTO `tb_fold` VALUES (1,NULL,'/','.',0,0,'2016-11-25 16:54:49','2016-11-25 16:54:49',0),(2,1,'鞍马类','./鞍马类',1,0,'2016-10-25 16:25:36','2016-11-29 23:02:34',0),(3,1,'配饰类','./配饰类',1,0,'2016-10-25 16:26:11','2017-05-30 18:02:10',1),(4,1,'毡庐类','./毡庐类',1,0,'2016-10-25 16:26:50','2016-10-25 16:26:50',1),(5,1,'餐饮类','./餐饮类',1,0,'2016-10-25 16:27:11','2016-10-25 16:27:11',1),(6,1,'游乐类','./游乐类',1,0,'2016-10-25 16:27:34','2016-10-25 16:27:34',1),(7,1,'宗教类','./宗教类',1,0,'2016-10-25 16:27:50','2016-10-25 16:27:50',0),(8,2,'马鞍类','./鞍马类/马鞍类',2,0,'2016-10-25 16:28:44','2016-10-25 16:28:44',1),(9,2,'鹿鞍类','./鞍马类/鹿鞍类',2,0,'2016-11-25 18:42:13','2016-11-25 18:42:13',1),(23,7,'喇嘛教','./宗教类/喇嘛教',2,0,'2016-12-07 17:00:23','2016-12-07 17:00:23',1);

#
# Structure for table "tb_gyp"
#

DROP TABLE IF EXISTS `tb_gyp`;
CREATE TABLE `tb_gyp` (
  `GYP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GYP_BM` varchar(30) NOT NULL,
  `GYP_MC_ZM` varchar(20) NOT NULL,
  `GYP_MC_YM` varchar(20) DEFAULT NULL,
  `GYP_SCD_DW` varchar(6) NOT NULL,
  `GYP_SCD_SCRXM` varchar(20) NOT NULL,
  `GYP_SCD_LXFS` varchar(30) NOT NULL,
  `GYP_SCD_SCDZ` varchar(100) NOT NULL,
  `GYP_SCD_SJND` datetime DEFAULT NULL,
  `GYP_SCD_SYNX` int(38) DEFAULT NULL,
  `GYP_CYZ_SF` varchar(6) DEFAULT NULL,
  `GYP_CYZ_MZ` varchar(8) DEFAULT NULL,
  `GYP_LYD` varchar(100) NOT NULL,
  `GYP_ZS_ZSFS` varchar(20) NOT NULL,
  `GYP_ZS_ZTA` varchar(10) NOT NULL,
  `GYP_ZS_MS` varchar(500) NOT NULL,
  `GYP_ZS_GJZP` varchar(100) DEFAULT NULL,
  `GYP_GGXT_ZTGG` varchar(100) NOT NULL,
  `GYP_GGXT_JBGG` varchar(100) NOT NULL,
  `GYP_DST_TP` varchar(100) NOT NULL,
  `GYP_DST_SST` varchar(100) NOT NULL,
  `GYP_CCX` int(11) DEFAULT NULL,
  `GYP_ZZGJ_CGGJ` varchar(100) NOT NULL,
  `GYP_ZZGJ_ZYGJ` varchar(100) NOT NULL,
  `GYP_ZZCL_CZ` varchar(20) NOT NULL,
  `GYP_SYGN_SYCH` varchar(20) NOT NULL,
  `GYP_SYGN_SYSP` varchar(100) DEFAULT NULL,
  `GYP_SYGN_SYYP` varchar(100) DEFAULT NULL,
  `GYP_ZZLC_ZZSP` varchar(100) DEFAULT NULL,
  `GYP_ZZLC_ZZYP` varchar(100) DEFAULT NULL,
  `GYP_SYCS_CSSP` varchar(100) DEFAULT NULL,
  `GYP_SYCS_CSYP` varchar(100) DEFAULT NULL,
  `GYP_BZ` varchar(100) DEFAULT NULL,
  `GYP_FOLD_ID` int(11) NOT NULL,
  `GYP_DEL_FLAG` int(38) NOT NULL DEFAULT '0',
  `GYP_CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GYP_UPDATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GYP_DYR_XM` varchar(20) NOT NULL,
  `GYP_DYR_LXFS` varchar(20) NOT NULL,
  `GYP_DYR_DW` varchar(40) NOT NULL,
  `GYP_DYR_TBSJ` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GYP_ZZCL_CLMC` varchar(100) NOT NULL,
  PRIMARY KEY (`GYP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

#
# Data for table "tb_gyp"
#

INSERT INTO `tb_gyp` VALUES (36,'bm-test-001','测试名称1','测试别名','个人','测试','123456789','辽宁省-沈阳市-沈北新区','2016-11-17 00:00:00',100,'贵族','测试','辽宁省-沈阳市-沈北新区','彩绘','植物花卉','测试','111,222','222','333','444','555',11,'测试工具','666','石材、宝石','日常使用','111','111111','111111','11111111,111111','111','111',NULL,8,0,'2016-11-30 15:47:38','2017-04-21 16:22:37','111','1111','测试单位','2016-11-24 00:00:00','测试材料'),(37,'ⅥM-1-5-0001','唐卡\t',NULL,'个人','（陶）格日勒\t','13614830382\t','内蒙古自治区-阿拉善盟-阿拉善左旗','2016-12-01 00:00:00',100,'贵族','未填写','内蒙古自治区阿拉善盟','其它装饰方式','植物花卉','拼贴、绘画','L1007329','L1007300','L1007301','L1007303','L1007307',13,'针','L1007309','其他','宗教信仰活动','L1007311','L1007311','L1007311','111','222','333',NULL,23,0,'2016-12-07 17:18:22','2016-12-07 17:18:22','111','111','111','2016-12-07 00:00:00','马鬃、绸缎、黑绒布'),(38,'ⅡM-1-2-0001','烟袋','烟袋','个人','查干础鲁','13624730062','内蒙古自治区-阿拉善盟-阿拉善左旗','2016-02-03 00:00:00',30,'不祥','蒙古族','内蒙古自治区-阿拉善盟-阿拉善左旗','其它装饰方式','几何','蓝底、粉色绸缎包边，角隅处刺绣有吉祥结图案','L1006925,L1006926,L1006927,L1006928','L1006925','L1006925','L1006925','L1006925',14,'123132','123123','其他','其它','sp001','sp001','sp001','sp001','123','123132',NULL,3,0,'2017-01-09 12:56:01','2017-01-09 12:56:01','无','无','无','2016-12-21 00:00:00','针、丝线'),(39,'ⅥM-1-5-0001','唐卡2','','个人','（陶）格日勒','13614830382','内蒙古自治区-阿拉善盟-阿拉善左旗','2017-05-11 00:00:00',100,'僧侣','不祥','内蒙古自治区-阿拉善盟-阿拉善左旗','其它装饰方式','植物花卉','不祥','IMG_3910.J','IMG_3910.J','IMG_3910.J','IMG_3910.J','lalala,222',17,'不祥','asdasd','石材、宝石','宗教信仰活动','111','111','111','111','111','111','111',23,0,'2017-05-25 11:27:03','2017-05-25 11:27:03','111','1111','111','2017-05-24 00:00:00','不祥');

#
# Structure for table "tb_log_info"
#

DROP TABLE IF EXISTS `tb_log_info`;
CREATE TABLE `tb_log_info` (
  `l_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `u_id` bigint(20) NOT NULL,
  `l_account_name` varchar(100) DEFAULT NULL,
  `l_operation` varchar(255) DEFAULT NULL COMMENT '用户所做的操作',
  `l_content` varchar(2550) DEFAULT NULL COMMENT '日志内容',
  `l_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "tb_log_info"
#

INSERT INTO `tb_log_info` VALUES (1,20,'keyan@imau.com','update','password[参数1，类型：UserEntity，值：(getCredentialsSalt : b09b4d09a7dd57b5174f86ec7077a0fd)(getPassword : 2wcLAKOgMGvhLoK0g8oSew==)(getUserName : ???)(getAccountName : keyan@imau.com)]','2017-05-30 20:09:41'),(2,20,'keyan@imau.com','update','password[参数1，类型：UserEntity，值：(getCredentialsSalt : 8e0639b001f4b0d7d3f0ccceb052f876)(getPassword : KxmnzLYWsCJ8O4kwryePYg==)(getUserName : ???)(getAccountName : keyan@imau.com)]','2017-05-30 20:11:47'),(3,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getPassword : FKBXYkiW7QNBUdF1EzRamg==)(getUserName : ????)(getCredentialsSalt : 6b900908272c0af8aa5c89d703e5e6a4)(getAccountName : admin@imau.com)]','2017-05-30 20:18:16'),(4,20,'keyan@imau.com','update','password[参数1，类型：UserEntity，值：(getPassword : z+TGFtIrwhLJsEVZQ1S6fQ==)(getUserName : 科研员)(getCredentialsSalt : 7b8f8cb0814ef67f4b16dda2fb232020)(getAccountName : keyan@imau.com)]','2017-05-30 20:20:46'),(5,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getPassword : luJT5mIosUc9wlPaAEvRvQ==)(getUserName : ????)(getCredentialsSalt : e378def1ed42d33949de4e2e8b8aa984)(getAccountName : admin@imau.com)]','2017-05-30 20:25:14'),(6,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getPassword : 3bSVklmUtB3GucJCTkKlTw==)(getUserName : 科研主任)(getCredentialsSalt : 36bc823d6fe3fb32559fd3f43321328c)(getAccountName : admin@imau.com)]','2017-05-30 20:34:46'),(7,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getCredentialsSalt : b6dfdd735341be4c8564b630ec1cf223)(getPassword : 4H8vZsDb+bYzROVBrzzleg==)(getUserName : 科研主任)(getAccountName : admin@imau.com)]','2017-05-30 20:38:45'),(8,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getCredentialsSalt : 5c0d5bf72ae74a5fffd33760ac78d3e0)(getPassword : WgVlU3EaspWS/3p2ELDKEw==)(getUserName : 科研主任)(getAccountName : admin@imau.com)]','2017-05-30 20:56:41'),(9,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getCredentialsSalt : 7cf70477063e2d70ee2abe45b8e02b7d)(getPassword : Mf0zb1NQiHvrLA9z9kARAg==)(getUserName : 科研主任)(getAccountName : admin@imau.com)]','2017-05-30 21:00:01'),(10,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getPassword : MM7a3KUOpEMf/bGSLQ2akQ==)(getUserName : 科研主任)(getCredentialsSalt : 6e8f4eb1d22d34727a0b9453aa75cf86)(getAccountName : admin@imau.com)]','2017-05-30 21:06:15'),(11,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getPassword : IhBaqn9zzxMO6TAVXkU4sQ==)(getUserName : 科研主任)(getCredentialsSalt : e800220c0e4621edd2d9226787c94e46)(getAccountName : admin@imau.com)]','2017-05-30 21:08:01'),(12,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getPassword : 70p/fNutnyI0mb/hI/GGcA==)(getUserName : 科研主任)(getCredentialsSalt : 5d1ec187f3e5969bfac3f29231bde909)(getAccountName : admin@imau.com)]','2017-05-30 21:13:18'),(13,19,'admin@imau.com','update','password[参数1，类型：UserEntity，值：(getPassword : fYz6SBAeVYCeoaT5xTtSpA==)(getUserName : 科研主任)(getCredentialsSalt : 8d62eea86ae16f22f110ecb47974d2cf)(getAccountName : admin@imau.com)]','2017-05-30 21:13:57');

#
# Structure for table "tb_login_info"
#

DROP TABLE IF EXISTS `tb_login_info`;
CREATE TABLE `tb_login_info` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `u_account_name` varchar(255) DEFAULT NULL,
  `l_ip` varchar(255) DEFAULT NULL,
  `l_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "tb_login_info"
#

INSERT INTO `tb_login_info` VALUES (1,19,'admin@imau.com','127.0.0.1','2017-05-30 19:40:31'),(2,18,'superadmin@imu.com','127.0.0.1','2017-05-30 19:42:51'),(3,20,'keyan@imau.com','127.0.0.1','2017-05-30 20:09:25'),(4,20,'keyan@imau.com','127.0.0.1','2017-05-30 20:10:21'),(5,19,'admin@imau.com','127.0.0.1','2017-05-30 20:15:25'),(6,20,'keyan@imau.com','127.0.0.1','2017-05-30 20:20:11'),(7,19,'admin@imau.com','127.0.0.1','2017-05-30 20:24:04'),(8,20,'keyan@imau.com','127.0.0.1','2017-05-30 20:24:37'),(9,19,'admin@imau.com','127.0.0.1','2017-05-30 20:24:56'),(10,19,'admin@imau.com','127.0.0.1','2017-05-30 20:25:50'),(11,19,'admin@imau.com','127.0.0.1','2017-05-30 20:30:57'),(12,19,'admin@imau.com','127.0.0.1','2017-05-30 20:34:27'),(13,19,'admin@imau.com','127.0.0.1','2017-05-30 20:35:57'),(14,19,'admin@imau.com','127.0.0.1','2017-05-30 20:38:27'),(15,19,'admin@imau.com','127.0.0.1','2017-05-30 20:56:29'),(16,19,'admin@imau.com','127.0.0.1','2017-05-30 20:57:22'),(17,19,'admin@imau.com','127.0.0.1','2017-05-30 20:59:52'),(18,19,'admin@imau.com','127.0.0.1','2017-05-30 21:05:58'),(19,19,'admin@imau.com','127.0.0.1','2017-05-30 21:07:50'),(20,19,'admin@imau.com','127.0.0.1','2017-05-30 21:13:09'),(21,19,'admin@imau.com','127.0.0.1','2017-05-30 21:13:26'),(22,19,'admin@imau.com','127.0.0.1','2017-05-30 21:14:14'),(23,20,'keyan@imau.com','127.0.0.1','2017-05-30 21:14:31'),(24,18,'superadmin@imu.com','127.0.0.1','2017-05-30 21:17:17'),(25,18,'superadmin@imu.com','127.0.0.1','2017-05-30 22:54:12'),(26,18,'superadmin@imu.com','127.0.0.1','2017-05-31 10:40:33'),(27,18,'superadmin@imu.com','127.0.0.1','2017-05-31 10:55:58');

#
# Structure for table "tb_media"
#

DROP TABLE IF EXISTS `tb_media`;
CREATE TABLE `tb_media` (
  `M_ID` int(11) NOT NULL AUTO_INCREMENT,
  `M_LX` int(38) NOT NULL,
  `M_YSPM` varchar(30) NOT NULL,
  `M_JLSJ` datetime NOT NULL,
  `M_JLR` varchar(20) NOT NULL,
  `M_SCFR` varchar(20) NOT NULL,
  `M_CFDD` varchar(50) NOT NULL,
  `M_SC` int(11) NOT NULL,
  `M_ZTJL` varchar(500) NOT NULL,
  `M_PATH` varchar(200) NOT NULL,
  `M_COLUMN` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`M_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

#
# Data for table "tb_media"
#

INSERT INTO `tb_media` VALUES (2,1,'asdasdasd','2016-11-02 00:00:00','asdasd','asdasd','asdasdasdasd',23,'asdasdasd','584faeff6859032274dc31c2',NULL),(3,1,'111','2017-04-25 00:00:00','111','111','111',111,'111','59264ec9db30a7efe636e820',NULL),(4,1,'222','2016-12-07 00:00:00','222','222','222',222,'222','584faeff6859032274dc31c2',NULL),(5,1,'333','2016-12-07 00:00:00','333','333','333',333,'333','584faeff6859032274dc31c2',NULL),(6,1,'444','2016-11-10 00:00:00','333','444','444',44,'444','584faeff6859032274dc31c2',NULL),(7,1,'555','2016-11-01 00:00:00','444','444','444',444,'555','584faeff6859032274dc31c2',NULL),(8,1,'777','2016-11-02 00:00:00','666','666','666',666,'666','584faeff6859032274dc31c2',NULL),(9,1,'1532153','2016-09-28 00:00:00','王五','张二','呼市',5,'游行','584faeff6859032274dc31c2',NULL),(10,2,'张一','2016-07-28 00:00:00','王二','李大','呼市',5,'奔腾','584faeff6859032274dc31c2',NULL),(11,1,'123123123','2016-11-09 00:00:00','123123','123123','123123',123123,'1123123','584faeff6859032274dc31c2',NULL),(12,2,'1231231','2016-11-11 00:00:00','123132','123123','123123',123123,'123123','584faeff6859032274dc31c2',NULL),(13,1,'123131231','2016-11-15 00:00:00','李丽','刘莉莉','内财大',6,'传说','584faeff6859032274dc31c2',NULL),(14,2,'123456','2016-08-31 00:00:00','浏览量','威威','农大',4,'什么','584faeff6859032274dc31c2',NULL),(15,1,'asdasd','2016-11-02 00:00:00','asdad','asdasd','asdasd',11,'asdasd','584faeff6859032274dc31c2',NULL),(16,1,'asdasdasdasd','2016-11-02 00:00:00','asdasd','asdasd','asdasd',34,'sadasd','584faeff6859032274dc31c2',NULL),(17,1,'asdads','2016-11-10 00:00:00','asdasd','asdasd','asdasd',11,'sadsda','584faeff6859032274dc31c2',NULL),(18,1,'123123','2016-11-10 00:00:00','123123','123123','123123',123123,'123123','584faeff6859032274dc31c2',NULL),(19,2,'1231231231','2016-11-09 00:00:00','123123','123123','123123',1231231,'123123','584faeff6859032274dc31c2',NULL),(20,1,'12312','2016-11-10 00:00:00','123123','12312','312313',12313,'123123','584faeff6859032274dc31c2',NULL),(21,1,'231213123','2016-11-11 00:00:00','123123','123123','123123',123123,'123123','584faeff6859032274dc31c2',NULL),(22,1,'111111','2016-11-11 00:00:00','1111111','11111111','111',111111111,'111111111','584faeff6859032274dc31c2',NULL),(23,1,'11111111','2016-11-01 00:00:00','1111','111','11111111111111',11111111,'11111111','584faeff6859032274dc31c2',NULL),(24,1,'L1007311','2016-12-07 00:00:00','111','111','111',111,'111','584faeff6859032274dc31c2',NULL),(25,1,'sp001','2016-12-28 00:00:00','sp001','sp001','sp001',11,'sp001','584faeff6859032274dc31c2',NULL);

#
# Structure for table "tb_picture"
#

DROP TABLE IF EXISTS `tb_picture`;
CREATE TABLE `tb_picture` (
  `P_ID` int(11) NOT NULL AUTO_INCREMENT,
  `P_TP` varchar(20) NOT NULL,
  `P_PATH` varchar(200) NOT NULL,
  `P_CC` varchar(20) DEFAULT NULL,
  `P_TT` varchar(500) DEFAULT NULL,
  `P_COLUMN` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

#
# Data for table "tb_picture"
#

INSERT INTO `tb_picture` VALUES (6,'111','5847ee13a389a5bf708ca6ed',NULL,'111',NULL),(19,'333','5847ee13a389a5bf708ca6ed',NULL,'333',NULL),(20,'222','59264dfddb30a7efe636e694',NULL,'222',NULL),(21,'444','5847ee13a389a5bf708ca6ed',NULL,'444',NULL),(22,'555','5847ee13a389a5bf708ca6ed',NULL,'555',NULL),(23,'666','5847ee13a389a5bf708ca6ed',NULL,'666',NULL),(25,'L1007329','5847eebda389a5bf708ca6f3',NULL,'L1007329',NULL),(26,'L1007300','5847eebda389a5bf708ca6f3',NULL,'L1007300',NULL),(27,'L1007301','5847eebda389a5bf708ca6f3',NULL,'L1007301',NULL),(28,'L1007303','5847eebda389a5bf708ca6f3',NULL,'L1007303',NULL),(29,'L1007307','5847eebda389a5bf708ca6f3',NULL,'L1007307',NULL),(30,'L1007309','5847eebda389a5bf708ca6f3',NULL,'L1007309',NULL),(31,'L1007311','5847eebda389a5bf708ca6f3',NULL,'L1007311',NULL),(32,'L1006925','587314e9577005df11da8591',NULL,'L1006925',NULL),(33,'L1006926','587313a9577005df11da84a2',NULL,'L1006926',NULL),(34,'L1006927','587313c0577005df11da84c6',NULL,'L1006927',NULL),(35,'L1006928','587313d3577005df11da84e8',NULL,'L1006928',NULL),(36,'IMG_3910.J','59264ddcdb30a7efe636e650','','',NULL),(37,'lalala','59264df8db30a7efe636e66a','','',NULL),(38,'asdasd','59264e19db30a7efe636e6ab','','',NULL);

#
# Structure for table "tb_resource"
#

DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `S_ID` int(10) NOT NULL AUTO_INCREMENT,
  `S_PARENT_ID` int(10) DEFAULT NULL,
  `S_NAME` varchar(100) NOT NULL,
  `S_SOURCE_KEY` varchar(100) NOT NULL,
  `S_TYPE` int(10) NOT NULL,
  `S_SOURCE_URL` varchar(500) DEFAULT NULL,
  `S_LEVEL` int(10) DEFAULT NULL,
  `S_ICON` varchar(100) DEFAULT NULL,
  `S_IS_HIDE` int(10) DEFAULT '0',
  `S_DESCRIPTION` varchar(100) DEFAULT NULL,
  `S_CREATE_TIME` datetime DEFAULT NULL,
  `S_UPDATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`S_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

#
# Data for table "tb_resource"
#

INSERT INTO `tb_resource` VALUES (1,NULL,'控制台','desktop',0,'/welcome.jsp',1,'fa fa-tachometer',0,'控制台','2016-01-12 17:08:55','2016-02-25 14:07:48'),(2,NULL,'系统基础管理','system',0,NULL,1,'fa fa-list',0,'系统基础管理','2016-01-05 12:11:12','2016-02-25 14:07:48'),(3,2,'用户管理','system:user',0,'/user/listUI.html',2,' ',0,'用户管理','2016-01-08 12:37:10','2016-06-30 20:53:36'),(4,2,'角色管理','system:role',0,'/role/listUI.html',2,' ',0,'角色管理','2016-01-11 22:51:07','2016-06-30 20:53:38'),(5,2,'资源管理','system:resource',0,'/resource/listUI.html',2,' ',0,'资源管理','2016-01-11 22:51:55','2016-06-30 20:53:40'),(6,NULL,'系统监控管理','monitor',0,NULL,1,'fa fa-pencil-square-o',0,'系统监控管理','2016-01-05 12:11:12','2016-02-25 14:07:48'),(7,6,'Sirona监控','monitor:sirona',0,'/sirona',2,' ',0,'Sirona监控','2016-01-05 12:11:12','2016-06-30 20:53:41'),(8,6,'Druid监控','monitor:druid',0,'/druid',2,' ',0,'Druid监控','2016-01-11 22:45:27','2016-06-30 20:53:44'),(9,NULL,'日志信息管理','logininfo',0,NULL,1,'fa fa-tag',0,'日志信息管理','2016-01-11 22:46:39','2016-02-25 14:07:48'),(10,9,'用户登录信息','logininfo:userLogin',0,'/loginInfo/listUI.html',2,' ',0,'用户登录信息','2016-01-11 22:47:41','2016-02-25 14:07:48'),(11,3,'添加','user:add',1,'/user/add.html',3,' ',0,'添加用户','2016-01-22 00:18:40','2016-06-30 20:54:42'),(12,3,'编辑','user:edit',1,'/user/edit.html',3,' ',0,'编辑用户','2016-01-22 00:18:40','2016-06-30 20:54:43'),(13,3,'删除','user:deleteBatch',1,'/user/deleteBatch.html',NULL,NULL,0,'删除用户','2016-02-05 15:26:32','2016-06-30 20:54:44'),(14,3,'重置密码','user:resetPassword',1,'/user/resetPassword.html',NULL,NULL,0,'重置密码','2016-02-27 23:55:13','2016-06-30 20:54:45'),(15,4,'添加','role:add',1,'/role/add.html',NULL,NULL,0,'添加','2016-02-27 23:56:52','2016-06-30 20:54:46'),(16,4,'编辑','role:edit',1,'/role/edit.html',NULL,NULL,0,'编辑','2016-02-27 23:57:35','2016-06-30 20:54:47'),(17,4,'删除','role:deleteBatch',1,'/role/deleteBatch.html ',NULL,NULL,0,'删除','2016-02-27 23:58:02','2016-06-30 20:54:48'),(18,4,'分配权限','role:permission',1,'/role/permission.html',NULL,NULL,0,'分配权限','2016-02-27 23:59:20','2016-06-30 20:54:48'),(19,5,'添加','resource:add',1,'/resource/add.html',NULL,NULL,0,'添加','2016-02-28 00:01:15','2016-06-30 20:54:49'),(20,5,'编辑','resource:edit',1,'/resource/edit.html',NULL,NULL,0,'编辑','2016-02-28 00:02:01','2016-06-30 20:54:50'),(21,5,'删除','resource:deleteBatch',1,'/resource/deleteBatch.html',NULL,NULL,0,'删除','2016-02-28 00:03:03','2016-06-30 20:54:51'),(22,9,'用户操作信息','loginfo:userOperation',0,'/logInfo/listUI.html',NULL,'fa  fa-sticky-note-o',0,'用户操作信息','2016-03-08 22:00:36','2016-07-01 16:14:54'),(24,NULL,'传承人管理','smriti',0,NULL,NULL,'fa fa-child',0,'传承人管理','2016-11-26 00:00:00','2017-01-09 11:15:29'),(25,24,'传承人','smriti:list',0,'/smriti/listUI.html',NULL,'fa fa-child',0,'传承人','2016-11-26 00:00:00','2017-01-09 13:36:32'),(30,NULL,'树形目录管理','foldertree',0,NULL,NULL,'fa  fa-list-ol',0,'树形目录管理','2016-07-17 01:09:27','2016-07-20 16:01:08'),(31,30,'目录管理','foldertree:folderList',0,'/foldertree/listUI.html',NULL,'fa  fa-hourglass',0,'树形目录','2016-07-19 18:51:54','2016-07-26 18:02:14'),(32,NULL,'原始数据管理','originaldata',0,NULL,NULL,'fa  fa-database',0,'原始数据','2016-10-27 14:12:51','2016-10-27 14:10:48'),(33,32,'原始数据','originaldata:list',0,'/originaldata/treelistUI.html',NULL,'fa  fa-database',0,'数据录入','2016-10-27 14:15:06','2016-10-27 14:15:28'),(34,32,'添加','originaldata:add',1,'/originaldata/add.html',NULL,NULL,0,'原始数据录入','2016-11-16 13:56:49','2016-11-16 13:53:57'),(35,32,'编辑','originaldata:edit',1,'/originaldata/edit.html',NULL,NULL,0,'原始数据编辑','2016-11-16 13:55:31','2016-11-16 13:55:33'),(36,32,'删除','originaldata:deleteBatch',1,'/originaldata/deleteBatch.html',NULL,NULL,0,'原始数据删除','2016-11-16 13:56:56','2016-11-16 13:56:47'),(40,NULL,'资源列表','visitor',0,'',NULL,'fa  fa-university',0,'','2017-05-24 19:56:20','2017-05-24 19:56:17'),(41,40,'资源库','visitor:list',0,'/visitor/treelistUI.html',NULL,'fa  fa-university',0,'','2017-05-24 19:58:08','2017-05-24 19:58:08');

#
# Structure for table "tb_resources_role"
#

DROP TABLE IF EXISTS `tb_resources_role`;
CREATE TABLE `tb_resources_role` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `S_ID` int(10) DEFAULT NULL,
  `R_ID` int(10) DEFAULT NULL,
  `T_CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=722 DEFAULT CHARSET=utf8;

#
# Data for table "tb_resources_role"
#

INSERT INTO `tb_resources_role` VALUES (643,2,1,'2017-05-24 19:58:49'),(644,6,1,'2017-05-24 19:58:49'),(645,9,1,'2017-05-24 19:58:49'),(646,3,1,'2017-05-24 19:58:49'),(647,4,1,'2017-05-24 19:58:49'),(648,5,1,'2017-05-24 19:58:49'),(649,24,1,'2017-05-24 19:58:49'),(650,30,1,'2017-05-24 19:58:49'),(651,32,1,'2017-05-24 19:58:49'),(652,40,1,'2017-05-24 19:58:49'),(653,1,1,'2017-05-24 19:58:49'),(654,7,1,'2017-05-24 19:58:49'),(655,8,1,'2017-05-24 19:58:49'),(656,10,1,'2017-05-24 19:58:49'),(657,11,1,'2017-05-24 19:58:49'),(658,12,1,'2017-05-24 19:58:49'),(659,13,1,'2017-05-24 19:58:49'),(660,14,1,'2017-05-24 19:58:49'),(661,15,1,'2017-05-24 19:58:49'),(662,16,1,'2017-05-24 19:58:49'),(663,17,1,'2017-05-24 19:58:49'),(664,18,1,'2017-05-24 19:58:49'),(665,19,1,'2017-05-24 19:58:49'),(666,20,1,'2017-05-24 19:58:49'),(667,21,1,'2017-05-24 19:58:49'),(668,22,1,'2017-05-24 19:58:49'),(669,25,1,'2017-05-24 19:58:49'),(670,31,1,'2017-05-24 19:58:49'),(671,33,1,'2017-05-24 19:58:49'),(672,34,1,'2017-05-24 19:58:49'),(673,35,1,'2017-05-24 19:58:49'),(674,36,1,'2017-05-24 19:58:49'),(675,41,1,'2017-05-24 19:58:49'),(676,40,4,'2017-05-24 19:59:06'),(677,41,4,'2017-05-24 19:59:06'),(688,2,2,'2017-05-25 11:09:26'),(689,9,2,'2017-05-25 11:09:26'),(690,3,2,'2017-05-25 11:09:26'),(691,24,2,'2017-05-25 11:09:26'),(692,30,2,'2017-05-25 11:09:26'),(693,32,2,'2017-05-25 11:09:26'),(694,1,2,'2017-05-25 11:09:26'),(695,10,2,'2017-05-25 11:09:26'),(696,11,2,'2017-05-25 11:09:26'),(697,12,2,'2017-05-25 11:09:26'),(698,13,2,'2017-05-25 11:09:26'),(699,14,2,'2017-05-25 11:09:26'),(700,22,2,'2017-05-25 11:09:26'),(701,25,2,'2017-05-25 11:09:26'),(702,31,2,'2017-05-25 11:09:26'),(703,33,2,'2017-05-25 11:09:26'),(704,34,2,'2017-05-25 11:09:26'),(705,35,2,'2017-05-25 11:09:26'),(706,36,2,'2017-05-25 11:09:26'),(715,24,3,'2017-05-30 17:47:35'),(716,32,3,'2017-05-30 17:47:35'),(717,1,3,'2017-05-30 17:47:35'),(718,25,3,'2017-05-30 17:47:35'),(719,33,3,'2017-05-30 17:47:35'),(720,34,3,'2017-05-30 17:47:35'),(721,35,3,'2017-05-30 17:47:35');

#
# Structure for table "tb_role"
#

DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `R_ID` int(10) NOT NULL AUTO_INCREMENT,
  `R_NAME` varchar(50) NOT NULL,
  `R_KEY` varchar(50) NOT NULL,
  `R_STATUS` int(10) DEFAULT '0',
  `R_DESCRIPTION` varchar(100) DEFAULT NULL,
  `R_CREATE_TIME` datetime DEFAULT NULL,
  `R_UPDATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`R_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "tb_role"
#

INSERT INTO `tb_role` VALUES (1,'高级管理员','administrator',0,'高级管理员','2016-09-25 12:07:42','2016-09-25 22:30:15'),(2,'科研主任','admin',0,'科研主任','2016-09-25 12:07:42','2016-09-25 22:30:22'),(3,'科研员','researcher',0,'科研员','2016-09-25 17:09:40','2016-09-25 22:55:36'),(4,'访客用户','visitor',0,'访客用户','2016-09-25 19:07:45','2016-09-25 20:16:12');

#
# Structure for table "tb_role_user"
#

DROP TABLE IF EXISTS `tb_role_user`;
CREATE TABLE `tb_role_user` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `R_ID` int(10) DEFAULT NULL,
  `U_ID` int(10) DEFAULT NULL,
  `T_CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

#
# Data for table "tb_role_user"
#

INSERT INTO `tb_role_user` VALUES (28,1,18,'2016-10-05 22:30:19'),(29,4,21,'2017-05-24 13:57:01'),(30,4,22,'2017-05-25 11:07:15'),(31,3,23,'2017-05-25 11:10:44'),(32,2,24,'2017-05-30 17:48:55'),(33,2,19,'2017-05-30 18:01:13'),(34,3,20,'2017-05-30 18:03:39');

#
# Structure for table "tb_user"
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `U_ID` int(10) NOT NULL AUTO_INCREMENT,
  `U_NAME` varchar(100) NOT NULL,
  `U_ACCOUNT_NAME` varchar(100) NOT NULL,
  `U_PASSWORD` varchar(100) NOT NULL,
  `U_DELETE_STATUS` int(10) DEFAULT '0',
  `U_LOCKED` int(10) DEFAULT '0',
  `U_DESCRIPTION` varchar(200) DEFAULT NULL,
  `U_CREDENTIALS_SALT` varchar(500) NOT NULL,
  `U_CREATOR_NAME` varchar(100) NOT NULL,
  `U_CREATE_TIME` datetime DEFAULT NULL,
  `U_UPDATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "tb_user"
#

INSERT INTO `tb_user` VALUES (18,'初始高级管理员','superadmin@imu.com','TVlUZxTMvQtihuNE6TCMOQ==',0,0,'初始高级管理员','5346095fa7a248202cb841ed671e4e45','superadmin@imu.com','2016-10-05 22:31:58','2016-10-05 22:30:13'),(19,'科研主任','admin@imau.com','fYz6SBAeVYCeoaT5xTtSpA==',0,0,'科研主任','8d62eea86ae16f22f110ecb47974d2cf','superadmin@imu.com','2017-05-30 18:01:12','2017-05-30 18:01:13'),(20,'科研员','keyan@imau.com','z+TGFtIrwhLJsEVZQ1S6fQ==',0,0,'科研员','7b8f8cb0814ef67f4b16dda2fb232020','admin@imau.com','2017-05-30 18:03:38','2017-05-30 18:03:39');

#
# Structure for table "tb_user_info"
#

DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info` (
  `U_ID` int(10) NOT NULL,
  `U_SEX` int(10) DEFAULT NULL,
  `U_BIRTHDAY` datetime DEFAULT NULL,
  `U_TELEPHONE` varchar(20) DEFAULT NULL,
  `U_EMAIL` varchar(50) DEFAULT NULL,
  `U_ADDRESS` varchar(200) DEFAULT NULL,
  `U_CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_user_info"
#

INSERT INTO `tb_user_info` VALUES (18,1,'2016-09-25 00:00:00','13888888888','superadmin@imu.com','内蒙古呼和浩特市大学西路235号','2016-09-25 16:43:28'),(19,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,NULL,NULL,NULL,NULL,NULL);
