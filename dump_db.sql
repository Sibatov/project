-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.38 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных yii2basic
CREATE DATABASE IF NOT EXISTS `yii2basic` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yii2basic`;

-- Дамп структуры для таблица yii2basic.article
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `content` text,
  `date` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `download` int(11) DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы yii2basic.article: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`id`, `title`, `description`, `content`, `date`, `image`, `pdf`, `download`, `viewed`, `user_id`, `status`, `category_id`) VALUES
	(4, 'new', '<p>new<img alt="" src="/ckfinder/userfiles/files/87931b1d714451471866861782fc85c8.png" style="height:344px; width:428px" /></p>\r\n', '<p>bajfbksjfjka fklad<img alt="" src="/ckfinder/userfiles/files/botan_01.jpg" style="height:399px; width:600px" /></p>\r\n', '2018-11-10', '0c20da56fa4ced2fadf161b3354b0c0a.jpg', '9bff7a4b3e41706d2f8f552e8a38c2ea.pdf', 530, 35, NULL, NULL, 1),
	(5, 'new2', '<p>new2</p>\r\n', '', '2018-11-10', '39a5eaa207c75744e848fe19179e37f6.jpg', 'e8c012050d7b616044d76e9ae0d49aa3.pptx', NULL, 10, NULL, NULL, NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

-- Дамп структуры для таблица yii2basic.article_tag
CREATE TABLE IF NOT EXISTS `article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы yii2basic.article_tag: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` (`id`, `article_id`, `tag_id`) VALUES
	(3, 1, 1),
	(4, 3, 2),
	(5, 4, 1),
	(8, 5, 3);
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;

-- Дамп структуры для таблица yii2basic.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы yii2basic.category: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `title`) VALUES
	(1, 'category #1'),
	(2, 'category #2');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Дамп структуры для таблица yii2basic.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-post-user_id` (`user_id`),
  KEY `idx-article_id` (`article_id`),
  CONSTRAINT `fk-post-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы yii2basic.comment: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `text`, `user_id`, `article_id`, `status`, `date`) VALUES
	(2, 'new comment', 2, 4, 1, '2018-11-10');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Дамп структуры для таблица yii2basic.migration
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы yii2basic.migration: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1540332506),
	('m170124_021553_create_article_table', 1540335512),
	('m181018_152434_create_category_table', 1540332699),
	('m181018_152454_create_tag_table', 1540332699),
	('m181018_152513_create_user_table', 1540332699);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;

-- Дамп структуры для таблица yii2basic.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы yii2basic.tag: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`id`, `title`) VALUES
	(1, 'tag1'),
	(2, 'tag2'),
	(3, 'Izimova');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- Дамп структуры для таблица yii2basic.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы yii2basic.user: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `email`, `password`, `isAdmin`, `photo`) VALUES
	(1, 'Sibatov', 'nurik_1994_1@mail.ru', 'Sibatov94', 0, NULL),
	(2, 'Nursultan', 'sibatov.n@gmail.com', 'Sibatov94', 1, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
