-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: springboot212h6
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `springboot212h6`
--

/*!40000 DROP DATABASE IF EXISTS `springboot212h6`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `springboot212h6` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `springboot212h6`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg'),(2,'picture2','upload/picture2.jpg'),(3,'picture3','upload/picture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '测试模板名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '测试模板状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='测试模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1,'2022-03-16 08:17:38','十万个为什么',60,1);
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属测试模板id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '测试模板名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1,'2022-03-16 08:17:38',1,'十万个为什么','下面动物不属于昆虫的是（）。','[{\"text\":\"A.苍蝇\",\"code\":\"A\"},{\"text\":\"B.蜜蜂\",\"code\":\"B\"},{\"text\":\"C.蜂鸟\",\"code\":\"C\"}]',20,'C','蜂鸟',0,1),(2,'2022-03-16 08:17:38',1,'十万个为什么','油着火后可以用水扑灭。','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',20,'B','油着火后不可以用水扑灭',2,2),(3,'2022-03-16 08:17:38',1,'十万个为什么','地球是个球体，中间是（ ）。','[]',30,'赤道','赤道',3,3),(4,'2022-03-16 08:17:38',1,'十万个为什么','下面动物中会流汗的有（ ）。','[{\"text\":\"A.马\",\"code\":\"A\"},{\"text\":\"B.猫\",\"code\":\"B\"},{\"text\":\"C.狗\",\"code\":\"C\"}]',30,'A,B','狗不会流汗',1,4);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '测试模板id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '测试模板名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419203460 DEFAULT CHARSET=utf8 COMMENT='考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
INSERT INTO `examrecord` VALUES (1647418866645,'2022-03-16 08:21:05',11,'用户姓名1',1,'十万个为什么',1,'下面动物不属于昆虫的是（）。','[{\"text\":\"A.苍蝇\",\"code\":\"A\"},{\"text\":\"B.蜜蜂\",\"code\":\"B\"},{\"text\":\"C.蜂鸟\",\"code\":\"C\"}]',20,'C','蜂鸟',20,'C'),(1647418874197,'2022-03-16 08:21:13',11,'用户姓名1',1,'十万个为什么',2,'油着火后可以用水扑灭。','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',20,'B','油着火后不可以用水扑灭',20,'B'),(1647418887246,'2022-03-16 08:21:26',11,'用户姓名1',1,'十万个为什么',3,'地球是个球体，中间是（ ）。','[]',30,'赤道','赤道',30,'赤道'),(1647418894061,'2022-03-16 08:21:33',11,'用户姓名1',1,'十万个为什么',4,'下面动物中会流汗的有（ ）。','[{\"text\":\"A.马\",\"code\":\"A\"},{\"text\":\"B.猫\",\"code\":\"B\"},{\"text\":\"C.狗\",\"code\":\"C\"}]',30,'A,B','狗不会流汗',30,'A,B'),(1647419185652,'2022-03-16 08:26:25',12,'用户姓名2',1,'十万个为什么',1,'下面动物不属于昆虫的是（）。','[{\"text\":\"A.苍蝇\",\"code\":\"A\"},{\"text\":\"B.蜜蜂\",\"code\":\"B\"},{\"text\":\"C.蜂鸟\",\"code\":\"C\"}]',20,'C','蜂鸟',20,'C'),(1647419191702,'2022-03-16 08:26:31',12,'用户姓名2',1,'十万个为什么',2,'油着火后可以用水扑灭。','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',20,'B','油着火后不可以用水扑灭',20,'B'),(1647419198284,'2022-03-16 08:26:38',12,'用户姓名2',1,'十万个为什么',3,'地球是个球体，中间是（ ）。','[]',30,'赤道','赤道',30,'赤道'),(1647419203459,'2022-03-16 08:26:42',12,'用户姓名2',1,'十万个为什么',4,'下面动物中会流汗的有（ ）。','[{\"text\":\"A.马\",\"code\":\"A\"},{\"text\":\"B.猫\",\"code\":\"B\"},{\"text\":\"C.狗\",\"code\":\"C\"}]',30,'A,B','狗不会流汗',30,'A,B');
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gonggaoxinxi`
--

DROP TABLE IF EXISTS `gonggaoxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gonggaoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `gonggaoneirong` longtext COMMENT '公告内容',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419535625 DEFAULT CHARSET=utf8 COMMENT='公告信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gonggaoxinxi`
--

LOCK TABLES `gonggaoxinxi` WRITE;
/*!40000 ALTER TABLE `gonggaoxinxi` DISABLE KEYS */;
INSERT INTO `gonggaoxinxi` VALUES (31,'2022-03-16 08:17:38','标题1','upload/gonggaoxinxi_fengmian1.jpg','公告内容1','2022-03-16'),(32,'2022-03-16 08:17:38','标题2','upload/gonggaoxinxi_fengmian2.jpg','公告内容2','2022-03-16'),(33,'2022-03-16 08:17:38','标题3','upload/gonggaoxinxi_fengmian3.jpg','公告内容3','2022-03-16'),(34,'2022-03-16 08:17:38','标题4','upload/gonggaoxinxi_fengmian4.jpg','公告内容4','2022-03-16'),(35,'2022-03-16 08:17:38','标题5','upload/gonggaoxinxi_fengmian5.jpg','公告内容5','2022-03-16'),(36,'2022-03-16 08:17:38','标题6','upload/gonggaoxinxi_fengmian6.jpg','公告内容6','2022-03-16'),(1647419535624,'2022-03-16 08:32:15','测试','upload/1647419528524.jpg','<p>测试</p>','2022-03-16');
/*!40000 ALTER TABLE `gonggaoxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,11,'用户账号1','yonghu','用户','jiqc8nudckntkh54kujpzmtghlknxvxe','2022-03-16 08:18:54','2022-03-16 09:18:55'),(2,21,'医生账号1','yisheng','医生','zt3hz97dhjykstxu4ntwfvgvu8fzy6z8','2022-03-16 08:22:23','2022-03-16 09:29:04'),(3,1,'abo','users','管理员','kdpv14idxk6612davmegjb2lwex5rwmv','2022-03-16 08:23:41','2022-03-16 09:29:56'),(4,12,'用户账号2','yonghu','用户','3m7idjt42qk5yhm5jzv4tdwgqy9dqxre','2022-03-16 08:25:40','2022-03-16 09:25:41'),(5,22,'医生账号2','yisheng','医生','x0ufp1qsezoci3822hn2ciyjr7ueeepx','2022-03-16 08:28:33','2022-03-16 09:28:34');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2022-03-16 08:17:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yisheng`
--

DROP TABLE IF EXISTS `yisheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yisheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yishengzhanghao` varchar(200) NOT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) DEFAULT NULL COMMENT '医生姓名',
  `mima` varchar(200) DEFAULT NULL COMMENT '密码',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihao` varchar(200) DEFAULT NULL COMMENT '手机号',
  `yishengzhiwei` varchar(200) DEFAULT NULL COMMENT '医生职位',
  `yishengjianjie` longtext COMMENT '医生简介',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yishengzhanghao` (`yishengzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419492738 DEFAULT CHARSET=utf8 COMMENT='医生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yisheng`
--

LOCK TABLES `yisheng` WRITE;
/*!40000 ALTER TABLE `yisheng` DISABLE KEYS */;
INSERT INTO `yisheng` VALUES (21,'2022-03-16 08:17:38','医生账号1','医生姓名1','123456','男','13823888881','医生职位1','医生简介1','upload/yisheng_touxiang1.jpg','是',''),(22,'2022-03-16 08:17:38','医生账号2','医生姓名2','123456','男','13823888882','医生职位2','医生简介2','upload/yisheng_touxiang2.jpg','是',''),(23,'2022-03-16 08:17:38','医生账号3','医生姓名3','123456','男','13823888883','医生职位3','医生简介3','upload/yisheng_touxiang3.jpg','是',''),(24,'2022-03-16 08:17:38','医生账号4','医生姓名4','123456','男','13823888884','医生职位4','医生简介4','upload/yisheng_touxiang4.jpg','是',''),(25,'2022-03-16 08:17:38','医生账号5','医生姓名5','123456','男','13823888885','医生职位5','医生简介5','upload/yisheng_touxiang5.jpg','是',''),(26,'2022-03-16 08:17:38','医生账号6','医生姓名6','123456','男','13823888886','医生职位6','医生简介6','upload/yisheng_touxiang6.jpg','是',''),(1647419492737,'2022-03-16 08:31:32','1234','王医生','1111','女','12345678944','医师',NULL,'upload/1647419488230.jpg','是','US大按实际');
/*!40000 ALTER TABLE `yisheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `mima` varchar(200) DEFAULT NULL COMMENT '密码',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihao` varchar(200) DEFAULT NULL COMMENT '手机号',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419439248 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (11,'2022-03-16 08:17:38','用户账号1','用户姓名1','123456','女','13823888881','upload/yonghu_touxiang1.jpg'),(12,'2022-03-16 08:17:38','用户账号2','用户姓名2','123456','女','13823888882','upload/yonghu_touxiang2.jpg'),(13,'2022-03-16 08:17:38','用户账号3','用户姓名3','123456','男','13823888883','upload/yonghu_touxiang3.jpg'),(14,'2022-03-16 08:17:38','用户账号4','用户姓名4','123456','男','13823888884','upload/yonghu_touxiang4.jpg'),(15,'2022-03-16 08:17:38','用户账号5','用户姓名5','123456','男','13823888885','upload/yonghu_touxiang5.jpg'),(16,'2022-03-16 08:17:38','用户账号6','用户姓名6','123456','男','13823888886','upload/yonghu_touxiang6.jpg'),(1647419439247,'2022-03-16 08:30:39','001','李胜','1111','男','12345678901','upload/1647419438709.jpg');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhenduanjilu`
--

DROP TABLE IF EXISTS `zhenduanjilu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhenduanjilu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `zhenduanneirong` varchar(200) DEFAULT NULL COMMENT '诊断内容',
  `yishengzhanghao` varchar(200) DEFAULT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) DEFAULT NULL COMMENT '医生姓名',
  `zhenduanshijian` datetime DEFAULT NULL COMMENT '诊断时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419380850 DEFAULT CHARSET=utf8 COMMENT='诊断记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhenduanjilu`
--

LOCK TABLES `zhenduanjilu` WRITE;
/*!40000 ALTER TABLE `zhenduanjilu` DISABLE KEYS */;
INSERT INTO `zhenduanjilu` VALUES (51,'2022-03-16 08:17:38','用户账号1','用户姓名1','','医生账号1','医生姓名1','2022-03-16 16:17:38'),(52,'2022-03-16 08:17:38','用户账号2','用户姓名2','','医生账号2','医生姓名2','2022-03-16 16:17:38'),(53,'2022-03-16 08:17:38','用户账号3','用户姓名3','','医生账号3','医生姓名3','2022-03-16 16:17:38'),(54,'2022-03-16 08:17:38','用户账号4','用户姓名4','','医生账号4','医生姓名4','2022-03-16 16:17:38'),(55,'2022-03-16 08:17:38','用户账号5','用户姓名5','','医生账号5','医生姓名5','2022-03-16 16:17:38'),(56,'2022-03-16 08:17:38','用户账号6','用户姓名6','','医生账号6','医生姓名6','2022-03-16 16:17:38'),(1647419380849,'2022-03-16 08:29:40','用户账号2','用户姓名2','upload/1647419379291.jpeg','医生账号1','医生姓名1','2022-03-16 16:29:52');
/*!40000 ALTER TABLE `zhenduanjilu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zixunxinxi`
--

DROP TABLE IF EXISTS `zixunxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zixunxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yishengzhanghao` varchar(200) DEFAULT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) DEFAULT NULL COMMENT '医生姓名',
  `yishengzhiwei` varchar(200) DEFAULT NULL COMMENT '医生职位',
  `zixunneirong` longtext COMMENT '资询内容',
  `zixunshijian` datetime DEFAULT NULL COMMENT '咨询时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419162610 DEFAULT CHARSET=utf8 COMMENT='咨询信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zixunxinxi`
--

LOCK TABLES `zixunxinxi` WRITE;
/*!40000 ALTER TABLE `zixunxinxi` DISABLE KEYS */;
INSERT INTO `zixunxinxi` VALUES (41,'2022-03-16 08:17:38','医生账号1','医生姓名1','医生职位1','资询内容1','2022-03-16 16:17:38','用户账号1','用户姓名1','是',''),(42,'2022-03-16 08:17:38','医生账号2','医生姓名2','医生职位2','资询内容2','2022-03-16 16:17:38','用户账号2','用户姓名2','是',''),(43,'2022-03-16 08:17:38','医生账号3','医生姓名3','医生职位3','资询内容3','2022-03-16 16:17:38','用户账号3','用户姓名3','是',''),(44,'2022-03-16 08:17:38','医生账号4','医生姓名4','医生职位4','资询内容4','2022-03-16 16:17:38','用户账号4','用户姓名4','是',''),(45,'2022-03-16 08:17:38','医生账号5','医生姓名5','医生职位5','资询内容5','2022-03-16 16:17:38','用户账号5','用户姓名5','是',''),(46,'2022-03-16 08:17:38','医生账号6','医生姓名6','医生职位6','资询内容6','2022-03-16 16:17:38','用户账号6','用户姓名6','是',''),(1647418843083,'2022-03-16 08:20:42','医生账号1','医生姓名1','医生职位1','<p><img src=\"../../../upload/1647418839672.jpeg\" /></p>','2022-03-16 16:19:39','用户账号1','用户姓名1','是','京东方建设路口'),(1647419162609,'2022-03-16 08:26:02','医生账号1','医生姓名1','医生职位1','<p><img src=\"../../../upload/1647419160764.jpeg\" /></p>','2022-03-16 16:26:08','用户账号2','用户姓名2','是','卡死了看到');
/*!40000 ALTER TABLE `zixunxinxi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-25 20:36:45
