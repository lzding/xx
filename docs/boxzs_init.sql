-- MySQL dump 10.13  Distrib 5.6.23, for osx10.9 (x86_64)
--
-- Host: 10.0.0.78    Database: boxzs
-- ------------------------------------------------------
-- Server version	5.5.25-log

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
-- Table structure for table `action_pool`
--

DROP TABLE IF EXISTS `action_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL DEFAULT '',
  `action_id` int(11) NOT NULL COMMENT '执行接口映射ID',
  `action_path` varchar(10) NOT NULL DEFAULT '' COMMENT '执行路径',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '执行动作：0，默认不操作；1，actionTarget为GameID；2，actionTarget获取数据接口；3，actionTarget网页超链接，浏览器打开，4；actionTarget为Internet',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_id` int(11) NOT NULL COMMENT '显示样式',
  `position` int(11) NOT NULL DEFAULT '-1' COMMENT '显示位置',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '0：显示，1：隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `click_rank`
--

DROP TABLE IF EXISTS `click_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `click_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `gametype` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `real_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '真实榜单数据',
  `op_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '运营数据',
  PRIMARY KEY (`id`),
  KEY `IDX_GAME_RANK_GAME_ID` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `click_statistics`
--

DROP TABLE IF EXISTS `click_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `click_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `gametype` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_GAME_CLICK_STASTICS_GAME_ID` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL DEFAULT '' COMMENT '厂商名称',
  `picture` varchar(128) NOT NULL DEFAULT '' COMMENT '厂商图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `download_rank`
--

DROP TABLE IF EXISTS `download_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `gametype` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `real_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '真实榜单数据',
  `op_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '运营数据',
  PRIMARY KEY (`id`),
  KEY `IDX_DOWNLOAD_RANK_GAME_ID` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `download_statistics`
--

DROP TABLE IF EXISTS `download_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `gametype` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_GAME_DOWNLOAD_STASTICS_GAME_ID` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(15) NOT NULL DEFAULT '' COMMENT '游戏名称',
  `size` bigint(11) NOT NULL DEFAULT '0' COMMENT '包大小',
  `gametype` int(11) NOT NULL DEFAULT '0' COMMENT '游戏类型',
  `icon` varchar(128) NOT NULL DEFAULT '' COMMENT '游戏icon图标',
  `picture` varchar(128) NOT NULL DEFAULT '' COMMENT '图片',
  `content` varchar(256) NOT NULL DEFAULT '' COMMENT '游戏描述',
  `createtime` date NOT NULL COMMENT '游戏上线时间，录入时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `company_id` int(11) NOT NULL DEFAULT '-1' COMMENT '游戏厂商id',
  `version` varchar(10) NOT NULL DEFAULT '' COMMENT '游戏版本号',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0：上线，1：未上线',
  `need_internet` int(11) NOT NULL DEFAULT '0' COMMENT '0：不需要网络 ，1：需要网络',
  `need_google` int(11) NOT NULL DEFAULT '0' COMMENT '0:不需要google，1：需要google',
  `free` int(11) NOT NULL DEFAULT '0' COMMENT '0：面内购，1：有内购',
  `need_vpn` int(11) NOT NULL DEFAULT '0' COMMENT '0：不需要vpn，1：需要vpn',
  `Chinese` int(11) NOT NULL DEFAULT '0' COMMENT '0：未汉化，1：汉化',
  `download_url` varchar(128) NOT NULL DEFAULT '' COMMENT '第一下载源',
  `download_url_second` varchar(128) NOT NULL DEFAULT '' COMMENT '第二下载源',
  `download_url_share` varchar(128) NOT NULL DEFAULT '' COMMENT '分享下载源',
  `share_url_pwd` varchar(30) NOT NULL DEFAULT '' COMMENT '分享链接密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_comment`
--

DROP TABLE IF EXISTS `game_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(100) NOT NULL DEFAULT '' COMMENT '评论',
  `platform` varchar(20) NOT NULL DEFAULT '' COMMENT '机型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_detail`
--

DROP TABLE IF EXISTS `game_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `editor` varchar(10) NOT NULL DEFAULT '' COMMENT '编辑',
  `editor_pic` varchar(128) NOT NULL DEFAULT '' COMMENT '编辑者头像',
  `content` varchar(50) NOT NULL DEFAULT '' COMMENT '小编编辑内容',
  `crack_info` varchar(128) NOT NULL DEFAULT '' COMMENT '破解描述信息',
  `test_cellphone_list` varchar(50) NOT NULL DEFAULT '' COMMENT '破解机型',
  `comefrom` varchar(15) NOT NULL DEFAULT '' COMMENT '来源',
  PRIMARY KEY (`id`),
  KEY `IDX_GAME_DEGAIL_GAME_ID` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_detail_pic`
--

DROP TABLE IF EXISTS `game_detail_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_detail_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `picture` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_GAME_DETAIL_PIC_GAME_ID` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_type`
--

DROP TABLE IF EXISTS `game_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL DEFAULT '' COMMENT '游戏类别描述',
  `picture` varchar(128) NOT NULL DEFAULT '' COMMENT '类别图片',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0：正常分类,1：特色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL COMMENT '页面ID',
  `title` varchar(10) NOT NULL COMMENT '页面标题',
  `card_ids` varchar(20) NOT NULL COMMENT 'card集合',
  `action_id` int(11) DEFAULT NULL COMMENT '资源地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL COMMENT '哪种类型的风格，0：banner，1：数据列表，2：工具栏，3：专题',
  `sub_type` int(11) NOT NULL COMMENT '子类型，某个类型的具体展现',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_style`
--

DROP TABLE IF EXISTS `sub_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-12 16:53:50
