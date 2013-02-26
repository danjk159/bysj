-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 01 月 11 日 20:40
-- 服务器版本: 5.5.28
-- PHP 版本: 5.4.6-1ubuntu1.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ShareDocuments`
--

DELIMITER $$
--
-- 存储过程
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `f5`()
begin
select column_name from information_schema.columns where table_name = 'test';
delete from Apriori;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `f6`()
begin
DECLARE done INT DEFAULT 0;
declare Name1 varchar(32);
declare DocumentsId1 INT;
DECLARE cur CURSOR FOR (select distinct Name,DocumentsId from UserLog where DocumentsId is not null order by Name,DocumentsId);
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
OPEN cur;
repeat
    FETCH cur into Name1,DocumentsId1;
    if not done then
        if not exists(select * from test where name=Name1) then
           insert into test(name) values(Name1);
        end if;
        if not exists(select * from information_schema.columns where table_name = 'test' and column_name=concat('Id_',DocumentsId1)) then 
            set @stmt=concat(' alter table test add column Id_',DocumentsId1,' INT NULL DEFAULT 0;');
            prepare s from @stmt;
            execute s;     
        end if;
        set @stmt=concat(' update test set Id_',DocumentsId1,'=1 where name=''',Name1,''';');
        prepare s from @stmt;
        execute s;
    end if;
    UNTIL done END REPEAT;
CLOSE cur;
select * from test;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `Apriori`
--

CREATE TABLE IF NOT EXISTS `Apriori` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=219 ;

--
-- 转存表中的数据 `Apriori`
--

INSERT INTO `Apriori` (`Id`, `Name`) VALUES
(110, ',6,14,16,'),
(111, ',6,14,17,'),
(112, ',6,14,7,'),
(113, ',6,14,8,'),
(114, ',6,14,18,'),
(115, ',6,15,16,'),
(116, ',6,15,19,'),
(117, ',6,16,17,'),
(118, ',6,16,7,'),
(119, ',6,16,8,'),
(120, ',6,16,9,'),
(121, ',6,16,13,'),
(122, ',6,16,18,'),
(123, ',6,16,19,'),
(124, ',6,17,7,'),
(125, ',6,17,8,'),
(126, ',6,17,18,'),
(127, ',6,7,8,'),
(128, ',6,7,18,'),
(129, ',6,8,18,'),
(130, ',6,9,13,'),
(131, ',14,16,17,'),
(132, ',14,16,7,'),
(133, ',14,16,8,'),
(134, ',14,16,18,'),
(135, ',14,17,7,'),
(136, ',14,17,8,'),
(137, ',14,17,18,'),
(138, ',14,7,8,'),
(139, ',14,7,18,'),
(140, ',14,8,18,'),
(141, ',15,16,19,'),
(142, ',16,17,7,'),
(143, ',16,17,8,'),
(144, ',16,17,18,'),
(145, ',16,7,8,'),
(146, ',16,7,18,'),
(147, ',16,8,18,'),
(148, ',16,9,13,'),
(149, ',17,7,8,'),
(150, ',17,7,18,'),
(151, ',17,8,18,'),
(152, ',7,8,18,'),
(153, ',6,14,16,17,'),
(154, ',6,14,16,7,'),
(155, ',6,14,16,8,'),
(156, ',6,14,16,18,'),
(157, ',6,14,17,7,'),
(158, ',6,14,17,8,'),
(159, ',6,14,17,18,'),
(160, ',6,14,7,8,'),
(161, ',6,14,7,18,'),
(162, ',6,14,8,18,'),
(163, ',6,15,16,19,'),
(164, ',6,16,17,7,'),
(165, ',6,16,17,8,'),
(166, ',6,16,17,18,'),
(167, ',6,16,7,8,'),
(168, ',6,16,7,18,'),
(169, ',6,16,8,18,'),
(170, ',6,16,9,13,'),
(171, ',6,17,7,8,'),
(172, ',6,17,7,18,'),
(173, ',6,17,8,18,'),
(174, ',6,7,8,18,'),
(175, ',14,16,17,7,'),
(176, ',14,16,17,8,'),
(177, ',14,16,17,18,'),
(178, ',14,16,7,8,'),
(179, ',14,16,7,18,'),
(180, ',14,16,8,18,'),
(181, ',14,17,7,8,'),
(182, ',14,17,7,18,'),
(183, ',14,17,8,18,'),
(184, ',14,7,8,18,'),
(185, ',16,17,7,8,'),
(186, ',16,17,7,18,'),
(187, ',16,17,8,18,'),
(188, ',16,7,8,18,'),
(189, ',17,7,8,18,'),
(190, ',6,14,16,17,7,'),
(191, ',6,14,16,17,8,'),
(192, ',6,14,16,17,18,'),
(193, ',6,14,16,7,8,'),
(194, ',6,14,16,7,18,'),
(195, ',6,14,16,8,18,'),
(196, ',6,14,17,7,8,'),
(197, ',6,14,17,7,18,'),
(198, ',6,14,17,8,18,'),
(199, ',6,14,7,8,18,'),
(200, ',6,16,17,7,8,'),
(201, ',6,16,17,7,18,'),
(202, ',6,16,17,8,18,'),
(203, ',6,16,7,8,18,'),
(204, ',6,17,7,8,18,'),
(205, ',14,16,17,7,8,'),
(206, ',14,16,17,7,18,'),
(207, ',14,16,17,8,18,'),
(208, ',14,16,7,8,18,'),
(209, ',14,17,7,8,18,'),
(210, ',16,17,7,8,18,'),
(211, ',6,14,16,17,7,8,'),
(212, ',6,14,16,17,7,18,'),
(213, ',6,14,16,17,8,18,'),
(214, ',6,14,16,7,8,18,'),
(215, ',6,14,17,7,8,18,'),
(216, ',6,16,17,7,8,18,'),
(217, ',14,16,17,7,8,18,'),
(218, ',6,14,16,17,7,8,18,');

-- --------------------------------------------------------

--
-- 表的结构 `Commentary`
--

CREATE TABLE IF NOT EXISTS `Commentary` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `Name` varchar(32) NOT NULL COMMENT '评论人',
  `DocumentsId` int(11) NOT NULL COMMENT '被评论的文档Id',
  `OperateTime` datetime NOT NULL COMMENT '评论时间',
  `Context` text COMMENT '内容',
  `Recommendation` int(11) DEFAULT NULL COMMENT '推荐星级，值：1-10',
  `UD0` varchar(64) DEFAULT NULL,
  `UD1` varchar(64) DEFAULT NULL,
  `UD2` varchar(64) DEFAULT NULL,
  `UD3` varchar(64) DEFAULT NULL,
  `UD4` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='评论表' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `Commentary`
--

INSERT INTO `Commentary` (`Id`, `Name`, `DocumentsId`, `OperateTime`, `Context`, `Recommendation`, `UD0`, `UD1`, `UD2`, `UD3`, `UD4`) VALUES
(15, 'Up', 1, '2012-12-11 00:00:00', 'Up', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'admin', 6, '2013-01-01 00:00:00', 'sdfsdf', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'admin', 7, '2013-01-04 00:00:00', ' nbgvnvn', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'admin123', 6, '2013-01-11 00:00:00', 'ngfgffgjhhghj', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `Documents`
--

CREATE TABLE IF NOT EXISTS `Documents` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `Name` varchar(64) NOT NULL COMMENT '文档名',
  `Author` varchar(32) DEFAULT NULL COMMENT '作者，上传人',
  `Date` datetime NOT NULL COMMENT '上传时间',
  `Contents` text COMMENT '描述',
  `Views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `Image` varchar(64) DEFAULT NULL COMMENT '图片地址',
  `UD0` varchar(64) DEFAULT NULL,
  `UD1` varchar(64) DEFAULT NULL,
  `UD2` varchar(64) DEFAULT NULL,
  `UD3` varchar(64) DEFAULT NULL,
  `UD4` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `[Name]` (`Name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文档表' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `Documents`
--

INSERT INTO `Documents` (`Id`, `Name`, `Author`, `Date`, `Contents`, `Views`, `Image`, `UD0`, `UD1`, `UD2`, `UD3`, `UD4`) VALUES
(6, 'kjk', 'er', '2094-12-01 00:00:00', '2', 7, '/upload/image/kjk.jpg', '', NULL, NULL, NULL, NULL),
(7, '55', '22', '2012-02-05 00:00:00', '4', 2, '/upload/image/55.jpg', '', NULL, NULL, NULL, NULL),
(8, 'fdf', '222', '2012-12-13 00:00:00', '222', 228, 'sdfsdf', '/upload/file/fdf.bak', NULL, NULL, NULL, NULL),
(9, 'dddd', 'ssss', '2012-12-04 00:00:00', 'sss', 224, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'gggff', 'hgkkh', '2012-12-21 00:00:00', 'cccc', 443534, '', NULL, NULL, NULL, NULL, NULL),
(11, 'fsfsd', 'sdfsd', '2012-12-05 00:00:00', 'sdfsd', 2222, 'fsfsd.jpg', 'fsfsd.0', NULL, NULL, NULL, NULL),
(13, 'nnn', 'nnn', '2012-12-25 00:00:00', 'nnnn', 45346, '/upload/image/nnn.jpg', '/upload/file/nnn.0', NULL, NULL, NULL, NULL),
(14, 'ffddd', 'fff', '2012-11-27 00:00:00', 'fff', 44, '/upload/image/ffddd.jpg', '/upload/file/ffddd.0', NULL, NULL, NULL, NULL),
(15, 'fffd', 'dddf', '2012-12-12 00:00:00', 'dff', 445, '/upload/image/fffd.jpg', '/upload/file/fffd.jpg', NULL, NULL, NULL, NULL),
(16, 'nnnjh', 'nnn', '2012-12-12 00:00:00', 'mnbm', 455, '/upload/image/nnnjh.jpg', '/upload/file/nnnjh.0', NULL, NULL, NULL, NULL),
(17, 'dfgdf', 'dfg', '2013-01-29 00:00:00', 'dfg', 425, '/upload/image/dfgdf.jpg', '/upload/file/dfgdf.jar', NULL, NULL, NULL, NULL),
(18, 'ccc', 'asd', '2013-01-09 00:00:00', 'asd', 33, '/upload/image/ccc.jpg', '/upload/file/ccc.bak', NULL, NULL, NULL, NULL),
(19, 'dfg', 'admin123', '2013-01-15 00:00:00', 'sgsdfg', 1236, '/upload/image/dfg.jpg', '/upload/file/dfg.0', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `name` varchar(32) NOT NULL,
  `Id_6` int(11) DEFAULT '0',
  `Id_14` int(11) DEFAULT '0',
  `Id_15` int(11) DEFAULT '0',
  `Id_16` int(11) DEFAULT '0',
  `Id_17` int(11) DEFAULT '0',
  `Id_7` int(11) DEFAULT '0',
  `Id_8` int(11) DEFAULT '0',
  `Id_9` int(11) DEFAULT '0',
  `Id_13` int(11) DEFAULT '0',
  `Id_18` int(11) DEFAULT '0',
  `Id_19` int(11) DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `test`
--

INSERT INTO `test` (`name`, `Id_6`, `Id_14`, `Id_15`, `Id_16`, `Id_17`, `Id_7`, `Id_8`, `Id_9`, `Id_13`, `Id_18`, `Id_19`) VALUES
('111', 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0),
('admin', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('admin123', 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `UserLog`
--

CREATE TABLE IF NOT EXISTS `UserLog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `Name` varchar(32) NOT NULL COMMENT '登录名',
  `DocumentsId` int(11) DEFAULT NULL COMMENT '文档Id',
  `OperateTime` datetime NOT NULL COMMENT '操作时间',
  `Operate` varchar(128) NOT NULL COMMENT '操作描述',
  `Type` int(11) NOT NULL COMMENT '操作类型0:未定义操作1：登录日志；2：文档操作日志；3：浏览日志；4：评论日志；',
  `UD0` varchar(64) DEFAULT NULL,
  `UD1` varchar(64) DEFAULT NULL,
  `UD2` varchar(64) DEFAULT NULL,
  `UD3` varchar(64) DEFAULT NULL,
  `UD4` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户日志表' AUTO_INCREMENT=200 ;

--
-- 转存表中的数据 `UserLog`
--

INSERT INTO `UserLog` (`Id`, `Name`, `DocumentsId`, `OperateTime`, `Operate`, `Type`, `UD0`, `UD1`, `UD2`, `UD3`, `UD4`) VALUES
(1, 'UnLogin', NULL, '2012-12-24 00:00:00', 'UnLogin??Id?6???kjk???', 2, NULL, NULL, NULL, NULL, NULL),
(2, 'UnLogin', NULL, '2012-12-27 00:00:00', 'UnLogin删除Id为7标题为55的文档', 2, NULL, NULL, NULL, NULL, NULL),
(3, 'UnLogin', NULL, '2012-12-27 00:00:00', 'UnLogin删除Id为7标题为55的文档', 2, NULL, NULL, NULL, NULL, NULL),
(4, 'UnLogin', NULL, '2012-12-27 00:00:00', 'UnLogin删除Id为7标题为55的文档', 2, NULL, NULL, NULL, NULL, NULL),
(5, 'admin', NULL, '2012-12-27 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(6, 'admin', NULL, '2012-12-27 00:00:00', 'admin删除Id为7标题为55的文档', 2, NULL, NULL, NULL, NULL, NULL),
(7, 'admin', NULL, '2012-12-27 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(8, 'admin', NULL, '2012-12-27 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(9, 'admin', NULL, '2012-12-28 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(10, 'admin', NULL, '2012-12-28 00:00:00', 'admin删除Id为7标题为55的文档', 2, NULL, NULL, NULL, NULL, NULL),
(11, 'admin', NULL, '2012-12-28 00:00:00', 'admin删除Id为12标题为hhh的文档', 2, NULL, NULL, NULL, NULL, NULL),
(12, 'admin', NULL, '2012-12-28 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(13, 'admin', NULL, '2012-12-28 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(14, 'admin', NULL, '2012-12-28 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(15, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(16, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(17, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(18, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(19, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(20, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(21, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(22, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(23, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(24, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(25, 'admin', NULL, '2012-12-29 00:00:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(26, 'admin', NULL, '2012-12-29 00:00:00', 'admin下载名称为fffd标题为fffd的文档', 3, NULL, NULL, NULL, NULL, NULL),
(27, 'admin', 15, '2012-12-29 00:00:00', 'admin下载名称为fffd标题为fffd的文档', 3, NULL, NULL, NULL, NULL, NULL),
(28, 'admin', 15, '2012-12-29 00:00:00', 'admin下载名称为fffd标题为fffd的文档', 3, NULL, NULL, NULL, NULL, NULL),
(29, 'admin', 15, '2012-12-29 00:00:00', 'admin下载名称为fffd标题为fffd的文档', 3, NULL, NULL, NULL, NULL, NULL),
(30, 'admin', 15, '2012-12-29 14:32:02', 'admin下载名称为fffd标题为fffd的文档', 3, NULL, NULL, NULL, NULL, NULL),
(31, 'admin', 14, '2012-12-29 14:33:10', 'admin修改名称为ffddd标题为ffddd的文档', 2, NULL, NULL, NULL, NULL, NULL),
(32, 'admin', 14, '2012-12-29 14:35:08', 'admin修改Id为14标题为ffddd的文档', 2, NULL, NULL, NULL, NULL, NULL),
(33, 'admin', NULL, '2012-12-29 21:10:39', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(34, 'admin', NULL, '2012-12-29 21:11:19', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(35, 'admin', NULL, '2012-12-29 21:13:44', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(36, 'admin', NULL, '2012-12-29 21:30:15', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(37, 'admin', NULL, '2012-12-29 21:31:17', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(38, 'admin', NULL, '2012-12-29 21:42:09', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(39, 'admin', NULL, '2012-12-29 21:55:50', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(40, 'admin', 16, '2012-12-29 21:59:19', 'admin上传Id为16标题为nnnjh的文档', 2, NULL, NULL, NULL, NULL, NULL),
(41, 'admin', 6, '2012-12-29 22:17:20', 'admin修改Id为6标题为kjk的文档', 2, NULL, NULL, NULL, NULL, NULL),
(42, 'admin', 6, '2012-12-29 22:17:34', 'admin修改Id为6标题为kjk的文档', 2, NULL, NULL, NULL, NULL, NULL),
(43, 'admin', 6, '2012-12-29 22:17:46', 'admin修改Id为6标题为kjk的文档', 2, NULL, NULL, NULL, NULL, NULL),
(44, 'admin', NULL, '2012-12-31 14:08:58', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(45, 'admin', NULL, '2012-12-31 14:09:56', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(46, 'admin', NULL, '2012-12-31 14:11:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(47, 'admin', NULL, '2012-12-31 14:12:41', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(48, 'admin', NULL, '2012-12-31 14:19:49', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(49, 'admin', NULL, '2012-12-31 14:42:56', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(50, 'admin', NULL, '2012-12-31 14:47:43', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(51, 'admin', NULL, '2012-12-31 14:50:27', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(52, 'admin', NULL, '2012-12-31 15:23:18', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(53, 'admin', NULL, '2012-12-31 15:25:35', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(54, 'admin', NULL, '2012-12-31 15:55:43', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(55, 'admin', NULL, '2012-12-31 16:08:06', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(56, 'admin', NULL, '2013-01-01 11:27:05', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(57, 'admin', NULL, '2013-01-01 11:29:02', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(58, 'admin', NULL, '2013-01-01 14:45:28', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(59, 'admin', NULL, '2013-01-01 14:50:39', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(60, 'admin', NULL, '2013-01-01 15:02:03', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(61, 'admin', NULL, '2013-01-01 15:07:45', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(62, 'admin', NULL, '2013-01-01 15:07:57', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(63, 'admin', NULL, '2013-01-01 15:31:17', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(64, 'admin', NULL, '2013-01-01 15:31:45', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(65, 'admin', NULL, '2013-01-01 15:32:25', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(66, 'admin', NULL, '2013-01-01 15:32:53', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(67, 'admin', NULL, '2013-01-01 16:03:47', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(68, 'admin', NULL, '2013-01-01 16:35:10', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(69, 'admin', NULL, '2013-01-01 17:01:03', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(70, 'admin', NULL, '2013-01-01 17:05:53', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(71, 'admin', NULL, '2013-01-01 17:12:33', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(72, 'admin', 6, '2013-01-01 17:17:40', 'admin修改Id为6标题为kjk的文档', 2, NULL, NULL, NULL, NULL, NULL),
(73, 'admin', NULL, '2013-01-01 17:20:08', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(74, 'admin', NULL, '2013-01-01 17:21:49', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(75, 'admin', NULL, '2013-01-01 17:24:14', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(76, 'admin', NULL, '2013-01-01 17:41:21', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(77, 'admin', NULL, '2013-01-01 18:17:57', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(78, 'admin', 14, '2013-01-01 18:19:19', 'admin删除Id为14标题为admin的评论', 5, NULL, NULL, NULL, NULL, NULL),
(79, 'admin', NULL, '2013-01-03 17:40:11', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(80, 'admin', NULL, '2013-01-03 17:44:29', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(81, 'admin', NULL, '2013-01-03 17:46:27', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(82, 'admin', NULL, '2013-01-03 17:46:39', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(83, 'admin', NULL, '2013-01-03 17:49:03', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(84, 'admin', 6, '2013-01-03 17:49:10', 'admin下载Id为6标题为kjk的文档', 3, NULL, NULL, NULL, NULL, NULL),
(85, 'admin', 6, '2013-01-03 17:49:13', 'admin修改Id为6标题为kjk的文档', 2, NULL, NULL, NULL, NULL, NULL),
(86, 'admin', 6, '2013-01-03 17:49:44', 'admin下载Id为6标题为kjk的文档', 3, NULL, NULL, NULL, NULL, NULL),
(87, 'admin', 6, '2013-01-03 17:50:14', 'admin下载Id为6标题为kjk的文档', 3, NULL, NULL, NULL, NULL, NULL),
(88, 'admin', NULL, '2013-01-03 17:51:53', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(89, 'admin', 6, '2013-01-03 17:52:00', 'admin浏览Id为6标题为kjk的文档', 4, NULL, NULL, NULL, NULL, NULL),
(90, 'admin', 6, '2013-01-03 17:52:05', 'admin修改Id为6标题为kjk的文档', 2, NULL, NULL, NULL, NULL, NULL),
(91, 'admin', NULL, '2013-01-03 17:55:36', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(92, 'admin', NULL, '2013-01-04 10:10:06', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(93, 'admin', 17, '2013-01-04 10:11:02', 'admin添加Id为17评论人为admin的评论', 5, NULL, NULL, NULL, NULL, NULL),
(94, 'admin', 17, '2013-01-04 10:12:17', 'admin上传Id为17标题为dfgdf的文档', 2, NULL, NULL, NULL, NULL, NULL),
(95, 'admin', 17, '2013-01-04 10:12:26', 'admin下载Id为17标题为dfgdf的文档', 3, NULL, NULL, NULL, NULL, NULL),
(96, '111', NULL, '2013-01-08 12:44:33', '111登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(97, '111', 18, '2013-01-08 12:45:16', '111上传Id为18标题为ccc的文档', 2, NULL, NULL, NULL, NULL, NULL),
(98, '111', 7, '2013-01-08 12:45:30', '111浏览Id为7标题为55的文档', 4, NULL, NULL, NULL, NULL, NULL),
(99, '111', NULL, '2013-01-08 13:18:22', '111登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(100, '111', 13, '2013-01-08 13:20:08', '111下载Id为13标题为nnn的文档', 3, NULL, NULL, NULL, NULL, NULL),
(101, '111', 8, '2013-01-08 13:21:23', '111浏览Id为8标题为fdf的文档', 4, NULL, NULL, NULL, NULL, NULL),
(102, '111', 8, '2013-01-08 13:26:48', '111浏览Id为8标题为fdf的文档', 4, NULL, NULL, NULL, NULL, NULL),
(103, '111', 6, '2013-01-08 13:26:57', '111浏览Id为6标题为kjk的文档', 4, NULL, NULL, NULL, NULL, NULL),
(104, '111', 8, '2013-01-08 13:28:06', '111浏览Id为8标题为fdf的文档', 4, NULL, NULL, NULL, NULL, NULL),
(105, '111', 8, '2013-01-08 13:28:16', '111修改Id为8标题为fdf的文档', 2, NULL, NULL, NULL, NULL, NULL),
(106, '111', 9, '2013-01-08 13:28:23', '111浏览Id为9标题为dddd的文档', 4, NULL, NULL, NULL, NULL, NULL),
(107, '111', 9, '2013-01-08 13:28:29', '111浏览Id为9标题为dddd的文档', 4, NULL, NULL, NULL, NULL, NULL),
(108, '111', 8, '2013-01-08 13:28:36', '111浏览Id为8标题为fdf的文档', 4, NULL, NULL, NULL, NULL, NULL),
(109, '111', 8, '2013-01-08 13:28:54', '111修改Id为8标题为fdf的文档', 2, NULL, NULL, NULL, NULL, NULL),
(110, '111', 8, '2013-01-08 13:29:06', '111下载Id为8标题为fdf的文档', 3, NULL, NULL, NULL, NULL, NULL),
(111, '111', 13, '2013-01-08 13:29:20', '111浏览Id为13标题为nnn的文档', 4, NULL, NULL, NULL, NULL, NULL),
(112, '111', 13, '2013-01-08 13:29:25', '111修改Id为13标题为nnn的文档', 2, NULL, NULL, NULL, NULL, NULL),
(113, '111', 15, '2013-01-08 13:29:28', '111浏览Id为15标题为fffd的文档', 4, NULL, NULL, NULL, NULL, NULL),
(114, '111', 15, '2013-01-08 13:29:32', '111修改Id为15标题为fffd的文档', 2, NULL, NULL, NULL, NULL, NULL),
(115, '111', NULL, '2013-01-08 13:47:08', '111登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(116, '111', 8, '2013-01-08 13:47:14', '111下载Id为8标题为fdf的文档', 3, NULL, NULL, NULL, NULL, NULL),
(117, '111', 8, '2013-01-08 13:47:17', '111浏览Id为8标题为fdf的文档', 4, NULL, NULL, NULL, NULL, NULL),
(118, '111', 8, '2013-01-08 13:47:19', '111修改Id为8标题为fdf的文档', 2, NULL, NULL, NULL, NULL, NULL),
(119, '111', 8, '2013-01-08 13:47:23', '111下载Id为8标题为fdf的文档', 3, NULL, NULL, NULL, NULL, NULL),
(120, '111', 8, '2013-01-08 13:47:31', '111下载Id为8标题为fdf的文档', 3, NULL, NULL, NULL, NULL, NULL),
(121, '111', 16, '2013-01-08 13:48:00', '111下载Id为16标题为nnnjh的文档', 3, NULL, NULL, NULL, NULL, NULL),
(122, '111', NULL, '2013-01-08 14:31:46', '111登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(123, '111', NULL, '2013-01-08 14:33:36', '111登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(124, '111', NULL, '2013-01-08 14:35:19', '111登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(125, 'admin', NULL, '2013-01-08 15:35:24', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(126, 'admin', NULL, '2013-01-09 18:24:24', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(127, 'admin', NULL, '2013-01-09 20:08:39', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(128, 'admin', NULL, '2013-01-10 10:58:22', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(129, 'admin', NULL, '2013-01-10 11:36:18', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(130, 'admin', NULL, '2013-01-10 11:41:04', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(131, 'admin', NULL, '2013-01-10 11:45:22', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(132, 'admin', NULL, '2013-01-10 12:03:41', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(133, 'admin', NULL, '2013-01-10 12:58:24', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(134, 'admin', NULL, '2013-01-10 13:08:32', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(135, 'admin', NULL, '2013-01-10 13:42:26', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(136, 'admin', NULL, '2013-01-10 14:05:32', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(137, 'admin', NULL, '2013-01-10 14:10:10', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(138, 'admin', NULL, '2013-01-10 19:41:10', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(139, 'admin', NULL, '2013-01-10 20:22:14', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(140, 'admin', NULL, '2013-01-10 20:22:40', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(141, 'admin', NULL, '2013-01-10 20:23:36', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(142, 'admin', NULL, '2013-01-10 20:25:04', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(143, 'admin', NULL, '2013-01-10 20:25:39', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(144, 'admin', NULL, '2013-01-10 20:26:50', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(145, 'admin', NULL, '2013-01-10 20:29:54', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(146, 'admin', NULL, '2013-01-10 20:30:23', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(147, 'admin', NULL, '2013-01-10 20:33:29', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(148, 'admin', NULL, '2013-01-10 20:33:46', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(149, 'admin', NULL, '2013-01-10 20:34:33', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(150, 'admin', NULL, '2013-01-10 20:35:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(151, 'admin', NULL, '2013-01-10 20:36:06', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(152, 'admin', NULL, '2013-01-10 20:37:02', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(153, 'admin', NULL, '2013-01-10 20:38:44', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(154, 'admin', NULL, '2013-01-10 20:42:24', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(155, 'admin', NULL, '2013-01-11 11:22:57', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(156, 'admin', NULL, '2013-01-11 11:23:18', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(157, 'admin', NULL, '2013-01-11 13:34:43', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(158, 'admin', NULL, '2013-01-11 13:35:41', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(159, 'admin', NULL, '2013-01-11 13:36:37', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(160, 'admin', NULL, '2013-01-11 13:37:00', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(161, 'admin', NULL, '2013-01-11 13:38:02', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(162, 'admin', NULL, '2013-01-11 13:38:33', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(163, 'admin', NULL, '2013-01-11 13:39:10', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(164, 'admin', NULL, '2013-01-11 13:51:05', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(165, 'admin', NULL, '2013-01-11 13:51:23', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(166, 'admin', NULL, '2013-01-11 13:51:30', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(167, 'admin123', NULL, '2013-01-11 13:53:19', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(168, 'admin123', NULL, '2013-01-11 13:54:37', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(169, 'admin123', NULL, '2013-01-11 14:10:26', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(170, 'admin123', NULL, '2013-01-11 14:13:04', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(171, 'admin123', NULL, '2013-01-11 14:19:58', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(172, 'admin123', NULL, '2013-01-11 14:32:17', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(173, 'admin123', 19, '2013-01-11 14:33:16', 'admin123上传Id为19标题为dfg的文档', 2, NULL, NULL, NULL, NULL, NULL),
(174, 'admin123', 19, '2013-01-11 14:33:21', 'admin123浏览Id为19标题为dfg的文档', 4, NULL, NULL, NULL, NULL, NULL),
(175, 'admin123', NULL, '2013-01-11 14:46:21', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(176, 'admin123', 6, '2013-01-11 14:46:35', 'admin123浏览Id为6标题为kjk的文档', 4, NULL, NULL, NULL, NULL, NULL),
(177, 'admin123', NULL, '2013-01-11 14:47:06', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(178, 'admin123', 6, '2013-01-11 14:47:16', 'admin123浏览Id为6标题为kjk的文档', 4, NULL, NULL, NULL, NULL, NULL),
(179, 'admin123', NULL, '2013-01-11 14:48:35', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(180, 'admin123', 6, '2013-01-11 14:49:23', 'admin123浏览Id为6标题为kjk的文档', 4, NULL, NULL, NULL, NULL, NULL),
(181, 'admin123', 6, '2013-01-11 14:52:04', 'admin123浏览Id为6标题为kjk的文档', 4, NULL, NULL, NULL, NULL, NULL),
(182, 'admin123', NULL, '2013-01-11 14:53:21', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(183, 'admin123', 7, '2013-01-11 14:53:34', 'admin123浏览Id为7标题为55的文档', 4, NULL, NULL, NULL, NULL, NULL),
(184, 'admin123', NULL, '2013-01-11 14:54:36', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(185, 'admin123', 6, '2013-01-11 14:54:47', 'admin123浏览Id为6标题为kjk的文档', 4, NULL, NULL, NULL, NULL, NULL),
(186, 'admin123', 8, '2013-01-11 14:56:21', 'admin123浏览Id为8标题为fdf的文档', 4, NULL, NULL, NULL, NULL, NULL),
(187, 'admin123', 19, '2013-01-11 14:57:07', 'admin123浏览Id为19标题为dfg的文档', 4, NULL, NULL, NULL, NULL, NULL),
(188, 'admin123', 18, '2013-01-11 15:03:30', 'admin123添加Id为18评论人为admin123的评论', 5, NULL, NULL, NULL, NULL, NULL),
(189, 'admin123', NULL, '2013-01-11 15:43:41', '未定义用户登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(190, 'admin123', 16, '2013-01-11 15:53:16', '未定义评论日志操作', 5, NULL, NULL, NULL, NULL, NULL),
(191, 'admin', NULL, '2013-01-11 16:34:20', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(192, 'admin', NULL, '2013-01-11 17:00:58', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(193, 'admin', NULL, '2013-01-11 17:02:19', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(194, 'admin', NULL, '2013-01-11 17:07:24', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(195, 'admin', NULL, '2013-01-11 17:20:33', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(196, 'admin', NULL, '2013-01-11 19:06:26', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(197, 'admin', NULL, '2013-01-11 20:12:23', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(198, 'admin', NULL, '2013-01-11 20:31:39', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL),
(199, 'admin', NULL, '2013-01-11 20:32:40', 'admin登录系统', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `Name` varchar(32) NOT NULL COMMENT '登录名，唯一标识',
  `Password` varchar(32) NOT NULL COMMENT '密码',
  `Email` varchar(32) NOT NULL COMMENT '邮箱',
  `Roles` int(11) NOT NULL COMMENT '权限  1：管理员,2:注册用户',
  `RealName` varchar(32) NOT NULL COMMENT '真实姓名',
  `Sex` int(11) DEFAULT NULL COMMENT '性别',
  `Birthday` date DEFAULT NULL COMMENT '生日',
  `Work` varchar(16) DEFAULT NULL COMMENT '职业',
  `Interest` varchar(32) DEFAULT NULL COMMENT '兴趣',
  `City` varchar(32) DEFAULT NULL COMMENT '城市',
  `UD0` varchar(64) DEFAULT NULL,
  `UD1` varchar(64) DEFAULT NULL,
  `UD2` varchar(64) DEFAULT NULL,
  `UD3` varchar(64) DEFAULT NULL,
  `UD4` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `Users`
--

INSERT INTO `Users` (`Name`, `Password`, `Email`, `Roles`, `RealName`, `Sex`, `Birthday`, `Work`, `Interest`, `City`, `UD0`, `UD1`, `UD2`, `UD3`, `UD4`) VALUES
('111', '12345', '111', 1, '111阿四大四大', NULL, '2012-12-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('112', '12345', '113', 0, '12jjj', NULL, '2012-12-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('12345', '12345', '12345', 0, '12345', NULL, '2012-12-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('admin', 'admin', 'admin345345', 1, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('admin123', '123456', 'damin1234', 0, 'admin', NULL, '2013-01-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('admin12345', 'admin', 'damin12345', 0, 'admin', NULL, '2013-01-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('admin123456', 'admin', 'damin123456', 0, 'admin', NULL, '2013-01-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('admin2', 'damin', 'damin1', 0, 'dsasdfsdf', NULL, '2012-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('amin4', 'admin', 'admin12', 0, 'sdfsdf', NULL, '2012-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('dfsnjk', '12345', 'asdda', 0, 'zxxxx', NULL, '2012-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('tttr', '12345', 'rrrt', 0, 'rrt', NULL, '2012-12-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('正csdfsd', '12345', '正csdfsd', 0, '正csdfsd', NULL, '2012-12-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
