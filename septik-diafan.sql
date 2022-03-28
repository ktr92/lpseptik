-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 06, 2018 at 04:06 
-- Server version: 5.5.50
-- PHP Version: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `septik-diafan`
--

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab`
--

CREATE TABLE IF NOT EXISTS `diafan_ab` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор основной категории из таблицы `diafan_ab_category`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `prior` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'важно, всегда сверху: 0 - нет, 1 - да',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший объявление в административной части',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'сообщение прочитано: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Объявления';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab_category`
--

CREATE TABLE IF NOT EXISTS `diafan_ab_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_ab_category`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных категорий',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории объявлений';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab_category_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_ab_category_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_ab_category`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории-родителя из таблицы `diafan_ab_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий объявлений';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_ab_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор объявления из таблицы `diafan_ab`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_ab_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи объявлений и категорий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab_counter`
--

CREATE TABLE IF NOT EXISTS `diafan_ab_counter` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор объявления из таблицы `diafan_ab`',
  `count_view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров объявлений';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab_param`
--

CREATE TABLE IF NOT EXISTS `diafan_ab_param` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `search` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в форме поиска: 0 - нет, 1 - да',
  `list` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в списке: 0 - нет, 1 - да',
  `block` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в блоке объявлений: 0 - нет, 1 - да',
  `id_page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится на странице объявления: 0 - нет, 1 - да',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'отдельная страница для значений: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `config` text COMMENT 'дополнительные настройки поля',
  `display_in_sort` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводится в блоке для сортировки: 0 - нет, 1 - да',
  `measure_unit1` varchar(50) NOT NULL DEFAULT '' COMMENT 'единица измерения',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Дополнительные характеристики объявлений';

--
-- Dumping data for table `diafan_ab_param`
--

INSERT INTO `diafan_ab_param` (`id`, `name1`, `type`, `sort`, `search`, `list`, `block`, `id_page`, `required`, `page`, `text1`, `config`, `display_in_sort`, `measure_unit1`, `trash`) VALUES
(1, 'Для связи', 'text', 1, '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab_param_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_ab_param_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_ab_param`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_ab_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Связи дополнительных характеристик объявлений и категорий';

--
-- Dumping data for table `diafan_ab_param_category_rel`
--

INSERT INTO `diafan_ab_param_category_rel` (`id`, `element_id`, `cat_id`, `trash`) VALUES
(1, 1, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab_param_element`
--

CREATE TABLE IF NOT EXISTS `diafan_ab_param_element` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `value1` text COMMENT 'значение',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_ab_param`',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор объявления из таблицы `diafan_ab`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значений дополнительных характеристик объявлений';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab_param_select`
--

CREATE TABLE IF NOT EXISTS `diafan_ab_param_select` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_ab_param`',
  `value` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значений дополнительных характеристик объявлений типа список';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_ab_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_ab_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор объявления из таблицы `diafan_ab`',
  `rel_element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор похожего объявления из таблицы `diafan_ab`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих объявлений';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_access`
--

CREATE TABLE IF NOT EXISTS `diafan_access` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `element_type` varchar(20) NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `role_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Доступ к элементам модулей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_admin`
--

CREATE TABLE IF NOT EXISTS `diafan_admin` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_admin`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных страниц',
  `group_id` enum('1','2','3','4','5') NOT NULL DEFAULT '1' COMMENT 'группа',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `rewrite` varchar(30) NOT NULL DEFAULT '' COMMENT 'псевдоссылка',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в меню: 0 - нет, 1 - да',
  `add` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ссылка на добавление элемента в быстром меню: 0 - нет, 1 - да',
  `add_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'текст ссылки на добавление элемента в быстром меню',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'порядковый номер для сортировки',
  `docs` varchar(255) NOT NULL DEFAULT '' COMMENT 'ссылка на раздел в документации'
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='Страницы в админки';

--
-- Dumping data for table `diafan_admin`
--

INSERT INTO `diafan_admin` (`id`, `parent_id`, `count_children`, `group_id`, `name`, `rewrite`, `act`, `add`, `add_name`, `sort`, `docs`) VALUES
(1, 0, 3, '5', 'Модули и БД', 'service', '1', '0', '', 32, ''),
(2, 1, 0, '5', 'Установка модулей', 'service', '1', '0', '', 1, ''),
(3, 1, 0, '5', 'Восстановление БД', 'service/repair', '1', '0', '', 2, ''),
(4, 1, 0, '5', 'Экспорт/импорт БД', 'service/db', '1', '0', '', 3, ''),
(5, 0, 0, '1', 'Страницы админки', 'admin', '0', '0', '', 4, ''),
(6, 0, 0, '5', 'Параметры сайта', 'config', '1', '0', '', 31, ''),
(7, 0, 0, '5', 'Обработка изображений', 'images', '1', '0', '', 33, ''),
(8, 0, 3, '1', 'Меню на сайте', 'menu', '1', '0', '', 3, ''),
(9, 8, 0, '1', 'Пункты меню', 'menu', '1', '0', '', 1, ''),
(10, 8, 0, '1', 'Меню', 'menu/category', '1', '0', '', 2, ''),
(11, 8, 0, '1', 'Настройки', 'menu/config', '0', '0', '', 3, ''),
(12, 0, 4, '1', 'Страницы сайта', 'site', '1', '1', 'Страница сайта', 2, ''),
(13, 12, 0, '1', 'Страницы сайта', 'site', '1', '0', '', 1, ''),
(14, 12, 0, '1', 'Блоки на сайте', 'site/blocks', '1', '0', '', 2, ''),
(15, 12, 0, '1', 'Динамические блоки', 'site/dynamic', '1', '0', '', 3, ''),
(16, 12, 0, '1', 'Настройки', 'site/config', '0', '0', '', 4, ''),
(17, 0, 5, '1', 'Объявления', 'ab', '1', '1', 'Объявление', 9, ''),
(18, 17, 0, '1', 'Объявления', 'ab', '1', '0', '', 1, ''),
(19, 17, 0, '1', 'Характеристики', 'ab/param', '1', '0', '', 2, ''),
(20, 17, 0, '1', 'Категории', 'ab/category', '1', '0', '', 3, ''),
(21, 17, 0, '1', 'Статистика', 'ab/counter', '1', '0', '', 4, ''),
(22, 17, 0, '1', 'Настройки', 'ab/config', '0', '0', '', 5, ''),
(23, 0, 2, '4', 'Оплата', 'payment', '1', '0', '', 14, ''),
(24, 23, 0, '4', 'Баланс', 'balance', '1', '0', '', 3, ''),
(25, 23, 0, '4', 'Настройки', 'balance/config', '0', '0', '', 1, ''),
(26, 0, 3, '1', 'Баннеры', 'bs', '1', '1', 'Баннер', 8, 'http://www.diafan.ru/moduli/bannery/'),
(27, 26, 0, '1', 'Баннеры', 'bs', '1', '0', '', 1, 'http://www.diafan.ru/moduli/bannery/'),
(28, 26, 0, '1', 'Категории', 'bs/category', '1', '0', '', 2, 'http://www.diafan.ru/moduli/bannery/'),
(29, 26, 0, '1', 'Настройка', 'bs/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/bannery/'),
(30, 0, 1, '5', 'Captcha', 'captcha', '1', '0', '', 35, ''),
(31, 30, 0, '5', 'Настройки', 'captcha/config', '0', '0', '', 1, ''),
(32, 0, 4, '1', 'Статьи', 'clauses', '1', '1', 'Статью', 6, 'http://www.diafan.ru/moduli/stati/'),
(33, 32, 0, '1', 'Статьи', 'clauses', '1', '0', '', 1, 'http://www.diafan.ru/moduli/stati/'),
(34, 32, 0, '1', 'Категории', 'clauses/category', '1', '0', '', 2, 'http://www.diafan.ru/moduli/stati/'),
(35, 32, 0, '1', 'Статистика', 'clauses/counter', '1', '0', '', 3, 'http://www.diafan.ru/moduli/stati/'),
(36, 32, 0, '1', 'Настройки', 'clauses/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/stati/'),
(37, 0, 3, '2', 'Комментарии', 'comments', '1', '0', '', 23, 'http://www.diafan.ru/moduli/kommentarii/'),
(38, 37, 0, '2', 'Комментарии', 'comments', '1', '0', '', 1, 'http://www.diafan.ru/moduli/kommentarii/'),
(39, 37, 0, '2', 'Конструктор формы', 'comments/param', '1', '0', '', 2, 'http://www.diafan.ru/moduli/kommentarii/'),
(40, 37, 0, '2', 'Настройки', 'comments/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/kommentarii/'),
(41, 0, 3, '3', 'On-line консультант', 'consultant', '1', '0', '', 26, ''),
(42, 41, 0, '3', 'JivoSite', 'consultant', '1', '0', '', 1, ''),
(43, 41, 0, '3', 'LiveTex', 'consultant/livetex', '1', '0', '', 2, ''),
(44, 41, 0, '3', 'RedHelper', 'consultant/redhelper', '1', '0', '', 3, ''),
(45, 0, 0, '3', 'Темы и дизайн', 'custom', '1', '0', '', 29, ''),
(46, 0, 0, '1', 'События', 'dashboard', '0', '0', '', 1, ''),
(47, 0, 4, '2', 'Вопрос-Ответ', 'faq', '1', '0', '', 18, 'http://www.diafan.ru/moduli/vopros-otvet/'),
(48, 47, 0, '2', 'Вопросы', 'faq', '1', '0', '', 1, 'http://www.diafan.ru/moduli/vopros-otvet/'),
(49, 47, 0, '2', 'Категории', 'faq/category', '1', '0', '', 2, 'http://www.diafan.ru/moduli/vopros-otvet/'),
(50, 47, 0, '2', 'Статистика', 'faq/counter', '1', '0', '', 3, 'http://www.diafan.ru/moduli/vopros-otvet/'),
(51, 47, 0, '2', 'Настройки', 'faq/config', '1', '0', '', 4, 'http://www.diafan.ru/moduli/vopros-otvet/'),
(52, 0, 3, '2', 'Обратная связь', 'feedback', '1', '0', '', 19, 'http://www.diafan.ru/moduli/obratnaya_svyaz/'),
(53, 52, 0, '2', 'Сообщения', 'feedback', '1', '0', '', 1, 'http://www.diafan.ru/moduli/obratnaya_svyaz/'),
(54, 52, 0, '2', 'Конструктор формы', 'feedback/param', '1', '0', '', 2, 'http://www.diafan.ru/moduli/obratnaya_svyaz/'),
(55, 52, 0, '2', 'Настройки', 'feedback/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/obratnaya_svyaz/'),
(56, 0, 0, '3', 'Файловый менеджер', 'filemanager', '1', '0', '', 28, ''),
(57, 0, 4, '1', 'Файловый архив', 'files', '1', '0', '', 8, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/'),
(58, 57, 0, '1', 'Файлы', 'files', '1', '0', '', 1, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/'),
(59, 57, 0, '1', 'Категории', 'files/category', '1', '0', '', 2, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/'),
(60, 57, 0, '1', 'Статистика', 'files/counter', '1', '0', '', 3, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/'),
(61, 57, 0, '1', 'Настройки', 'files/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/'),
(62, 0, 5, '2', 'Форум', 'forum', '1', '0', '', 17, 'http://www.diafan.ru/moduli/forum/'),
(63, 62, 0, '2', 'Темы', 'forum', '1', '0', '', 1, 'http://www.diafan.ru/moduli/forum/'),
(64, 62, 0, '2', 'Блоки', 'forum/blocks', '1', '0', '', 2, 'http://www.diafan.ru/moduli/forum/'),
(65, 62, 0, '2', 'Категории', 'forum/category', '1', '0', '', 3, 'http://www.diafan.ru/moduli/forum/'),
(66, 62, 0, '2', 'Сообщения', 'forum/messages', '1', '0', '', 4, 'http://www.diafan.ru/moduli/forum/'),
(67, 62, 0, '2', 'Настройки', 'forum/config', '1', '0', '', 5, 'http://www.diafan.ru/moduli/forum/'),
(68, 0, 0, '2', 'Геокарта', 'geomap', '1', '0', '', 22, ''),
(69, 0, 3, '3', 'Перелинковка', 'keywords', '1', '0', '', 27, ''),
(70, 69, 0, '3', 'Ключевые слова', 'keywords', '1', '0', '', 1, ''),
(71, 69, 0, '3', 'Импорт/экспорт', 'keywords/importexport', '1', '0', '', 2, ''),
(72, 69, 0, '3', 'Настройки', 'keywords/config', '0', '0', '', 3, ''),
(73, 0, 2, '5', 'Языки сайта', 'languages', '1', '0', '', 35, ''),
(74, 73, 0, '5', 'Языки сайта', 'languages', '1', '0', '', 1, ''),
(75, 73, 0, '5', 'Перевод интерфейса', 'languages/translate', '1', '0', '', 2, ''),
(76, 0, 0, '2', 'Ошибки на сайте', 'mistakes', '1', '0', '', 24, ''),
(77, 0, 4, '1', 'Новости', 'news', '1', '1', 'Новость', 5, 'http://www.diafan.ru/moduli/novosti/'),
(78, 77, 0, '1', 'Новости', 'news', '1', '0', '', 1, 'http://www.diafan.ru/moduli/novosti/'),
(79, 77, 0, '1', 'Категории', 'news/category', '1', '0', '', 2, 'http://www.diafan.ru/moduli/novosti/'),
(80, 77, 0, '1', 'Статистика', 'news/counter', '1', '0', '', 3, 'http://www.diafan.ru/moduli/novosti/'),
(81, 77, 0, '1', 'Настройки', 'news/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/novosti/'),
(82, 23, 0, '4', 'Методы оплаты', 'payment', '1', '0', '', 1, ''),
(83, 23, 0, '4', 'История платежей', 'payment/history', '1', '0', '', 2, ''),
(84, 0, 4, '1', 'Фотогалерея', 'photo', '1', '1', 'Фотография', 7, 'http://www.diafan.ru/moduli/fotogalereya/'),
(85, 84, 0, '1', 'Фотографии', 'photo', '1', '0', '', 1, 'http://www.diafan.ru/moduli/fotogalereya/'),
(86, 84, 0, '1', 'Альбомы', 'photo/category', '1', '0', '', 2, 'http://www.diafan.ru/moduli/fotogalereya/'),
(87, 84, 0, '1', 'Статистика', 'photo/counter', '1', '0', '', 3, 'http://www.diafan.ru/moduli/fotogalereya/'),
(88, 84, 0, '1', 'Настройки', 'photo/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/fotogalereya/'),
(89, 0, 1, '2', 'Рейтинг', 'rating', '1', '0', '', 22, 'http://www.diafan.ru/moduli/rejtingi/'),
(90, 89, 0, '2', 'Настройки', 'rating/config', '0', '0', '', 1, 'http://www.diafan.ru/moduli/rejtingi/'),
(91, 0, 3, '2', 'Отзывы', 'reviews', '1', '0', '', 24, ''),
(92, 91, 0, '2', 'Отзывы', 'reviews', '1', '0', '', 1, ''),
(93, 91, 0, '2', 'Конструктор формы', 'reviews/param', '1', '0', '', 2, ''),
(94, 91, 0, '2', 'Настройки', 'reviews/config', '0', '0', '', 3, ''),
(95, 0, 3, '3', 'Поиск по сайту', 'search', '1', '0', '', 31, 'http://www.diafan.ru/moduli/poisk/'),
(96, 95, 0, '3', 'Индексация', 'search', '1', '0', '', 1, 'http://www.diafan.ru/moduli/poisk/'),
(97, 95, 0, '3', 'История поиска', 'search/history', '1', '0', '', 2, 'http://www.diafan.ru/moduli/poisk/'),
(98, 95, 0, '3', 'Настройки', 'search/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/poisk/'),
(99, 0, 7, '4', 'Каталог', 'shop', '1', '1', 'Товар', 2, 'http://www.diafan.ru/moduli/magazin/'),
(100, 99, 0, '4', 'Товары', 'shop', '1', '0', '', 1, 'http://www.diafan.ru/moduli/magazin/'),
(101, 99, 0, '4', 'Скидки', 'shop/discount', '1', '0', '', 2, 'http://www.diafan.ru/moduli/magazin/'),
(102, 99, 0, '4', 'Производители', 'shop/brand', '1', '0', '', 3, 'http://www.diafan.ru/moduli/magazin/'),
(103, 99, 0, '4', 'Категории', 'shop/category', '1', '0', '', 4, 'http://www.diafan.ru/moduli/magazin/'),
(104, 99, 0, '4', 'Характеристики', 'shop/param', '1', '0', '', 5, 'http://www.diafan.ru/moduli/magazin/'),
(105, 99, 0, '4', 'Импорт/экспорт', 'shop/importexport', '1', '0', '', 6, 'http://www.diafan.ru/moduli/magazin/'),
(106, 99, 0, '4', 'Настройки', 'shop/config', '0', '0', '', 7, 'http://www.diafan.ru/moduli/magazin/'),
(107, 0, 0, '4', 'Заказы', 'shop/order', '1', '0', '', 12, 'http://www.diafan.ru/moduli/magazin/'),
(108, 0, 5, '4', 'Справочники', 'delivery', '1', '0', '', 13, 'http://www.diafan.ru/moduli/magazin/'),
(109, 108, 0, '4', 'Способы доставки', 'delivery', '1', '0', '', 1, 'http://www.diafan.ru/moduli/magazin/'),
(110, 108, 0, '4', 'Сопутствующие услуги', 'shop/additionalcost', '1', '0', '', 2, 'http://www.diafan.ru/moduli/magazin/'),
(111, 108, 0, '4', 'Форма оформления заказа', 'shop/orderparam', '1', '0', '', 3, 'http://www.diafan.ru/moduli/magazin/'),
(112, 108, 0, '4', 'Статусы заказа', 'shop/orderstatus', '1', '0', '', 4, 'http://www.diafan.ru/moduli/magazin/'),
(113, 108, 0, '4', 'Валюты', 'shop/currency', '1', '0', '', 5, 'http://www.diafan.ru/moduli/magazin/'),
(114, 0, 4, '4', 'Статистика', 'shop/ordercount', '1', '0', '', 15, 'http://www.diafan.ru/moduli/magazin/'),
(115, 114, 0, '4', 'Отчеты о заказах', 'shop/ordercount', '1', '0', '', 1, 'http://www.diafan.ru/moduli/magazin/'),
(116, 114, 0, '4', 'Отложенные товары', 'shop/wishlist', '1', '0', '', 2, 'http://www.diafan.ru/moduli/magazin/'),
(117, 114, 0, '4', 'Список ожиданий', 'shop/waitlist', '1', '0', '', 3, 'http://www.diafan.ru/moduli/magazin/'),
(118, 114, 0, '4', 'Статистика товаров', 'shop/counter', '1', '0', '', 4, 'http://www.diafan.ru/moduli/magazin/'),
(119, 0, 6, '2', 'Рассылки', 'subscribtion', '1', '0', '', 21, 'http://www.diafan.ru/moduli/rassylki/'),
(120, 119, 0, '2', 'E-mail рассылки', 'subscribtion', '1', '0', '', 1, 'http://www.diafan.ru/moduli/rassylki/'),
(121, 119, 0, '2', 'Категории', 'subscribtion/category', '1', '0', '', 2, 'http://www.diafan.ru/moduli/rassylki/'),
(122, 119, 0, '2', 'Подписчики', 'subscribtion/emails', '1', '0', '', 3, 'http://www.diafan.ru/moduli/rassylki/'),
(123, 119, 0, '2', 'SMS-рассылки', 'subscribtion/sms', '1', '0', '', 4, 'http://www.diafan.ru/moduli/rassylki/'),
(124, 119, 0, '2', 'Номера телефонов', 'subscribtion/phones', '1', '0', '', 5, 'http://www.diafan.ru/moduli/rassylki/'),
(125, 119, 0, '2', 'Настройки', 'subscribtion/config', '0', '0', '', 6, 'http://www.diafan.ru/moduli/rassylki/'),
(126, 0, 1, '1', 'Теги', 'tags', '1', '0', '', 11, 'http://www.diafan.ru/moduli/tegi/'),
(127, 126, 0, '1', 'Настройки', 'tags/config', '1', '0', '', 1, 'http://www.diafan.ru/moduli/tegi/'),
(128, 0, 0, '5', 'Корзина', 'trash', '1', '0', '', 36, 'http://www.diafan.ru/moduli/korzina/'),
(129, 0, 0, '3', 'Обновление CMS', 'update', '1', '0', '', 30, 'http://www.diafan.ru/moduli/obnovleniya/'),
(130, 0, 4, '2', 'Пользователи сайта', 'users', '1', '0', '', 16, 'http://www.diafan.ru/moduli/polzovateli/'),
(131, 130, 0, '2', 'Пользователи', 'users', '1', '0', '', 1, 'http://www.diafan.ru/moduli/polzovateli/'),
(132, 130, 0, '2', 'Права доступа', 'users/role', '1', '0', '', 2, 'http://www.diafan.ru/moduli/polzovateli/'),
(133, 130, 0, '2', 'Конструктор формы регистрации', 'users/param', '1', '0', '', 3, 'http://www.diafan.ru/moduli/polzovateli/'),
(134, 130, 0, '2', 'Настройки', 'users/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/polzovateli/'),
(135, 0, 3, '2', 'Опросы', 'votes', '1', '0', '', 20, 'http://www.diafan.ru/moduli/oprosy/'),
(136, 135, 0, '2', 'Опросы', 'votes', '1', '0', '', 1, 'http://www.diafan.ru/moduli/oprosy/'),
(137, 135, 0, '2', 'Варианты пользователей', 'votes/userversion', '1', '0', '', 2, 'http://www.diafan.ru/moduli/oprosy/'),
(138, 135, 0, '2', 'Настройки', 'votes/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/oprosy/');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_admin_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_admin_parents` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы из таблицы `diafan_admin`',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы родителя из таблицы `diafan_admin`'
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='Родительские связи страниц админки';

--
-- Dumping data for table `diafan_admin_parents`
--

INSERT INTO `diafan_admin_parents` (`id`, `element_id`, `parent_id`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 9, 8),
(5, 10, 8),
(6, 11, 8),
(7, 13, 12),
(8, 14, 12),
(9, 15, 12),
(10, 16, 12),
(11, 18, 17),
(12, 19, 17),
(13, 20, 17),
(14, 21, 17),
(15, 22, 17),
(16, 24, 23),
(17, 25, 23),
(18, 27, 26),
(19, 28, 26),
(20, 29, 26),
(21, 31, 30),
(22, 33, 32),
(23, 34, 32),
(24, 35, 32),
(25, 36, 32),
(26, 38, 37),
(27, 39, 37),
(28, 40, 37),
(29, 42, 41),
(30, 43, 41),
(31, 44, 41),
(32, 48, 47),
(33, 49, 47),
(34, 50, 47),
(35, 51, 47),
(36, 53, 52),
(37, 54, 52),
(38, 55, 52),
(39, 58, 57),
(40, 59, 57),
(41, 60, 57),
(42, 61, 57),
(43, 63, 62),
(44, 64, 62),
(45, 65, 62),
(46, 66, 62),
(47, 67, 62),
(48, 70, 69),
(49, 71, 69),
(50, 72, 69),
(51, 74, 73),
(52, 75, 73),
(53, 78, 77),
(54, 79, 77),
(55, 80, 77),
(56, 81, 77),
(57, 82, 23),
(58, 83, 23),
(59, 85, 84),
(60, 86, 84),
(61, 87, 84),
(62, 88, 84),
(63, 90, 89),
(64, 92, 91),
(65, 93, 91),
(66, 94, 91),
(67, 96, 95),
(68, 97, 95),
(69, 98, 95),
(70, 100, 99),
(71, 101, 99),
(72, 102, 99),
(73, 103, 99),
(74, 104, 99),
(75, 105, 99),
(76, 106, 99),
(77, 109, 108),
(78, 110, 108),
(79, 111, 108),
(80, 112, 108),
(81, 113, 108),
(82, 115, 114),
(83, 116, 114),
(84, 117, 114),
(85, 118, 114),
(86, 120, 119),
(87, 121, 119),
(88, 122, 119),
(89, 123, 119),
(90, 124, 119),
(91, 125, 119),
(92, 127, 126),
(93, 131, 130),
(94, 132, 130),
(95, 133, 130),
(96, 134, 130),
(97, 136, 135),
(98, 137, 135),
(99, 138, 135);

-- --------------------------------------------------------

--
-- Table structure for table `diafan_attachments`
--

CREATE TABLE IF NOT EXISTS `diafan_attachments` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название файла',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор поля или характеристики с типом «файлы»',
  `extension` varchar(255) NOT NULL DEFAULT '' COMMENT 'расширение файла',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'размер файла',
  `is_image` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'это изображение: 0 - нет, 1 - да',
  `access_admin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ только для администратора: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Прикрепленные файлы';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_balance`
--

CREATE TABLE IF NOT EXISTS `diafan_balance` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `summ` double unsigned NOT NULL DEFAULT '0' COMMENT 'сумма на балансе'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Баланс пользователей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_bs`
--

CREATE TABLE IF NOT EXISTS `diafan_bs` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text COMMENT 'описание',
  `alt1` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибут alt для баннера-изображения',
  `title1` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибут title для баннера-изображения',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `type` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT 'тип: 1 - изображение, 2 - флэш, 3 - HTML',
  `file` varchar(250) NOT NULL DEFAULT '' COMMENT 'имя файла, загруженного в папку userfls/bs',
  `html` text COMMENT 'HTML код баннера-блока',
  `link1` text COMMENT 'ссылка на баннер-изображение или баннер-флэш',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_bs_category`',
  `check_number` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ограничить количество показов: 0 - нет, 1 - да',
  `check_click` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ограничить по количеству кликов: 0 - нет, 1 - да',
  `show_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ограничить по количеству кликов: осталось кликов',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `show_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ограничить количество показов: осталось показов',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'всего кликов',
  `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ширина флэш-баннера',
  `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'высота флэш-баннера',
  `check_user` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ограничить количество показов посетителю в сутки: 0 - нет, 1 - да',
  `show_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'количество показов посетителю в сутки',
  `count_view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'всего показов',
  `target_blank` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'открывать ссылку в новом окне',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Баннеры';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_bs_category`
--

CREATE TABLE IF NOT EXISTS `diafan_bs_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name` text COMMENT 'название',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории баннеров';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_bs_site_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_bs_site_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор баннера из таблицы `diafan_bs_category`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные о том, на каких страницах сайта выводятся баннеры';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_captcha`
--

CREATE TABLE IF NOT EXISTS `diafan_captcha` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'текст вопроса',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `is_write` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ответы не отображаются на сайте: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Вопросы для капчи типа Вопрос-ответ';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_captcha_answers`
--

CREATE TABLE IF NOT EXISTS `diafan_captcha_answers` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `text1` text COMMENT 'текст ответа',
  `is_right` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ответ правильный: 0 - нет, 1 - да',
  `captcha_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор вопроса из таблицы `diafan_captcha`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты ответов для капчи типа Вопрос-ответ';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_clauses`
--

CREATE TABLE IF NOT EXISTS `diafan_clauses` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор основной категории из таблицы `diafan_clauses_category`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` longtext COMMENT 'описание',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший статью в административной части',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Статьи';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_clauses_category`
--

CREATE TABLE IF NOT EXISTS `diafan_clauses_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_clauses_category`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных категорий',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории статей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_clauses_category_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_clauses_category_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_clauses_category`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории-родителя из таблицы `diafan_clauses_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий статей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_clauses_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_clauses_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор статьи из таблицы `diafan_clauses`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_clauses_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи статей и категорий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_clauses_counter`
--

CREATE TABLE IF NOT EXISTS `diafan_clauses_counter` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор статьи из таблицы `diafan_clauses`',
  `count_view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров статей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_clauses_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_clauses_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор статьи из таблицы `diafan_clauses`',
  `rel_element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор связанной статьи из таблицы `diafan_clauses`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих статей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_comments`
--

CREATE TABLE IF NOT EXISTS `diafan_comments` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `text` text COMMENT 'текст комментария',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_comments`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных комментариев',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Комментарии';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_comments_mail`
--

CREATE TABLE IF NOT EXISTS `diafan_comments_mail` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'e-mail пользователя',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подписка пользователей на новые комментарии';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_comments_param`
--

CREATE TABLE IF NOT EXISTS `diafan_comments_param` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `show_in_list` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в списке: 0 - нет, 1 - да',
  `show_in_form_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в форме авторизованным пользователям: 0 - нет, 1 - да',
  `show_in_form_no_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в списке: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `config` text COMMENT 'серилизованные настройки поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Дополнительные поля комментариев';

--
-- Dumping data for table `diafan_comments_param`
--

INSERT INTO `diafan_comments_param` (`id`, `name1`, `type`, `module_name`, `sort`, `required`, `show_in_list`, `show_in_form_auth`, `show_in_form_no_auth`, `text1`, `config`, `trash`) VALUES
(1, 'Имя', 'text', '', 1, '1', '1', '0', '1', NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_comments_param_element`
--

CREATE TABLE IF NOT EXISTS `diafan_comments_param_element` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `value` text COMMENT 'значение',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_comments_param`',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор комментария из таблицы `diafan_comments`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения дополнительных полей комментариев';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_comments_param_select`
--

CREATE TABLE IF NOT EXISTS `diafan_comments_param_select` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_comments_param`',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `value` varchar(1) NOT NULL DEFAULT '' COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значения дополнительных полей комментариев с типом список';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_comments_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_comments_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор комментария из таблицы `diafan_comments`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя комментария из таблицы `diafan_comments`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи комментариев';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_config`
--

CREATE TABLE IF NOT EXISTS `diafan_config` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название настройки',
  `lang_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `value` text COMMENT 'значение',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`'
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8 COMMENT='Настройки модулей';

--
-- Dumping data for table `diafan_config`
--

INSERT INTO `diafan_config` (`id`, `module_name`, `name`, `lang_id`, `value`, `site_id`) VALUES
(1, 'route', 'method', 0, '1', 0),
(2, 'route', 'translit_array', 0, ' |а|б|в|г|д|е|ё|ж|з|и|й|к|л|м|н|о|п|р|с|т|у|ф|х|ц|ч|ш|щ|ы|э|ю|я|А|Б|В|Г|Д|Е|Ё|Ж|З|И|Й|К|Л|М|Н|О|П|Р|С|Т|У|Ф|Х|Ц|Ч|Ш|Щ|Ы|Э|Ю|Я````-|a|b|v|g|d|e|yo|zh|z|i|y|k|l|m|n|o|p|r|s|t|u|f|kh|ts|ch|sh|sch|y|e|yu|ya|A|B|V|G|D|E|YO|ZH|Z|I|Y|K|L|M|N|O|P|R|S|T|U|F|KH|TS|CH|SH|SCH|Y|E|YU|YA', 0),
(3, 'editor', 'images_variations_element', 0, 'a:1:{i:0;a:1:{s:2:"id";s:1:"2";}}', 0),
(4, 'site', 'use_animation', 0, '1', 0),
(5, 'site', 'images_variations', 0, 'a:2:{i:0;a:2:{s:4:"name";s:6:"medium";s:2:"id";i:1;}i:1;a:2:{s:4:"name";s:5:"large";s:2:"id";i:3;}}', 0),
(6, 'core', 'trial', 0, '1502367156', 0),
(7, 'htmleditor', 'hide_site_blocks_1', 1, 'text', 0),
(8, 'ab', 'images_element', 0, '1', 0),
(9, 'ab', 'use_animation', 0, '1', 0),
(10, 'ab', 'list_img_element', 0, '1', 0),
(11, 'ab', 'count_list', 0, '3', 0),
(12, 'ab', 'count_child_list', 0, '2', 0),
(13, 'ab', 'counter', 0, '1', 0),
(14, 'ab', 'nastr', 0, '10', 0),
(15, 'ab', 'nastr_cat', 0, '10', 0),
(16, 'ab', 'children_elements', 0, '1', 0),
(17, 'ab', 'rel_two_sided', 0, '1', 0),
(18, 'ab', 'add_message', 0, 'Объявление успешно добавлено.', 0),
(19, 'ab', 'subject_admin', 0, 'Новое объявление на сайте %title (%url)', 0),
(20, 'ab', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>В рубрике Объявления появилось новое объявление:<br>%message', 0),
(21, 'ab', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:"name";s:6:"medium";s:2:"id";i:1;}i:1;a:2:{s:4:"name";s:5:"large";s:2:"id";i:3;}}', 0),
(22, 'ab', 'form_name', 0, '1', 0),
(23, 'ab', 'form_anons', 0, '1', 0),
(24, 'ab', 'form_text', 0, '1', 0),
(25, 'ab', 'form_date_finish', 0, '1', 0),
(26, 'ab', 'form_images', 0, '1', 0),
(27, 'ab', 'captcha', 0, 'a:1:{i:0;s:1:"0";}', 0),
(28, 'ab', 'comments', 0, '1', 0),
(29, 'ab', 'cat', 0, '1', 0),
(30, 'ab', 'rating', 0, '1', 0),
(31, 'balance', 'mes', 0, 'Для продолжения процедуры пополнения баланса, требуется его оплатить.', 0),
(32, 'balance', 'subject', 0, 'Вы пополнили баланс на сайте %title (%url).', 0),
(33, 'balance', 'message', 0, 'Здравствуйте!<br>Вы пополнили баланс на сайте %title (%url):<br><br>Способ оплаты: %payment<br>Номер платежа: %id', 0),
(34, 'balance', 'subject_admin', 0, '%title (%url). Пополненение баланса', 0),
(35, 'balance', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>На сайте произведено пополнение баланса пользователя.<br>Способ оплаты: %payment<br>Номер счета: %id', 0),
(36, 'balance', 'desc_payment', 0, 'Popolnenie balanca #%id', 0),
(37, 'balance', 'payment_success_text', 0, '<p>Спасибо, платеж успешно принят. Деньги зачислены на счет.</p>', 0),
(38, 'balance', 'payment_fail_text', 0, '<p>Извините, платеж не прошел.</p>', 0),
(39, 'balance', 'currency', 0, 'руб.', 0),
(40, 'bs', 'cat', 0, '1', 0),
(41, 'captcha', 'type', 0, 'captcha', 0),
(42, 'clauses', 'images_element', 0, '1', 0),
(43, 'clauses', 'list_img_element', 0, '1', 0),
(44, 'clauses', 'use_animation', 0, '1', 0),
(45, 'clauses', 'format_date', 0, '2', 0),
(46, 'clauses', 'nastr', 0, '10', 0),
(47, 'clauses', 'nastr_cat', 0, '10', 0),
(48, 'clauses', 'count_list', 0, '3', 0),
(49, 'clauses', 'count_child_list', 0, '2', 0),
(50, 'clauses', 'children_elements', 0, '1', 0),
(51, 'clauses', 'counter', 0, '1', 0),
(52, 'clauses', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:"name";s:6:"medium";s:2:"id";i:1;}i:1;a:2:{s:4:"name";s:5:"large";s:2:"id";i:3;}}', 0),
(53, 'clauses', 'cat', 0, '1', 0),
(54, 'clauses', 'comments', 0, '1', 0),
(55, 'comments', 'captcha', 0, 'a:1:{i:0;s:1:"0";}', 0),
(56, 'comments', 'format_date', 0, '5', 0),
(57, 'comments', 'user_name', 0, '1', 0),
(58, 'comments', 'error_insert_message', 0, 'Ваше сообщение уже имеется в базе.', 0),
(59, 'comments', 'add_message', 0, 'Спасибо! Ваш комментарий будет проверен в ближайшее время и появится на сайте.', 0),
(60, 'comments', 'count_level', 0, '7', 0),
(61, 'comments', 'nastr', 0, '10', 0),
(62, 'comments', 'use_mail', 0, '1', 0),
(63, 'comments', 'subject', 0, 'Новый комментарий на сайте %title (%url)', 0),
(64, 'comments', 'message', 0, 'Здравствуйте! Вы подписались на комментарии на сайте %title (%url).<br>На странице появился <a href="%link">новый комментарий</a>:<br>%message<br><br>Отписаться можете по <a href="%actlink">ссылке</a>.', 0),
(65, 'comments', 'sendmailadmin', 0, '1', 0),
(66, 'comments', 'subject_admin', 0, '%title (%url). Новый комментарий', 0),
(67, 'comments', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)! На странице <a href="%urlpage">%urlpage</a> появился новый комментарий: %message', 0),
(68, 'faq', 'comments', 0, '1', 0),
(69, 'files', 'comments', 0, '1', 0),
(70, 'news', 'comments', 0, '1', 0),
(71, 'photo', 'comments', 0, '1', 0),
(72, 'photo', 'comments_cat', 0, '1', 0),
(74, 'consultant', 'redhelper_color', 0, '#aacc66', 0),
(75, 'consultant', 'redhelper_chatX', 0, '30', 0),
(76, 'consultant', 'redhelper_chatY', 0, '50', 0),
(77, 'consultant', 'redhelper_header', 0, 'Наша компания', 0),
(78, 'consultant', 'redhelper_topText', 0, 'Лучшие товары', 0),
(79, 'consultant', 'redhelper_welcome', 0, 'Вам чем-нибудь помочь?', 0),
(80, 'consultant', 'redhelper_inviteTime', 0, '20', 0),
(81, 'consultant', 'redhelper_chatWidth', 0, '200', 0),
(82, 'consultant', 'redhelper_chatHeight', 0, '300', 0),
(83, 'faq', 'security', 0, '2', 0),
(84, 'faq', 'format_date', 0, '1', 0),
(85, 'faq', 'nastr', 0, '10', 0),
(86, 'faq', 'nastr_cat', 0, '10', 0),
(87, 'faq', 'count_list', 0, '3', 0),
(88, 'faq', 'count_child_list', 0, '1', 0),
(89, 'faq', 'counter', 0, '1', 0),
(90, 'faq', 'attachments', 0, '1', 0),
(91, 'faq', 'max_count_attachments', 0, '10', 0),
(92, 'faq', 'attachment_extensions', 0, 'doc, gif, jpg, jpeg, mpg, pdf, png, txt, zip', 0),
(93, 'faq', 'recognize_image', 0, '1', 0),
(94, 'faq', 'attach_big_width', 0, '500', 0),
(95, 'faq', 'attach_big_height', 0, '500', 0),
(96, 'faq', 'attach_big_quality', 0, '90', 0),
(97, 'faq', 'attach_medium_width', 0, '100', 0),
(98, 'faq', 'attach_medium_height', 0, '100', 0),
(99, 'faq', 'attach_medium_quality', 0, '90', 0),
(100, 'faq', 'sendmailadmin', 0, '1', 0),
(101, 'faq', 'count_letter_list', 0, '160', 0),
(102, 'faq', 'page_show', 0, '1', 0),
(103, 'faq', 'add_message', 0, '<div align="center"><b>Спасибо за ваше сообщение!</b><br>Наш консультант подберет необходимую информацию, после чего ваш вопрос и ответ на него будут опубликованы на этой странице.</div>', 0),
(104, 'faq', 'error_insert_message', 0, 'Ваше сообщение уже имеется в базе.', 0),
(105, 'faq', 'subject', 0, '%title (%url). Вопрос-Ответ', 0),
(106, 'faq', 'message', 0, 'Здравствуйте, %name!<br>Вы задали вопрос на сайте %title (%url).<br><b>Вопрос:</b> %question <br><b>Ответ:</b> %answer', 0),
(107, 'faq', 'subject_admin', 0, '%title (%url). Новый вопрос в рубрике Вопрос-Ответ', 0),
(108, 'faq', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>В рубрике Вопрос-Ответ появился новый вопрос:<br>%question.<br>%name<br>%email<br>Прикреленные файлы: %files', 0),
(109, 'faq', 'rel_two_sided', 0, '1', 0),
(110, 'feedback', 'security', 0, '2', 0),
(111, 'feedback', 'sendmailadmin', 0, '1', 0),
(112, 'feedback', 'add_message', 0, '<div align="center"><b>Спасибо за ваше сообщение!</b></div>', 0),
(113, 'feedback', 'subject', 0, '%title (%url). Обратная связь', 0),
(114, 'feedback', 'message', 0, 'Здравствуйте!<br>Вы оставили сообщение в форме обратной связи на сайте %title (%url).<br><b>Сообщение:</b> %message <br><b>Ответ:</b> %answer', 0),
(115, 'feedback', 'subject_admin', 0, '%title (%url). Новое сообщение в рубрике Обратная связь', 0),
(116, 'feedback', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>В рубрике Обратная связь появилось новое сообщение:<br>%message', 0),
(117, 'files', 'images_element', 0, '1', 0),
(118, 'files', 'list_img_element', 0, '1', 0),
(119, 'files', 'use_animation', 0, '1', 0),
(120, 'files', 'nastr', 0, '20', 0),
(121, 'files', 'nastr_cat', 0, '10', 0),
(122, 'files', 'count_list', 0, '3', 0),
(123, 'files', 'count_child_list', 0, '2', 0),
(124, 'files', 'children_elements', 0, '1', 0),
(125, 'files', 'counter', 0, '1', 0),
(126, 'files', 'attachment_extensions', 0, 'doc, gif, jpg, jpeg, mpg, pdf, png, txt, zip', 0),
(127, 'files', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:"name";s:6:"medium";s:2:"id";i:1;}i:1;a:2:{s:4:"name";s:5:"large";s:2:"id";i:3;}}', 0),
(128, 'files', 'rating', 0, '1', 0),
(129, 'forum', 'news_count_days', 0, '3', 0),
(130, 'forum', 'count_level', 0, '7', 0),
(131, 'forum', 'max_count', 0, '50', 0),
(132, 'forum', 'format_date', 0, '5', 0),
(133, 'forum', 'nastr', 0, '30', 0),
(134, 'forum', 'attachments', 0, '1', 0),
(135, 'forum', 'max_count_attachments', 0, '5', 0),
(136, 'forum', 'attachment_extensions', 0, 'doc, gif, jpg, jpeg, mpg, pdf, png, txt, zip', 0),
(137, 'forum', 'recognize_image', 0, '1', 0),
(138, 'forum', 'attach_big_width', 0, '1000', 0),
(139, 'forum', 'attach_big_height', 0, '1000', 0),
(140, 'forum', 'attach_big_quality', 0, '90', 0),
(141, 'forum', 'attach_medium_width', 0, '100', 0),
(142, 'forum', 'attach_medium_height', 0, '100', 0),
(143, 'forum', 'attach_medium_quality', 0, '80', 0),
(144, 'forum', 'use_animation', 0, '1', 0),
(145, 'geomap', 'backend', 0, 'yandex', 0),
(146, 'geomap', 'config', 0, 'a:1:{s:11:"yandex_zoom";i:13;}', 0),
(147, 'ab', 'geomap_element', 0, '1', 0),
(148, 'keywords', 'max', 0, '2', 0),
(149, 'site', 'keywords', 0, '1', 0),
(150, 'ab', 'keywords', 0, '1', 0),
(151, 'clauses', 'keywords', 0, '1', 0),
(152, 'faq', 'keywords', 0, '1', 0),
(153, 'files', 'keywords', 0, '1', 0),
(154, 'news', 'keywords', 0, '1', 0),
(155, 'photo', 'keywords', 0, '1', 0),
(157, 'news', 'images_element', 0, '1', 0),
(158, 'news', 'count_list', 0, '2', 0),
(159, 'news', 'count_child_list', 0, '2', 0),
(160, 'news', 'children_elements', 0, '1', 0),
(161, 'news', 'list_img_element', 0, '1', 0),
(162, 'news', 'use_animation', 0, '1', 0),
(163, 'news', 'format_date', 0, '2', 0),
(164, 'news', 'nastr', 0, '10', 0),
(165, 'news', 'nastr_cat', 0, '10', 0),
(166, 'news', 'rel_two_sided', 0, '1', 0),
(167, 'news', 'counter', 0, '1', 0),
(168, 'news', 'title_tpl', 0, '%name, %category', 0),
(169, 'news', 'keywords_tpl', 0, '%name %category', 0),
(170, 'news', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:"name";s:6:"medium";s:2:"id";i:1;}i:1;a:2:{s:4:"name";s:5:"large";s:2:"id";i:3;}}', 0),
(171, 'news', 'cat', 0, '1', 0),
(172, 'photo', 'images_element', 0, '1', 0),
(173, 'photo', 'page_show', 0, '1', 0),
(174, 'photo', 'use_animation', 0, '1', 0),
(175, 'photo', 'count_list', 0, '1', 0),
(176, 'photo', 'count_child_list', 0, '1', 0),
(177, 'photo', 'children_elements', 0, '1', 0),
(178, 'photo', 'counter', 0, '1', 0),
(179, 'photo', 'nastr', 0, '10', 0),
(180, 'photo', 'nastr_cat', 0, '10', 0),
(181, 'photo', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:"name";s:6:"medium";s:2:"id";i:2;}i:1;a:2:{s:4:"name";s:5:"large";s:2:"id";i:3;}}', 0),
(182, 'rating', 'security', 0, '4', 0),
(183, 'clauses', 'rating', 0, '1', 0),
(184, 'news', 'rating', 0, '1', 0),
(185, 'photo', 'rating', 0, '1', 0),
(187, 'reviews', 'captcha', 0, 'a:1:{i:0;s:1:"0";}', 0),
(188, 'reviews', 'format_date', 0, '5', 0),
(189, 'reviews', 'user_name', 0, '1', 0),
(190, 'reviews', 'add_message', 0, 'Спасибо за Ваш отзыв!', 0),
(191, 'reviews', 'count_level', 0, '7', 0),
(192, 'reviews', 'nastr', 0, '10', 0),
(193, 'reviews', 'sendmailadmin', 0, '1', 0),
(194, 'reviews', 'subject_admin', 0, '%title (%url). Новый отзыв', 0),
(195, 'reviews', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)! На странице <a href="%urlpage">%urlpage</a> появился новый отзыв: %message', 0),
(196, 'reviews', 'subject', 0, '%title (%url). Отзывы', 0),
(197, 'reviews', 'message', 0, 'Здравствуйте!<br>Вы оставили отзыв на сайте %title (%url).<br><b>Сообщение:</b> %message <br><b>Ответ:</b> %answer', 0),
(198, 'search', 'nastr', 0, '10', 0),
(199, 'search', 'count_history', 0, '10', 0),
(241, 'subscribtion', 'subject', 0, 'Рассылка сайта %title (%url). %subject', 0),
(242, 'subscribtion', 'message', 0, 'Рассылка сайта %title (%url). %text Для изменения списка категорий рассылок пройдите <a href="%link">по ссылке</a>.<br>Если Вы хотите отписаться от рассылки, пройдите <a href="%actlink">по ссылке</a>.', 0),
(243, 'subscribtion', 'add_mail', 0, 'E-mail успешно добавлен. Вам отправлено уведомление.', 0),
(244, 'subscribtion', 'subject_user', 0, 'Подписка на рассылку с  сайта %title (%url)', 0),
(245, 'subscribtion', 'message_user', 0, 'Здравствуйте! Вы подписались на рассылку с сайта %title (%url).<br>Для изменения списка категорий рассылок пройдите <a href="%link">по ссылке</a>.<br>Если Вы хотите отписаться от рассылки, пройдите <a href="%actlink">по ссылке</a>.', 0),
(246, 'tags', 'nastr', 0, '10', 0),
(247, 'ab', 'tags', 0, '1', 0),
(248, 'clauses', 'tags', 0, '1', 0),
(249, 'faq', 'tags', 0, '1', 0),
(250, 'files', 'tags', 0, '1', 0),
(251, 'news', 'tags', 0, '1', 0),
(252, 'photo', 'tags', 0, '1', 0),
(254, 'update', 'hash', 0, '593e7d8972a85c7e9478c2f78c475c97c65eae7f', 0),
(255, 'users', 'captcha', 0, 'a:1:{i:0;s:1:"0";}', 0),
(256, 'users', 'sendmailadmin', 0, '1', 0),
(257, 'users', 'act', 0, '1', 0),
(258, 'users', 'subject_admin', 0, '%title (%url). Новый пользователь', 0),
(259, 'users', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>На сайте появился новый пользователь: %fio (%login), %email.', 0),
(260, 'users', 'mes', 0, 'Вы удачно зарегистрированы. Для активации аккаунта пройдите по ссылке, высланной на ваш e-mail.', 0),
(261, 'users', 'subject', 0, 'Вы зарегистрированы на сайте %title (%url)', 0),
(262, 'users', 'message', 0, 'Здравствуйте, %fio!<br>Вы зарегистрированы на сайте %title (%url).<br>Логин: %login<br>Пароль: %password<br>Для активации аккаунта пройдите по <a href="%actlink">ссылке</a>.<br>Ссылка действует в течении суток.', 0),
(263, 'users', 'subject_act', 0, 'Ваш аккаунт на сайте %title (%url) активирован администратором', 0),
(264, 'users', 'message_act', 0, 'Здравствуйте, %fio!<br>Ваш аккаунт на сайте %title (%url) активирован администратором.<br>Логин: %login', 0),
(265, 'users', 'mes_reminding', 0, 'На ваш e-mail отправлена ссылка на форму изменения пароля.', 0),
(266, 'users', 'subject_reminding', 0, 'Восстановление доступа к сайту %title (%url).', 0),
(267, 'users', 'message_reminding', 0, 'Здравствуйте, %fio!<br>Вы запросили восстановление доступа к сайту %title (%url).<br>Для изменения пароля пройдите <a href="%actlink">по ссылке</a>.', 0),
(268, 'users', 'subject_reminding_new_pass', 0, 'Новый пароль на сайте %title (%url)', 0),
(269, 'users', 'message_reminding_new_pass', 0, 'Здравствуйте, %fio!<br>Вы изменили пароль на сайте %title (%url).<br>Логин: %login<br>Пароль: %password', 0),
(270, 'users', 'avatar', 0, '1', 0),
(271, 'users', 'avatar_width', 0, '50', 0),
(272, 'users', 'avatar_height', 0, '50', 0),
(273, 'users', 'avatar_quality', 0, '80', 0),
(274, 'votes', 'security', 0, '4', 0),
(275, 'map', 'full_index', 1, '0', 0),
(276, 'search', 'all_current_index_module_table', 1, '', 0),
(277, 'search', 'all_current_index_module_element', 1, '', 0),
(278, 'search', 'all_current_index_site', 1, '', 0),
(279, 'search', 'full_index', 1, '1', 0),
(280, 'editor', 'images_timeedit', 1, '1500639240', 0),
(281, 'editor', 'images_max_size', 1, '69630', 0),
(282, 'editor', 'images_count', 1, '11', 0),
(283, 'route', 'translate_yandex_key', 0, '', 0),
(284, 'core', 'trial', 1, '0', 0),
(285, 'shopexport', 'tmpname', 0, '499003086', 0),
(443, 'htmleditor', 'hide_shop_category_9', 1, 'anons,text', 18),
(497, 'shop', 'use_count_goods', 0, '0', 0),
(498, 'shop', 'one_click', 0, '1', 0),
(499, 'shop', 'rel_two_sided', 0, '1', 0),
(500, 'shop', 'nastr', 0, '12', 0),
(501, 'shop', 'sort', 0, '0', 0),
(502, 'shop', 'order_redirect', 0, 'shop/cart/done', 0),
(503, 'shop', 'attachment_extensions', 0, 'zip, rar', 0),
(504, 'shop', 'cat', 0, '1', 0),
(505, 'shop', 'nastr_cat', 0, '10', 0),
(506, 'shop', 'count_list', 0, '4', 0),
(507, 'shop', 'children_elements', 0, '1', 0),
(508, 'shop', 'count_child_list', 0, '1', 0),
(509, 'shop', 'currency', 1, 'руб.', 0),
(510, 'shop', 'format_price_3', 0, ' ', 0),
(511, 'shop', 'tax_name', 0, 'НДС', 0),
(512, 'shop', 'tax', 0, '18', 0),
(513, 'shop', 'search_price', 0, '1', 0),
(514, 'shop', 'search_article', 0, '1', 0),
(515, 'shop', 'comments', 0, '1', 0),
(516, 'shop', 'tags', 0, '1', 0),
(517, 'shop', 'rating', 0, '1', 0),
(518, 'shop', 'keywords', 0, '1', 0),
(519, 'shop', 'counter', 0, '1', 0),
(520, 'shop', 'images_variations_element', 0, 'a:3:{i:0;a:2:{s:4:"name";s:5:"large";s:2:"id";s:1:"3";}i:1;a:2:{s:4:"name";s:6:"medium";s:2:"id";s:1:"1";}i:2;a:2:{s:4:"name";s:7:"preview";s:2:"id";s:1:"4";}}', 0),
(521, 'shop', 'images_variations_cat', 0, 'a:2:{i:0;a:2:{s:4:"name";s:5:"large";s:2:"id";s:1:"3";}i:1;a:2:{s:4:"name";s:6:"medium";s:2:"id";s:1:"6";}}', 0),
(522, 'shop', 'images_variations_brand', 0, 'a:3:{i:0;a:2:{s:4:"name";s:5:"large";s:2:"id";s:1:"3";}i:1;a:2:{s:4:"name";s:6:"medium";s:2:"id";s:1:"1";}i:2;a:2:{s:4:"name";s:7:"preview";s:2:"id";s:1:"4";}}', 0),
(523, 'shop', 'use_animation', 0, '1', 0),
(524, 'shop', 'images_element', 0, '1', 0),
(525, 'shop', 'list_img_element', 0, '2', 0),
(526, 'shop', 'images_cat', 0, '1', 0),
(527, 'shop', 'list_img_cat', 0, '2', 0),
(528, 'shop', 'images_brand', 0, '1', 0),
(529, 'shop', 'yandex', 0, '1', 0),
(530, 'shop', 'nameshop', 0, 'ЧелныСептик', 0),
(531, 'shop', 'currencyyandex', 0, 'RUR', 0),
(532, 'shop', 'show_yandex_category', 0, '0', 0),
(533, 'shop', 'show_yandex_element', 0, '0', 0),
(534, 'shop', 'bid', 0, '15', 0),
(535, 'shop', 'subject_waitlist', 1, 'Товар поступил на склад', 0),
(536, 'shop', 'message_waitlist', 1, 'Здравствуйте!<br>Товар <a href="%link">%good</a> поступил на склад.', 0),
(537, 'shop', 'mes', 1, 'Оплата заказа №%id на сумму %summ руб.', 0),
(538, 'shop', 'desc_payment', 1, 'Oplata zakaza #%id', 0),
(539, 'shop', 'payment_success_text', 0, '<p>Спасибо, платеж успешно принят. В ближайшее время мы с Вами свяжемся для уточнения деталей заказа.</p>', 0),
(540, 'shop', 'payment_fail_text', 0, '<p>Извините, платеж не прошел.</p>', 0),
(541, 'shop', 'subject', 1, 'Вы оформили заказ %id на сайте %title (%url)', 0),
(542, 'shop', 'message', 1, '<p>Здравствуйте!</p><p>Вы оформили заказ #%id на сайте %title (%url)</p>%order<p>Способ оплаты: %payment</p><p>%message</p><p>Спасибо за Ваш заказ! В ближайшее время мы с Вами свяжемся для подтверждения заказа</p>', 0),
(543, 'shop', 'subject_change_status', 1, 'Статус заказа изменен', 0),
(544, 'shop', 'message_change_status', 1, 'Здравствуйте!<br>Статус заказ №%order изменен на «%status».', 0),
(545, 'shop', 'subject_admin', 0, '%title (%url). Новый заказ %id', 0),
(546, 'shop', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>На сайте появился новый заказ номер %id: %order<br>Способ оплаты: %payment<br><br>%message', 0),
(547, 'shop', 'subject_file_sale_message', 0, 'Вы оформили заказ %id на сайте %title (%url)', 0),
(548, 'shop', 'file_sale_message', 0, 'Здравствуйте!<br>Вы оформили заказ на сайте %title (%url):<br><br>Номер заказа: %id<br>Файлы можно скачать по ссылкам в течении часа: %files<br><br>Спасибо за Ваш заказ!', 0),
(549, 'shop', 'sendsmsadmin', 1, '0', 0),
(550, 'shop', 'where_access_element', 0, '0', 0),
(551, 'all', 'where_access', 0, '0', 0),
(552, 'htmleditor', 'hide_shop_category_10', 1, 'anons', 18),
(553, 'shop', 'where_access_cat', 0, '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `diafan_custom`
--

CREATE TABLE IF NOT EXISTS `diafan_custom` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `current` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'текущая тема: 0 - нет, 1 - да',
  `text` text COMMENT 'описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Темы';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_faq`
--

CREATE TABLE IF NOT EXISTS `diafan_faq` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `mail` varchar(40) NOT NULL DEFAULT '' COMMENT 'e-mail пользоваля, задавшего вопрос',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор основной категории из таблицы `diafan_faq_category`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'вопрос',
  `text1` text COMMENT 'ответ',
  `often` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'часто задаваемый вопрос: 0 - нет, 1 - да',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший вопрос в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Вопросы и ответы';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_faq_category`
--

CREATE TABLE IF NOT EXISTS `diafan_faq_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_faq_category`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных категорий',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории вопросов и ответов';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_faq_category_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_faq_category_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_faq_category`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории-родителя из таблицы `diafan_faq_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий вопросов и ответов';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_faq_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_faq_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор вопроса из таблицы `diafan_faq`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_faq_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи вопросов и ответов с категориями';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_faq_counter`
--

CREATE TABLE IF NOT EXISTS `diafan_faq_counter` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор вопроса из таблицы `diafan_faq`',
  `count_view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик вопросов и ответов';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_faq_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_faq_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор вопроса из таблицы `diafan_faq`',
  `rel_element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор похожего вопроса из таблицы `diafan_faq`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих вопросов и ответов';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_feedback`
--

CREATE TABLE IF NOT EXISTS `diafan_feedback` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `lang_id` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `text` text COMMENT 'ответ',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший сообщение в административной части',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'сообщение прочитано: 0 - нет, 1 - да',
  `url` text COMMENT 'страница, с которой отправлено сообщение',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сообщения из обратной связи';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_feedback_param`
--

CREATE TABLE IF NOT EXISTS `diafan_feedback_param` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `config` text COMMENT 'дополнительные настройки поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Поля конструктора формы обратной связи';

--
-- Dumping data for table `diafan_feedback_param`
--

INSERT INTO `diafan_feedback_param` (`id`, `name1`, `type`, `site_id`, `sort`, `required`, `text1`, `config`, `trash`) VALUES
(1, 'Ваше имя', 'text', 9, 2, '0', NULL, NULL, '0'),
(2, 'Ваш e-mail', 'email', 9, 6, '0', NULL, NULL, '0'),
(3, 'Ваше сообщение', 'textarea', 9, 8, '0', NULL, NULL, '0'),
(4, 'Дата Вашего рождения', 'date', 9, 3, '0', NULL, NULL, '0'),
(5, 'Вы турист?', 'select', 9, 4, '0', NULL, NULL, '0'),
(6, 'Ваш телефон', 'text', 9, 7, '0', NULL, NULL, '0'),
(7, 'Для связи', 'title', 9, 5, '0', NULL, NULL, '0'),
(8, 'О Вас', 'title', 9, 1, '0', NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_feedback_param_element`
--

CREATE TABLE IF NOT EXISTS `diafan_feedback_param_element` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `value` text COMMENT 'значение',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_feedback_param`',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор сообщения из таблицы `diafan_feedback`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения полей конструктора формы обратной связи, заполненные в сообщении';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_feedback_param_select`
--

CREATE TABLE IF NOT EXISTS `diafan_feedback_param_select` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_feedback_param`',
  `value` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Варианты значений полей конструктора с типом список';

--
-- Dumping data for table `diafan_feedback_param_select`
--

INSERT INTO `diafan_feedback_param_select` (`id`, `param_id`, `value`, `name1`, `sort`, `trash`) VALUES
(1, 5, 0, 'Да', 1, '0'),
(2, 5, 0, 'Нет', 2, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_files`
--

CREATE TABLE IF NOT EXISTS `diafan_files` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор основной категории из таблицы `diafan_files_category`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший файл в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Файлы в файловом архиве';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_files_category`
--

CREATE TABLE IF NOT EXISTS `diafan_files_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_files_category`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных категорий',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории файлового архива';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_files_category_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_files_category_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_files_category`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории-родителя из таблицы `diafan_files_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий файлового архива';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_files_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_files_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор файла из таблицы `diafan_files`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_files_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи файлов и категорий в файловом архиве';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_files_counter`
--

CREATE TABLE IF NOT EXISTS `diafan_files_counter` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор файла из таблицы `diafan_files`',
  `count_view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров файлов в файловом архиве';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_files_links`
--

CREATE TABLE IF NOT EXISTS `diafan_files_links` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор файла из таблицы `diafan_files`',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT 'внешняя ссылка',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Внешние ссылки на файлы для файлового архива';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_files_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_files_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор вопроса из таблицы `diafan_files`',
  `rel_element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор связанного вопроса из таблицы `diafan_files`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих файлов';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_forum`
--

CREATE TABLE IF NOT EXISTS `diafan_forum` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_forum_category`',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата редакции',
  `user_update` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`, отредактировавший сообщение',
  `timeedit` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `counter_view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество просмотров',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `prior` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'тема закреплена: 0 - нет, 1 - да',
  `close` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'тема закрыта: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Темы форума';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_forum_blocks`
--

CREATE TABLE IF NOT EXISTS `diafan_forum_blocks` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Блоки форума';

--
-- Dumping data for table `diafan_forum_blocks`
--

INSERT INTO `diafan_forum_blocks` (`id`, `name`, `sort`, `act`, `trash`) VALUES
(1, 'Главная категория форума', 1, '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_forum_category`
--

CREATE TABLE IF NOT EXISTS `diafan_forum_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `block_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор блока из таблицы `diafan_forum_blocks`',
  `counter_view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество просмотров',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Категории форума';

--
-- Dumping data for table `diafan_forum_category`
--

INSERT INTO `diafan_forum_category` (`id`, `name`, `timeedit`, `block_id`, `counter_view`, `act`, `sort`, `trash`) VALUES
(1, 'Общий раздел', 1500639156, 1, 0, '1', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_forum_messages`
--

CREATE TABLE IF NOT EXISTS `diafan_forum_messages` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT 'название',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_forum_messages`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных сообщений',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата редакции',
  `user_update` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`, отредактировавший сообщение',
  `forum_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор темы из таблицы `diafan_forum`',
  `text` text COMMENT 'описание',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сообщения на форуме';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_forum_messages_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_forum_messages_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор сообщения из таблицы `diafan_forum_messages`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя сообщения из таблицы `diafan_forum_messages`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи сообщений';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_forum_show`
--

CREATE TABLE IF NOT EXISTS `diafan_forum_show` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор сообщения из таблицы `diafan_forum_messages`',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Новые сообщения и темы для пользователей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_geomap`
--

CREATE TABLE IF NOT EXISTS `diafan_geomap` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `point` text COMMENT 'координаты точки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Точки на карте';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_images`
--

CREATE TABLE IF NOT EXISTS `diafan_images` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `image_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор изображения из таблицы `diafan_images`, если запись является ссылкой на изображение',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название файла',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat','brand') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `alt1` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибут alt',
  `title1` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибут title',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор поля или характеристики с типом «изображения»',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'размер файла',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `tmpcode` varchar(32) NOT NULL DEFAULT '' COMMENT 'временный идентификатор, если изображение прикрепляется к еще не созданному элементу',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `folder_num` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'номер папки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=3511 DEFAULT CHARSET=utf8 COMMENT='Прикрепленные изображения';

--
-- Dumping data for table `diafan_images`
--

INSERT INTO `diafan_images` (`id`, `image_id`, `name`, `module_name`, `element_type`, `element_id`, `alt1`, `title1`, `param_id`, `size`, `sort`, `tmpcode`, `created`, `folder_num`, `trash`) VALUES
(16, 0, '16_topas-s-5-long.jpg', 'shop', 'element', 9, '', '', 0, 0, 16, '', 1501076107, 0, '0'),
(1279, 0, '1279_evrolos-eko.jpg', 'shop', 'cat', 47, '', '', 0, 0, 1279, '', 1503902743, 0, '0'),
(1280, 0, '1280_evrolos-bio.jpg', 'shop', 'cat', 48, '', '', 0, 0, 1280, '', 1503902743, 0, '0'),
(1281, 0, '1281_evrolos-pro.jpg', 'shop', 'cat', 49, '', '', 0, 0, 1281, '', 1503902743, 0, '0'),
(1283, 0, '1283_evrolos-pro-pr.jpg', 'shop', 'cat', 51, '', '', 0, 0, 1283, '', 1503902743, 0, '0'),
(3278, 0, '3278_topas-s-4.jpg', 'shop', 'element', 50, '', '', 0, 0, 3278, '', 1510841447, 0, '0'),
(3279, 0, '3279_topas-s-4-pr.jpg', 'shop', 'element', 51, '', '', 0, 0, 3279, '', 1510841447, 0, '0'),
(3280, 0, '3280_topas-s-5.jpg', 'shop', 'element', 52, '', '', 0, 0, 3280, '', 1510841448, 0, '0'),
(3281, 0, '3281_topas-s-5-long.jpg', 'shop', 'element', 53, '', '', 0, 0, 3281, '', 1510841449, 0, '0'),
(3282, 0, '3282_topas-s-5-pr.jpg', 'shop', 'element', 54, '', '', 0, 0, 3282, '', 1510841449, 0, '0'),
(3283, 0, '3283_topas-s-5-long-pr.jpg', 'shop', 'element', 55, '', '', 0, 0, 3283, '', 1510841450, 0, '0'),
(3284, 0, '3284_topas-s-6.jpg', 'shop', 'element', 56, '', '', 0, 0, 3284, '', 1510841451, 0, '0'),
(3285, 0, '3285_topas-s-6-long.jpg', 'shop', 'element', 57, '', '', 0, 0, 3285, '', 1510841452, 0, '0'),
(3286, 0, '3286_topas-s-6-pr.jpg', 'shop', 'element', 58, '', '', 0, 0, 3286, '', 1510841452, 0, '0'),
(3287, 0, '3287_topas-s-6-long-pr.jpg', 'shop', 'element', 59, '', '', 0, 0, 3287, '', 1510841453, 0, '0'),
(3288, 0, '3288_topas-s-8.jpg', 'shop', 'element', 60, '', '', 0, 0, 3288, '', 1510841454, 0, '0'),
(3289, 0, '3289_topas-s-8-long.jpg', 'shop', 'element', 61, '', '', 0, 0, 3289, '', 1510841454, 0, '0'),
(3290, 0, '3290_topas-s-8-pr.jpg', 'shop', 'element', 62, '', '', 0, 0, 3290, '', 1510841455, 0, '0'),
(3291, 0, '3291_topas-s-8-long-pr.jpg', 'shop', 'element', 63, '', '', 0, 0, 3291, '', 1510841456, 0, '0'),
(3292, 0, '3292_topas-s-8-long-us.jpg', 'shop', 'element', 64, '', '', 0, 0, 3292, '', 1510841457, 0, '0'),
(3293, 0, '3293_topas-s-8-long-us-pr.jpg', 'shop', 'element', 65, '', '', 0, 0, 3293, '', 1510841458, 0, '0'),
(3294, 0, '3294_topas-s-9.jpg', 'shop', 'element', 66, '', '', 0, 0, 3294, '', 1510841459, 0, '0'),
(3295, 0, '3295_topas-s-9-long.jpg', 'shop', 'element', 67, '', '', 0, 0, 3295, '', 1510841460, 0, '0'),
(3296, 0, '3296_topas-s-9-long-us.jpg', 'shop', 'element', 68, '', '', 0, 0, 3296, '', 1510841460, 0, '0'),
(3297, 0, '3297_topas-s-9-pr.jpg', 'shop', 'element', 69, '', '', 0, 0, 3297, '', 1510841461, 0, '0'),
(3298, 0, '3298_topas-s-9-long-pr.jpg', 'shop', 'element', 70, '', '', 0, 0, 3298, '', 1510841462, 0, '0'),
(3299, 0, '3299_topas-s-9-long-us-pr.jpg', 'shop', 'element', 71, '', '', 0, 0, 3299, '', 1510841463, 0, '0'),
(3300, 0, '3300_topas-s-10.jpg', 'shop', 'element', 72, '', '', 0, 0, 3300, '', 1510841463, 0, '0'),
(3301, 0, '3301_topas-s-10-long.jpg', 'shop', 'element', 73, '', '', 0, 0, 3301, '', 1510841464, 0, '0'),
(3302, 0, '3302_topas-s-10-long-us.jpg', 'shop', 'element', 74, '', '', 0, 0, 3302, '', 1510841465, 0, '0'),
(3303, 0, '3303_topas-s-10-pr.jpg', 'shop', 'element', 75, '', '', 0, 0, 3303, '', 1510841465, 0, '0'),
(3304, 0, '3304_topas-s-10-long-pr.jpg', 'shop', 'element', 76, '', '', 0, 0, 3304, '', 1510841466, 0, '0'),
(3305, 0, '3305_topas-s-10-long-us-pr.jpg', 'shop', 'element', 77, '', '', 0, 0, 3305, '', 1510841467, 0, '0'),
(3306, 0, '3306_topas-s-12.jpg', 'shop', 'element', 78, '', '', 0, 0, 3306, '', 1510841467, 0, '0'),
(3307, 0, '3307_topas-s-12-pr.jpg', 'shop', 'element', 79, '', '', 0, 0, 3307, '', 1510841468, 0, '0'),
(3308, 0, '3308_topas-s-12-long-us.jpg', 'shop', 'element', 80, '', '', 0, 0, 3308, '', 1510841469, 0, '0'),
(3309, 0, '3309_topas-s-12-long.jpg', 'shop', 'element', 81, '', '', 0, 0, 3309, '', 1510841469, 0, '0'),
(3310, 0, '3310_topas-s-12-long-pr.jpg', 'shop', 'element', 82, '', '', 0, 0, 3310, '', 1510841470, 0, '0'),
(3311, 0, '3311_topas-s-12-long-pr-us.jpg', 'shop', 'element', 83, '', '', 0, 0, 3311, '', 1510841471, 0, '0'),
(3312, 0, '3312_topas-4.jpg', 'shop', 'element', 84, '', '', 0, 0, 3312, '', 1510841471, 0, '0'),
(3313, 0, '3313_topas-4-pr.jpg', 'shop', 'element', 85, '', '', 0, 0, 3313, '', 1510841471, 0, '0'),
(3314, 0, '3314_topas-5.jpg', 'shop', 'element', 86, '', '', 0, 0, 3314, '', 1510841472, 0, '0'),
(3315, 0, '3315_topas-5-long.jpg', 'shop', 'element', 87, '', '', 0, 0, 3315, '', 1510841473, 0, '0'),
(3316, 0, '3316_topas-5-pr.jpg', 'shop', 'element', 88, '', '', 0, 0, 3316, '', 1510841473, 0, '0'),
(3317, 0, '3317_topas-5-long-pr.jpg', 'shop', 'element', 89, '', '', 0, 0, 3317, '', 1510841474, 0, '0'),
(3318, 0, '3318_topas-6.jpg', 'shop', 'element', 90, '', '', 0, 0, 3318, '', 1510841475, 0, '0'),
(3319, 0, '3319_topas-6-pr.jpg', 'shop', 'element', 91, '', '', 0, 0, 3319, '', 1510841476, 0, '0'),
(3320, 0, '3320_topas-6-long.jpg', 'shop', 'element', 92, '', '', 0, 0, 3320, '', 1510841476, 0, '0'),
(3321, 0, '3321_topas-6-long-pr.jpg', 'shop', 'element', 93, '', '', 0, 0, 3321, '', 1510841477, 0, '0'),
(3322, 0, '3322_topas-8.jpg', 'shop', 'element', 94, '', '', 0, 0, 3322, '', 1510841478, 0, '0'),
(3323, 0, '3323_topas-8-long.jpg', 'shop', 'element', 95, '', '', 0, 0, 3323, '', 1510841479, 0, '0'),
(3324, 0, '3324_topas-8-pr.jpg', 'shop', 'element', 96, '', '', 0, 0, 3324, '', 1510841479, 0, '0'),
(3325, 0, '3325_topas-8-long-us.jpg', 'shop', 'element', 97, '', '', 0, 0, 3325, '', 1510841480, 0, '0'),
(3326, 0, '3326_topas-8-long-pr.jpg', 'shop', 'element', 98, '', '', 0, 0, 3326, '', 1510841481, 0, '0'),
(3327, 0, '3327_topas-8-long-us-pr.jpg', 'shop', 'element', 99, '', '', 0, 0, 3327, '', 1510841481, 0, '0'),
(3328, 0, '3328_topas-9.jpg', 'shop', 'element', 100, '', '', 0, 0, 3328, '', 1510841482, 0, '0'),
(3329, 0, '3329_topas-9-long.jpg', 'shop', 'element', 101, '', '', 0, 0, 3329, '', 1510841483, 0, '0'),
(3330, 0, '3330_topas-9-pr.jpg', 'shop', 'element', 102, '', '', 0, 0, 3330, '', 1510841483, 0, '0'),
(3331, 0, '3331_topas-9-long-us.jpg', 'shop', 'element', 103, '', '', 0, 0, 3331, '', 1510841484, 0, '0'),
(3332, 0, '3332_topas-9-long-pr.jpg', 'shop', 'element', 104, '', '', 0, 0, 3332, '', 1510841485, 0, '0'),
(3333, 0, '3333_topas-9-long-pr-us.jpg', 'shop', 'element', 105, '', '', 0, 0, 3333, '', 1510841485, 0, '0'),
(3334, 0, '3334_topas-10.jpg', 'shop', 'element', 106, '', '', 0, 0, 3334, '', 1510841486, 0, '0'),
(3335, 0, '3335_topas-10-pr.jpg', 'shop', 'element', 107, '', '', 0, 0, 3335, '', 1510841487, 0, '0'),
(3336, 0, '3336_topas-10-long.jpg', 'shop', 'element', 108, '', '', 0, 0, 3336, '', 1510841487, 0, '0'),
(3337, 0, '3337_topas-10-long-us.jpg', 'shop', 'element', 109, '', '', 0, 0, 3337, '', 1510841488, 0, '0'),
(3338, 0, '3338_topas-10-long-pr.jpg', 'shop', 'element', 110, '', '', 0, 0, 3338, '', 1510841489, 0, '0'),
(3339, 0, '3339_topas-10-long-pr-us.jpg', 'shop', 'element', 111, '', '', 0, 0, 3339, '', 1510841490, 0, '0'),
(3340, 0, '3340_topas-12.jpg', 'shop', 'element', 112, '', '', 0, 0, 3340, '', 1510841490, 0, '0'),
(3341, 0, '3341_topas-12-long.jpg', 'shop', 'element', 113, '', '', 0, 0, 3341, '', 1510841491, 0, '0'),
(3342, 0, '3342_topas-12-pr.jpg', 'shop', 'element', 114, '', '', 0, 0, 3342, '', 1510841492, 0, '0'),
(3343, 0, '3343_topas-12-long-us.jpg', 'shop', 'element', 115, '', '', 0, 0, 3343, '', 1510841493, 0, '0'),
(3344, 0, '3344_topas-12-long-pr.jpg', 'shop', 'element', 116, '', '', 0, 0, 3344, '', 1510841493, 0, '0'),
(3345, 0, '3345_topas-12-long-pr-us.jpg', 'shop', 'element', 117, '', '', 0, 0, 3345, '', 1510841494, 0, '0'),
(3346, 0, '3346_topas-15-long-pr-us.jpg', 'shop', 'element', 118, '', '', 0, 0, 3346, '', 1510841495, 0, '0'),
(3347, 0, '3347_topas-15-pr.jpg', 'shop', 'element', 119, '', '', 0, 0, 3347, '', 1510841496, 0, '0'),
(3348, 0, '3348_topas-15-long.jpg', 'shop', 'element', 120, '', '', 0, 0, 3348, '', 1510841498, 0, '0'),
(3349, 0, '3349_topas-15.jpg', 'shop', 'element', 121, '', '', 0, 0, 3349, '', 1510841499, 0, '0'),
(3350, 0, '3350_topas-15-long-us.jpg', 'shop', 'element', 122, '', '', 0, 0, 3350, '', 1510841500, 0, '0'),
(3351, 0, '3351_topas-15-long-pr.jpg', 'shop', 'element', 123, '', '', 0, 0, 3351, '', 1510841501, 0, '0'),
(3352, 0, '3352_topas-20.jpg', 'shop', 'element', 124, '', '', 0, 0, 3352, '', 1510841503, 0, '0'),
(3353, 0, '3353_topas-20-long-pr.jpg', 'shop', 'element', 125, '', '', 0, 0, 3353, '', 1510841504, 0, '0'),
(3354, 0, '3354_topas-20-pr.jpg', 'shop', 'element', 126, '', '', 0, 0, 3354, '', 1510841505, 0, '0'),
(3355, 0, '3355_topas-20-long.jpg', 'shop', 'element', 127, '', '', 0, 0, 3355, '', 1510841506, 0, '0'),
(3356, 0, '3356_topas-30.jpg', 'shop', 'element', 128, '', '', 0, 0, 3356, '', 1510841507, 0, '0'),
(3357, 0, '3357_topas-30-long-pr.jpg', 'shop', 'element', 129, '', '', 0, 0, 3357, '', 1510841508, 0, '0'),
(3358, 0, '3358_topas-30-long.jpg', 'shop', 'element', 130, '', '', 0, 0, 3358, '', 1510841509, 0, '0'),
(3359, 0, '3359_topas-30-pr.jpg', 'shop', 'element', 131, '', '', 0, 0, 3359, '', 1510841510, 0, '0'),
(3360, 0, '3360_topas-40-pr.jpg', 'shop', 'element', 132, '', '', 0, 0, 3360, '', 1510841511, 0, '0'),
(3361, 0, '3361_topas-40.jpg', 'shop', 'element', 133, '', '', 0, 0, 3361, '', 1510841511, 0, '0'),
(3362, 0, '3362_topas-50-pr.jpg', 'shop', 'element', 134, '', '', 0, 0, 3362, '', 1510841512, 0, '0'),
(3363, 0, '3363_topas-50.jpg', 'shop', 'element', 135, '', '', 0, 0, 3363, '', 1510841513, 0, '0'),
(3364, 0, '3364_topas-75-pr.jpg', 'shop', 'element', 136, '', '', 0, 0, 3364, '', 1510841514, 0, '0'),
(3365, 0, '3365_topas-75.jpg', 'shop', 'element', 137, '', '', 0, 0, 3365, '', 1510841515, 0, '0'),
(3366, 0, '3366_topas-100.jpg', 'shop', 'element', 138, '', '', 0, 0, 3366, '', 1510841516, 0, '0'),
(3367, 0, '3367_topas-100-pr.jpg', 'shop', 'element', 139, '', '', 0, 0, 3367, '', 1510841517, 0, '0'),
(3368, 0, '3368_topas-150-pr.jpg', 'shop', 'element', 140, '', '', 0, 0, 3368, '', 1510841518, 0, '0'),
(3369, 0, '3369_topas-150.jpg', 'shop', 'element', 141, '', '', 0, 0, 3369, '', 1510841519, 0, '0'),
(3370, 0, '3370_topaero-3.jpg', 'shop', 'element', 142, '', '', 0, 0, 3370, '', 1510841520, 0, '0'),
(3371, 0, '3371_topaero-3-long.jpg', 'shop', 'element', 143, '', '', 0, 0, 3371, '', 1510841522, 0, '0'),
(3372, 0, '3372_topaero-3-pr.jpg', 'shop', 'element', 144, '', '', 0, 0, 3372, '', 1510841524, 0, '0'),
(3373, 0, '3373_topaero-3-long-pr.jpg', 'shop', 'element', 145, '', '', 0, 0, 3373, '', 1510841525, 0, '0'),
(3374, 0, '3374_topaero-3-long-us.jpg', 'shop', 'element', 146, '', '', 0, 0, 3374, '', 1510841526, 0, '0'),
(3375, 0, '3375_topaero-3-long-pr-us.jpg', 'shop', 'element', 147, '', '', 0, 0, 3375, '', 1510841528, 0, '0'),
(3376, 0, '3376_topaero-4.jpg', 'shop', 'element', 148, '', '', 0, 0, 3376, '', 1510841529, 0, '0'),
(3377, 0, '3377_topaero-4-long.jpg', 'shop', 'element', 149, '', '', 0, 0, 3377, '', 1510841530, 0, '0'),
(3378, 0, '3378_topaero-4-pr.jpg', 'shop', 'element', 150, '', '', 0, 0, 3378, '', 1510841531, 0, '0'),
(3379, 0, '3379_topaero-4-long-us.jpg', 'shop', 'element', 151, '', '', 0, 0, 3379, '', 1510841532, 0, '0'),
(3380, 0, '3380_topaero-4-long-pr.jpg', 'shop', 'element', 152, '', '', 0, 0, 3380, '', 1510841532, 0, '0'),
(3381, 0, '3381_topaero-4-long-pr-us.jpg', 'shop', 'element', 153, '', '', 0, 0, 3381, '', 1510841533, 0, '0'),
(3382, 0, '3382_topaero-6.jpg', 'shop', 'element', 154, '', '', 0, 0, 3382, '', 1510841534, 0, '0'),
(3383, 0, '3383_topaero-6-long.jpg', 'shop', 'element', 155, '', '', 0, 0, 3383, '', 1510841535, 0, '0'),
(3384, 0, '3384_topaero-6-long-us.jpg', 'shop', 'element', 156, '', '', 0, 0, 3384, '', 1510841536, 0, '0'),
(3385, 0, '3385_topaero-6-pr.jpg', 'shop', 'element', 157, '', '', 0, 0, 3385, '', 1510841536, 0, '0'),
(3386, 0, '3386_topaero-6-long-pr.jpg', 'shop', 'element', 158, '', '', 0, 0, 3386, '', 1510841537, 0, '0'),
(3387, 0, '3387_topaero-6-long-pr-us.jpg', 'shop', 'element', 159, '', '', 0, 0, 3387, '', 1510841538, 0, '0'),
(3388, 0, '3388_topaero-7.jpg', 'shop', 'element', 160, '', '', 0, 0, 3388, '', 1510841539, 0, '0'),
(3389, 0, '3389_topaero-7-pr.jpg', 'shop', 'element', 161, '', '', 0, 0, 3389, '', 1510841540, 0, '0'),
(3390, 0, '3390_topaero-9.jpg', 'shop', 'element', 162, '', '', 0, 0, 3390, '', 1510841541, 0, '0'),
(3391, 0, '3391_topaero-9-pr.jpg', 'shop', 'element', 163, '', '', 0, 0, 3391, '', 1510841542, 0, '0'),
(3392, 0, '3392_topaero-12.jpg', 'shop', 'element', 164, '', '', 0, 0, 3392, '', 1510841543, 0, '0'),
(3393, 0, '3393_topaero-12-pr.jpg', 'shop', 'element', 165, '', '', 0, 0, 3393, '', 1510841544, 0, '0'),
(3394, 0, '3394_topaero-16.jpg', 'shop', 'element', 166, '', '', 0, 0, 3394, '', 1510841545, 0, '0'),
(3395, 0, '3395_topaero-16-pr.jpg', 'shop', 'element', 167, '', '', 0, 0, 3395, '', 1510841545, 0, '0'),
(3396, 0, '3396_topaero-24.jpg', 'shop', 'element', 168, '', '', 0, 0, 3396, '', 1510841546, 0, '0'),
(3397, 0, '3397_topaero-24-pr.jpg', 'shop', 'element', 169, '', '', 0, 0, 3397, '', 1510841547, 0, '0'),
(3398, 0, '3398_topaero-32.jpg', 'shop', 'element', 170, '', '', 0, 0, 3398, '', 1510841548, 0, '0'),
(3399, 0, '3399_topaero-32-pr.jpg', 'shop', 'element', 171, '', '', 0, 0, 3399, '', 1510841549, 0, '0'),
(3400, 0, '3400_topbio.jpg', 'shop', 'element', 172, '', '', 0, 0, 3400, '', 1510841550, 0, '0'),
(3401, 0, '3401_evrolos-udacha.jpg', 'shop', 'element', 173, '', '', 0, 0, 3401, '', 1510841550, 0, '0'),
(3402, 0, '3402_evrolos-eko.jpg', 'shop', 'element', 174, '', '', 0, 0, 3402, '', 1510841551, 0, '0'),
(3403, 0, '3403_evrolos-eko-06.jpg', 'shop', 'element', 175, '', '', 0, 0, 3403, '', 1510841551, 0, '0'),
(3404, 0, '3404_evrolos-eko-08.jpg', 'shop', 'element', 176, '', '', 0, 0, 3404, '', 1510841551, 0, '0'),
(3405, 0, '3405_evrolos-eko-1.jpg', 'shop', 'element', 177, '', '', 0, 0, 3405, '', 1510841552, 0, '0'),
(3406, 0, '3406_evrolos-eko-15.jpg', 'shop', 'element', 178, '', '', 0, 0, 3406, '', 1510841552, 0, '0'),
(3407, 0, '3407_evrolos-eko-24.jpg', 'shop', 'element', 179, '', '', 0, 0, 3407, '', 1510841552, 0, '0'),
(3408, 0, '3408_evrolos-eko-3.jpg', 'shop', 'element', 180, '', '', 0, 0, 3408, '', 1510841552, 0, '0'),
(3409, 0, '3409_evrolos-eko-4.jpg', 'shop', 'element', 181, '', '', 0, 0, 3409, '', 1510841553, 0, '0'),
(3410, 0, '3410_evrolos-bio-3.jpg', 'shop', 'element', 182, '', '', 0, 0, 3410, '', 1510841553, 0, '0'),
(3411, 0, '3411_evrolos-bio-4.jpg', 'shop', 'element', 183, '', '', 0, 0, 3411, '', 1510841553, 0, '0'),
(3412, 0, '3412_evrolos-bio-5.jpg', 'shop', 'element', 184, '', '', 0, 0, 3412, '', 1510841553, 0, '0'),
(3413, 0, '3413_evrolos-bio-6.jpg', 'shop', 'element', 185, '', '', 0, 0, 3413, '', 1510841553, 0, '0'),
(3414, 0, '3414_evrolos-bio-8.jpg', 'shop', 'element', 186, '', '', 0, 0, 3414, '', 1510841553, 0, '0'),
(3415, 0, '3415_evrolos-bio-10.jpg', 'shop', 'element', 187, '', '', 0, 0, 3415, '', 1510841554, 0, '0'),
(3416, 0, '3416_evrolos-bio-12.jpg', 'shop', 'element', 188, '', '', 0, 0, 3416, '', 1510841554, 0, '0'),
(3417, 0, '3417_evrolos-bio-15.jpg', 'shop', 'element', 189, '', '', 0, 0, 3417, '', 1510841554, 0, '0'),
(3418, 0, '3418_evrolos-bio-20.jpg', 'shop', 'element', 190, '', '', 0, 0, 3418, '', 1510841554, 0, '0'),
(3419, 0, '3419_evrolos-bio-3-pr.jpg', 'shop', 'element', 202, '', '', 0, 0, 3419, '', 1510841555, 0, '0'),
(3420, 0, '3420_evrolos-bio-4-pr.jpg', 'shop', 'element', 203, '', '', 0, 0, 3420, '', 1510841555, 0, '0'),
(3421, 0, '3421_evrolos-bio-5-pr.jpg', 'shop', 'element', 204, '', '', 0, 0, 3421, '', 1510841555, 0, '0'),
(3422, 0, '3422_evrolos-bio-6-pr.jpg', 'shop', 'element', 205, '', '', 0, 0, 3422, '', 1510841555, 0, '0'),
(3423, 0, '3423_evrolos-bio-8-pr.jpg', 'shop', 'element', 206, '', '', 0, 0, 3423, '', 1510841555, 0, '0'),
(3424, 0, '3424_evrolos-bio-10-pr.jpg', 'shop', 'element', 207, '', '', 0, 0, 3424, '', 1510841556, 0, '0'),
(3425, 0, '3425_evrolos-bio-12-pr.jpg', 'shop', 'element', 208, '', '', 0, 0, 3425, '', 1510841556, 0, '0'),
(3426, 0, '3426_evrolos-bio-15-pr.jpg', 'shop', 'element', 209, '', '', 0, 0, 3426, '', 1510841556, 0, '0'),
(3427, 0, '3427_evrolos-bio-20-pr.jpg', 'shop', 'element', 210, '', '', 0, 0, 3427, '', 1510841556, 0, '0'),
(3428, 0, '3428_evrolos-pro-3.jpg', 'shop', 'element', 191, '', '', 0, 0, 3428, '', 1510841556, 0, '0'),
(3429, 0, '3429_evrolos-pro-4.jpg', 'shop', 'element', 192, '', '', 0, 0, 3429, '', 1510841556, 0, '0'),
(3430, 0, '3430_evrolos-pro-5.jpg', 'shop', 'element', 193, '', '', 0, 0, 3430, '', 1510841557, 0, '0'),
(3431, 0, '3431_evrolos-pro-6.jpg', 'shop', 'element', 194, '', '', 0, 0, 3431, '', 1510841557, 0, '0'),
(3432, 0, '3432_evrolos-pro-8.jpg', 'shop', 'element', 195, '', '', 0, 0, 3432, '', 1510841557, 0, '0'),
(3433, 0, '3433_evrolos-pro-10.jpg', 'shop', 'element', 196, '', '', 0, 0, 3433, '', 1510841557, 0, '0'),
(3434, 0, '3434_evrolos-pro-12.jpg', 'shop', 'element', 197, '', '', 0, 0, 3434, '', 1510841557, 0, '0'),
(3435, 0, '3435_evrolos-pro-15.jpg', 'shop', 'element', 198, '', '', 0, 0, 3435, '', 1510841557, 0, '0'),
(3436, 0, '3436_evrolos-pro-20.jpg', 'shop', 'element', 199, '', '', 0, 0, 3436, '', 1510841558, 0, '0'),
(3437, 0, '3437_evrolos-pro-25.jpg', 'shop', 'element', 200, '', '', 0, 0, 3437, '', 1510841558, 0, '0'),
(3438, 0, '3438_evrolos-pro-30.jpg', 'shop', 'element', 201, '', '', 0, 0, 3438, '', 1510841558, 0, '0'),
(3439, 0, '3439_evrolos-pro-3-pr.jpg', 'shop', 'element', 211, '', '', 0, 0, 3439, '', 1510841559, 0, '0'),
(3440, 0, '3440_evrolos-pro-4-pr.jpg', 'shop', 'element', 212, '', '', 0, 0, 3440, '', 1510841559, 0, '0'),
(3441, 0, '3441_evrolos-pro-5-pr.jpg', 'shop', 'element', 213, '', '', 0, 0, 3441, '', 1510841559, 0, '0'),
(3442, 0, '3442_evrolos-pro-6-pr.jpg', 'shop', 'element', 214, '', '', 0, 0, 3442, '', 1510841559, 0, '0'),
(3443, 0, '3443_evrolos-pro-8-pr.jpg', 'shop', 'element', 215, '', '', 0, 0, 3443, '', 1510841559, 0, '0'),
(3444, 0, '3444_evrolos-pro-10-pr.jpg', 'shop', 'element', 216, '', '', 0, 0, 3444, '', 1510841560, 0, '0'),
(3445, 0, '3445_evrolos-pro-12-pr.jpg', 'shop', 'element', 217, '', '', 0, 0, 3445, '', 1510841560, 0, '0'),
(3446, 0, '3446_evrolos-pro-15-pr.jpg', 'shop', 'element', 218, '', '', 0, 0, 3446, '', 1510841560, 0, '0'),
(3447, 0, '3447_evrolos-pro-20-pr.jpg', 'shop', 'element', 219, '', '', 0, 0, 3447, '', 1510841560, 0, '0'),
(3448, 0, '3448_evrolos-pro-25-pr.jpg', 'shop', 'element', 220, '', '', 0, 0, 3448, '', 1510841560, 0, '0'),
(3449, 0, '3449_evrolos-pro-30-pr.jpg', 'shop', 'element', 221, '', '', 0, 0, 3449, '', 1510841561, 0, '0'),
(3450, 0, '3450_topas-s-4.jpg', 'shop', 'cat', 9, '', '', 0, 0, 3450, '', 1510907109, 0, '0'),
(3451, 0, '3451_topas-s-5.jpg', 'shop', 'cat', 10, '', '', 0, 0, 3451, '', 1510907109, 0, '0'),
(3452, 0, '3452_topas-s-6.jpg', 'shop', 'cat', 11, '', '', 0, 0, 3452, '', 1510907109, 0, '0'),
(3453, 0, '3453_topas-s-8.jpg', 'shop', 'cat', 33, '', '', 0, 0, 3453, '', 1510907109, 0, '0'),
(3454, 0, '3454_topas-s-9.jpg', 'shop', 'cat', 34, '', '', 0, 0, 3454, '', 1510907109, 0, '0'),
(3455, 0, '3455_topas-s-10.jpg', 'shop', 'cat', 35, '', '', 0, 0, 3455, '', 1510907109, 0, '0'),
(3456, 0, '3456_topas-s-12.jpg', 'shop', 'cat', 36, '', '', 0, 0, 3456, '', 1510907110, 0, '0'),
(3457, 0, '3457_topas-4.jpg', 'shop', 'cat', 13, '', '', 0, 0, 3457, '', 1510907110, 0, '0'),
(3458, 0, '3458_topas-5.jpg', 'shop', 'cat', 14, '', '', 0, 0, 3458, '', 1510907110, 0, '0'),
(3459, 0, '3459_topas-6.jpg', 'shop', 'cat', 21, '', '', 0, 0, 3459, '', 1510907110, 0, '0'),
(3460, 0, '3460_topas-8.jpg', 'shop', 'cat', 22, '', '', 0, 0, 3460, '', 1510907110, 0, '0'),
(3461, 0, '3461_topas-9.jpg', 'shop', 'cat', 50, '', '', 0, 0, 3461, '', 1510907110, 0, '0'),
(3462, 0, '3462_topas-10.jpg', 'shop', 'cat', 23, '', '', 0, 0, 3462, '', 1510907110, 0, '0'),
(3463, 0, '3463_topas-12.jpg', 'shop', 'cat', 24, '', '', 0, 0, 3463, '', 1510907110, 0, '0'),
(3464, 0, '3464_topas-15.jpg', 'shop', 'cat', 25, '', '', 0, 0, 3464, '', 1510907110, 0, '0'),
(3465, 0, '3465_topas-20.jpg', 'shop', 'cat', 26, '', '', 0, 0, 3465, '', 1510907110, 0, '0'),
(3466, 0, '3466_topas-30.jpg', 'shop', 'cat', 27, '', '', 0, 0, 3466, '', 1510907111, 0, '0'),
(3467, 0, '3467_topas-40.jpg', 'shop', 'cat', 28, '', '', 0, 0, 3467, '', 1510907111, 0, '0'),
(3468, 0, '3468_topas-50.jpg', 'shop', 'cat', 29, '', '', 0, 0, 3468, '', 1510907111, 0, '0'),
(3469, 0, '3469_topas-75.jpg', 'shop', 'cat', 30, '', '', 0, 0, 3469, '', 1510907111, 0, '0'),
(3470, 0, '3470_topas-100.jpg', 'shop', 'cat', 31, '', '', 0, 0, 3470, '', 1510907111, 0, '0'),
(3471, 0, '3471_topas-150.jpg', 'shop', 'cat', 32, '', '', 0, 0, 3471, '', 1510907111, 0, '0'),
(3472, 0, '3472_topaero-3.jpg', 'shop', 'cat', 37, '', '', 0, 0, 3472, '', 1510907111, 0, '0'),
(3473, 0, '3473_topaero-4.jpg', 'shop', 'cat', 38, '', '', 0, 0, 3473, '', 1510907111, 0, '0'),
(3474, 0, '3474_topaero-6.jpg', 'shop', 'cat', 39, '', '', 0, 0, 3474, '', 1510907111, 0, '0'),
(3475, 0, '3475_topaero-7.jpg', 'shop', 'cat', 40, '', '', 0, 0, 3475, '', 1510907111, 0, '0'),
(3476, 0, '3476_topaero-9.jpg', 'shop', 'cat', 41, '', '', 0, 0, 3476, '', 1510907111, 0, '0'),
(3477, 0, '3477_topaero-12.jpg', 'shop', 'cat', 42, '', '', 0, 0, 3477, '', 1510907112, 0, '0'),
(3478, 0, '3478_topaero-16.jpg', 'shop', 'cat', 43, '', '', 0, 0, 3478, '', 1510907112, 0, '0'),
(3479, 0, '3479_topaero-24.jpg', 'shop', 'cat', 44, '', '', 0, 0, 3479, '', 1510907112, 0, '0'),
(3480, 0, '3480_topaero-32.jpg', 'shop', 'cat', 45, '', '', 0, 0, 3480, '', 1510907112, 0, '0'),
(3481, 0, '3481_topbio.jpg', 'shop', 'cat', 46, '', '', 0, 0, 3481, '', 1510907112, 0, '0'),
(3482, 0, '3482_evrolos-udacha.jpg', 'shop', 'cat', 12, '', '', 0, 0, 3482, '', 1510907112, 0, '0'),
(3483, 0, '3483_evrolos-eko.jpg', 'shop', 'cat', 250, '', '', 0, 0, 3483, '', 1510907112, 0, '0'),
(3484, 0, '3484_evrolos-eko-06.jpg', 'shop', 'cat', 251, '', '', 0, 0, 3484, '', 1510907112, 0, '0'),
(3485, 0, '3485_evrolos-eko-08.jpg', 'shop', 'cat', 252, '', '', 0, 0, 3485, '', 1510907113, 0, '0'),
(3486, 0, '3486_evrolos-eko-1.jpg', 'shop', 'cat', 253, '', '', 0, 0, 3486, '', 1510907113, 0, '0'),
(3487, 0, '3487_evrolos-eko-15.jpg', 'shop', 'cat', 254, '', '', 0, 0, 3487, '', 1510907113, 0, '0'),
(3488, 0, '3488_evrolos-eko-24.jpg', 'shop', 'cat', 255, '', '', 0, 0, 3488, '', 1510907113, 0, '0'),
(3489, 0, '3489_evrolos-eko-3.jpg', 'shop', 'cat', 256, '', '', 0, 0, 3489, '', 1510907113, 0, '0'),
(3490, 0, '3490_evrolos-eko-4.jpg', 'shop', 'cat', 257, '', '', 0, 0, 3490, '', 1510907113, 0, '0'),
(3491, 0, '3491_evrolos-bio-3.jpg', 'shop', 'cat', 258, '', '', 0, 0, 3491, '', 1510907113, 0, '0'),
(3492, 0, '3492_evrolos-bio-4.jpg', 'shop', 'cat', 259, '', '', 0, 0, 3492, '', 1510907113, 0, '0'),
(3493, 0, '3493_evrolos-bio-5.jpg', 'shop', 'cat', 260, '', '', 0, 0, 3493, '', 1510907113, 0, '0'),
(3494, 0, '3494_evrolos-bio-6.jpg', 'shop', 'cat', 261, '', '', 0, 0, 3494, '', 1510907113, 0, '0'),
(3495, 0, '3495_evrolos-bio-8.jpg', 'shop', 'cat', 262, '', '', 0, 0, 3495, '', 1510907113, 0, '0'),
(3496, 0, '3496_evrolos-bio-10.jpg', 'shop', 'cat', 263, '', '', 0, 0, 3496, '', 1510907113, 0, '0'),
(3497, 0, '3497_evrolos-bio-12.jpg', 'shop', 'cat', 264, '', '', 0, 0, 3497, '', 1510907113, 0, '0'),
(3498, 0, '3498_evrolos-bio-15.jpg', 'shop', 'cat', 265, '', '', 0, 0, 3498, '', 1510907113, 0, '0'),
(3499, 0, '3499_evrolos-bio-20.jpg', 'shop', 'cat', 266, '', '', 0, 0, 3499, '', 1510907113, 0, '0'),
(3500, 0, '3500_evrolos-pro-3.jpg', 'shop', 'cat', 267, '', '', 0, 0, 3500, '', 1510907114, 0, '0'),
(3501, 0, '3501_evrolos-pro-4.jpg', 'shop', 'cat', 268, '', '', 0, 0, 3501, '', 1510907114, 0, '0'),
(3502, 0, '3502_evrolos-pro-5.jpg', 'shop', 'cat', 269, '', '', 0, 0, 3502, '', 1510907114, 0, '0'),
(3503, 0, '3503_evrolos-pro-6.jpg', 'shop', 'cat', 270, '', '', 0, 0, 3503, '', 1510907114, 0, '0'),
(3504, 0, '3504_evrolos-pro-8.jpg', 'shop', 'cat', 271, '', '', 0, 0, 3504, '', 1510907114, 0, '0'),
(3505, 0, '3505_evrolos-pro-10.jpg', 'shop', 'cat', 272, '', '', 0, 0, 3505, '', 1510907114, 0, '0'),
(3506, 0, '3506_evrolos-pro-12.jpg', 'shop', 'cat', 273, '', '', 0, 0, 3506, '', 1510907114, 0, '0'),
(3507, 0, '3507_evrolos-pro-15.jpg', 'shop', 'cat', 274, '', '', 0, 0, 3507, '', 1510907114, 0, '0'),
(3508, 0, '3508_evrolos-pro-20.jpg', 'shop', 'cat', 275, '', '', 0, 0, 3508, '', 1510907114, 0, '0'),
(3509, 0, '3509_evrolos-pro-25.jpg', 'shop', 'cat', 276, '', '', 0, 0, 3509, '', 1510907114, 0, '0'),
(3510, 0, '3510_evrolos-pro-30.jpg', 'shop', 'cat', 277, '', '', 0, 0, 3510, '', 1510907114, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_images_editor_folders`
--

CREATE TABLE IF NOT EXISTS `diafan_images_editor_folders` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор папки-родителя из таблицы `diafan_images_editor_folders`',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Папки изображений в плагине для визуального редактора';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_images_variations`
--

CREATE TABLE IF NOT EXISTS `diafan_images_variations` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `folder` varchar(20) NOT NULL DEFAULT '' COMMENT 'название папки',
  `quality` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'качество для изображений в формет JPEG',
  `param` text COMMENT 'информация о применяемых действиях',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Варианты загрузки изображений';

--
-- Dumping data for table `diafan_images_variations`
--

INSERT INTO `diafan_images_variations` (`id`, `name`, `folder`, `quality`, `param`, `trash`) VALUES
(1, 'Маленькое изображение (превью)', 'small', 90, 'a:1:{i:0;a:4:{s:4:"name";s:6:"resize";s:5:"width";s:3:"194";s:6:"height";s:3:"194";s:3:"max";i:1;}}', '0'),
(2, 'Среднее изображение', 'medium', 90, 'a:1:{i:0;a:4:{s:4:"name";s:6:"resize";s:5:"width";i:300;s:6:"height";i:300;s:3:"max";i:0;}}', '0'),
(3, 'Большое изображение (полная версия)', 'large', 90, 'a:1:{i:0;a:4:{s:4:"name";s:6:"resize";s:5:"width";i:1200;s:6:"height";i:1200;s:3:"max";i:0;}}', '0'),
(4, 'Превью товара', 'preview', 90, 'a:1:{i:0;a:4:{s:4:"name";s:6:"resize";s:5:"width";s:3:"113";s:6:"height";s:3:"113";s:3:"max";i:0;}}', '0'),
(5, 'Аватар для отзывов', 'avatar', 90, 'a:2:{i:0;a:4:{s:4:"name";s:6:"resize";s:5:"width";s:2:"50";s:6:"height";s:2:"50";s:3:"max";i:1;}i:1;a:7:{s:4:"name";s:4:"crop";s:5:"width";s:2:"50";s:6:"height";s:2:"50";s:8:"vertical";s:3:"top";s:11:"vertical_px";s:0:"";s:10:"horizontal";s:4:"left";s:13:"horizontal_px";s:0:"";}}', '0'),
(6, 'Изображение подкатегории', 'categories', 80, 'a:1:{i:0;a:4:{s:4:"name";s:6:"resize";s:5:"width";s:3:"112";s:6:"height";s:3:"165";s:3:"max";i:0;}}', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_keywords`
--

CREATE TABLE IF NOT EXISTS `diafan_keywords` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `text` text COMMENT 'ключевое слово',
  `link` text COMMENT 'ссылка',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ключевые слова для перелинковки';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_languages`
--

CREATE TABLE IF NOT EXISTS `diafan_languages` (
  `id` tinyint(2) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `shortname` varchar(10) NOT NULL DEFAULT '' COMMENT 'скоращенное название',
  `base_admin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'язык является основным для административной части: 0 - нет, 1 - да',
  `base_site` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'язык является основным для пользовательской части: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Языки сайта';

--
-- Dumping data for table `diafan_languages`
--

INSERT INTO `diafan_languages` (`id`, `name`, `shortname`, `base_admin`, `base_site`) VALUES
(1, 'ru', 'ru', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_languages_translate`
--

CREATE TABLE IF NOT EXISTS `diafan_languages_translate` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `text` text COMMENT 'описание',
  `text_translate` text COMMENT 'перевод',
  `lang_id` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор языка из таблицы `diafan_languages`',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля, для которого применим перевод',
  `type` enum('admin','site') NOT NULL DEFAULT 'admin' COMMENT 'часть сайта: admin - административная, site - пользовательская'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Перевод интерфейса';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_log`
--

CREATE TABLE IF NOT EXISTS `diafan_log` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'IP-адрес пользователя',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата в формате UNIXTIME',
  `count` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'количество неудачных попыток',
  `info` text COMMENT 'дополнительная информация'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лог неудачных попыток авторизации';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_log_note`
--

CREATE TABLE IF NOT EXISTS `diafan_log_note` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `note` int(7) unsigned NOT NULL DEFAULT '0' COMMENT 'оценка',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `ip` varchar(62) NOT NULL DEFAULT '' COMMENT 'IP-адрес пользователя',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'идентификатор сессии из таблицы `diafan_sessions`',
  `include_name` varchar(10) NOT NULL DEFAULT '' COMMENT 'подключенный модуль'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лог голосований и оценок';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_map_index`
--

CREATE TABLE IF NOT EXISTS `diafan_map_index` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `url` text COMMENT 'ссылка',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat','param','brand') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего редактирования',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=3936 DEFAULT CHARSET=utf8 COMMENT='Индекс для файла sitemap.xml';

--
-- Dumping data for table `diafan_map_index`
--

INSERT INTO `diafan_map_index` (`id`, `url`, `module_name`, `element_id`, `element_type`, `timeedit`, `changefreq`, `priority`, `date_start`, `date_finish`, `trash`) VALUES
(1, 'shop/test-topas-sROUTE_END', 'shop', 2, 'cat', 1500881537, 'monthly', '', 0, 0, '0'),
(6, 'shop/topas2ROUTE_END', 'shop', 2, 'brand', 1500904666, 'monthly', '', 0, 0, '0'),
(7, 'shop/evrolosROUTE_END', 'shop', 3, 'brand', 1500904673, 'monthly', '', 0, 0, '0'),
(14, 'tags/topas-sROUTE_END', 'tags', 1, 'element', 1500906043, 'always', '', 0, 0, '0'),
(19, 'shop/topasROUTE_END', 'shop', 3, 'cat', 1500966017, 'monthly', '', 0, 0, '0'),
(20, 'shop/evrolos-1-stranitsaROUTE_END', 'shop', 4, 'cat', 1500966058, 'monthly', '', 0, 0, '0'),
(21, 'shop/topas-s-2-stranitsaROUTE_END', 'shop', 5, 'cat', 1500966076, 'monthly', '', 0, 0, '0'),
(100, 'shop/topas-s/tapos-s-4/topas-s-4ROUTE_END', 'shop', 4, 'element', 1501076107, 'monthly', '', 0, 0, '0'),
(101, 'shop/topas-s/tapos-s-4/topas-s-4-prROUTE_END', 'shop', 5, 'element', 1501076107, 'monthly', '', 0, 0, '0'),
(102, 'shop/evrolos8/evrolos-1/evrolos-1-tovarROUTE_END', 'shop', 6, 'element', 1501076107, 'monthly', '', 0, 0, '0'),
(103, 'shop/topas-s/topas-s-5/topas-s-5ROUTE_END', 'shop', 7, 'element', 1501076107, 'monthly', '', 0, 0, '0'),
(104, 'shop/topas/topas-4ROUTE_END', 'shop', 8, 'element', 1501076107, 'monthly', '', 0, 0, '0'),
(105, 'shop/topas-s/topas-s-5/topas-s-5-longROUTE_END', 'shop', 9, 'element', 1501076108, 'monthly', '', 0, 0, '0'),
(106, 'shop/topas-s/topas-s-5/topas-s-5-prROUTE_END', 'shop', 10, 'element', 1501076108, 'monthly', '', 0, 0, '0'),
(2402, 'shop/evrolos-eko/evrolos-ekoROUTE_END', 'shop', 47, 'cat', 1504863964, 'always', '', 0, 0, '0'),
(2403, 'shop/evrolos-bio/evrolos-bioROUTE_END', 'shop', 48, 'cat', 1504863964, 'always', '', 0, 0, '0'),
(2404, 'shop/evrolos-pro/evrolos-proROUTE_END', 'shop', 49, 'cat', 1504863964, 'always', '', 0, 0, '0'),
(2406, 'shop/evrolos-pro/evrolos-pro-prROUTE_END', 'shop', 51, 'cat', 1504863964, 'always', '', 0, 0, '0'),
(2435, 'shop/topas-sROUTE_END', 'shop', 278, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2436, 'shop/topasROUTE_END', 'shop', 279, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2437, 'shop/topaeroROUTE_END', 'shop', 280, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2438, 'shop/topbioROUTE_END', 'shop', 281, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2439, 'shop/evrolos-udachaROUTE_END', 'shop', 282, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2440, 'shop/evrolos-ekoROUTE_END', 'shop', 283, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2441, 'shop/evrolos-bioROUTE_END', 'shop', 284, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2442, 'shop/evrolos-proROUTE_END', 'shop', 285, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2443, 'shop/topas-s/topas-s-4ROUTE_END', 'shop', 286, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2444, 'shop/topas-s/topas-s-5ROUTE_END', 'shop', 287, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2445, 'shop/topas-s/topas-s-6ROUTE_END', 'shop', 288, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2446, 'shop/topas-s/topas-s-8ROUTE_END', 'shop', 289, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2447, 'shop/topas-s/topas-s-9ROUTE_END', 'shop', 290, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2448, 'shop/topas-s/topas-s-10ROUTE_END', 'shop', 291, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2449, 'shop/topas-s/topas-s-12ROUTE_END', 'shop', 292, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2450, 'shop/topas/topas-4ROUTE_END', 'shop', 293, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2451, 'shop/topas/topas-5ROUTE_END', 'shop', 294, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2452, 'shop/topas/topas-6ROUTE_END', 'shop', 295, 'cat', 1504863985, 'always', '', 0, 0, '0'),
(2453, 'shop/topas/topas-8ROUTE_END', 'shop', 296, 'cat', 1504863986, 'always', '', 0, 0, '0'),
(2454, 'shop/topas/topas-9ROUTE_END', 'shop', 297, 'cat', 1504863986, 'always', '', 0, 0, '0'),
(3674, 'shop/topas-s/topas-s-49/topas-s-4-prROUTE_END', 'shop', 51, 'element', 1510841448, 'always', '', 0, 0, '0'),
(3675, 'shop/topas-s/topas-s-510/topas-s-5ROUTE_END', 'shop', 52, 'element', 1510841449, 'always', '', 0, 0, '0'),
(3676, 'shop/topas-s/topas-s-510/topas-s-5-longROUTE_END', 'shop', 53, 'element', 1510841449, 'always', '', 0, 0, '0'),
(3677, 'shop/topas-s/topas-s-510/topas-s-5-prROUTE_END', 'shop', 54, 'element', 1510841450, 'always', '', 0, 0, '0'),
(3678, 'shop/topas-s/topas-s-510/topas-s-5-long-prROUTE_END', 'shop', 55, 'element', 1510841451, 'always', '', 0, 0, '0'),
(3679, 'shop/topas-s/topas-s-611/topas-s-6ROUTE_END', 'shop', 56, 'element', 1510841452, 'always', '', 0, 0, '0'),
(3680, 'shop/topas-s/topas-s-611/topas-s-6-longROUTE_END', 'shop', 57, 'element', 1510841452, 'always', '', 0, 0, '0'),
(3681, 'shop/topas-s/topas-s-611/topas-s-6-prROUTE_END', 'shop', 58, 'element', 1510841453, 'always', '', 0, 0, '0'),
(3682, 'shop/topas-s/topas-s-611/topas-s-6-long-prROUTE_END', 'shop', 59, 'element', 1510841454, 'always', '', 0, 0, '0'),
(3683, 'shop/topas-s/topas-s-833/topas-s-8ROUTE_END', 'shop', 60, 'element', 1510841454, 'always', '', 0, 0, '0'),
(3684, 'shop/topas-s/topas-s-833/topas-s-8-longROUTE_END', 'shop', 61, 'element', 1510841455, 'always', '', 0, 0, '0'),
(3685, 'shop/topas-s/topas-s-833/topas-s-8-prROUTE_END', 'shop', 62, 'element', 1510841456, 'always', '', 0, 0, '0'),
(3686, 'shop/topas-s/topas-s-833/topas-s-8-long-prROUTE_END', 'shop', 63, 'element', 1510841457, 'always', '', 0, 0, '0'),
(3687, 'shop/topas-s/topas-s-833/topas-s-8-long-usROUTE_END', 'shop', 64, 'element', 1510841458, 'always', '', 0, 0, '0'),
(3688, 'shop/topas-s/topas-s-833/topas-s-8-long-us-prROUTE_END', 'shop', 65, 'element', 1510841459, 'always', '', 0, 0, '0'),
(3689, 'shop/topas-s/topas-s-934/topas-s-9ROUTE_END', 'shop', 66, 'element', 1510841460, 'always', '', 0, 0, '0'),
(3690, 'shop/topas-s/topas-s-934/topas-s-9-longROUTE_END', 'shop', 67, 'element', 1510841460, 'always', '', 0, 0, '0'),
(3691, 'shop/topas-s/topas-s-934/topas-s-9-long-usROUTE_END', 'shop', 68, 'element', 1510841461, 'always', '', 0, 0, '0'),
(3692, 'shop/topas-s/topas-s-934/topas-s-9-prROUTE_END', 'shop', 69, 'element', 1510841462, 'always', '', 0, 0, '0'),
(3693, 'shop/topas-s/topas-s-934/topas-s-9-long-prROUTE_END', 'shop', 70, 'element', 1510841463, 'always', '', 0, 0, '0'),
(3694, 'shop/topas-s/topas-s-934/topas-s-9-long-us-prROUTE_END', 'shop', 71, 'element', 1510841463, 'always', '', 0, 0, '0'),
(3695, 'shop/topas-s/topas-s-1035/topas-s-10ROUTE_END', 'shop', 72, 'element', 1510841464, 'always', '', 0, 0, '0'),
(3696, 'shop/topas-s/topas-s-1035/topas-s-10-longROUTE_END', 'shop', 73, 'element', 1510841465, 'always', '', 0, 0, '0'),
(3697, 'shop/topas-s/topas-s-1035/topas-s-10-long-usROUTE_END', 'shop', 74, 'element', 1510841465, 'always', '', 0, 0, '0'),
(3698, 'shop/topas-s/topas-s-1035/topas-s-10-prROUTE_END', 'shop', 75, 'element', 1510841466, 'always', '', 0, 0, '0'),
(3699, 'shop/topas-s/topas-s-1035/topas-s-10-long-prROUTE_END', 'shop', 76, 'element', 1510841467, 'always', '', 0, 0, '0'),
(3700, 'shop/topas-s/topas-s-1035/topas-s-10-long-us-prROUTE_END', 'shop', 77, 'element', 1510841467, 'always', '', 0, 0, '0'),
(3701, 'shop/topas-s/topas-s-1236/topas-s-12ROUTE_END', 'shop', 78, 'element', 1510841468, 'always', '', 0, 0, '0'),
(3702, 'shop/topas-s/topas-s-1236/topas-s-12-prROUTE_END', 'shop', 79, 'element', 1510841469, 'always', '', 0, 0, '0'),
(3703, 'shop/topas-s/topas-s-1236/topas-s-12-long-usROUTE_END', 'shop', 80, 'element', 1510841469, 'always', '', 0, 0, '0'),
(3704, 'shop/topas-s/topas-s-1236/topas-s-12-longROUTE_END', 'shop', 81, 'element', 1510841470, 'always', '', 0, 0, '0'),
(3705, 'shop/topas-s/topas-s-1236/topas-s-12-long-prROUTE_END', 'shop', 82, 'element', 1510841471, 'always', '', 0, 0, '0'),
(3706, 'shop/topas-s/topas-s-1236/topas-s-12-long-pr-usROUTE_END', 'shop', 83, 'element', 1510841471, 'always', '', 0, 0, '0'),
(3707, 'shop/topas/topas-413/topas-4ROUTE_END', 'shop', 84, 'element', 1510841471, 'always', '', 0, 0, '0'),
(3708, 'shop/topas/topas-413/topas-4-prROUTE_END', 'shop', 85, 'element', 1510841472, 'always', '', 0, 0, '0'),
(3709, 'shop/topas/topas-514/topas-5ROUTE_END', 'shop', 86, 'element', 1510841473, 'always', '', 0, 0, '0'),
(3710, 'shop/topas/topas-514/topas-5-longROUTE_END', 'shop', 87, 'element', 1510841473, 'always', '', 0, 0, '0'),
(3711, 'shop/topas/topas-514/topas-5-prROUTE_END', 'shop', 88, 'element', 1510841474, 'always', '', 0, 0, '0'),
(3712, 'shop/topas/topas-514/topas-5-long-prROUTE_END', 'shop', 89, 'element', 1510841475, 'always', '', 0, 0, '0'),
(3713, 'shop/topas/topas-621/topas-6ROUTE_END', 'shop', 90, 'element', 1510841476, 'always', '', 0, 0, '0'),
(3714, 'shop/topas/topas-621/topas-6-prROUTE_END', 'shop', 91, 'element', 1510841476, 'always', '', 0, 0, '0'),
(3715, 'shop/topas/topas-621/topas-6-longROUTE_END', 'shop', 92, 'element', 1510841477, 'always', '', 0, 0, '0'),
(3716, 'shop/topas/topas-621/topas-6-long-prROUTE_END', 'shop', 93, 'element', 1510841478, 'always', '', 0, 0, '0'),
(3717, 'shop/topas/topas-822/topas-8ROUTE_END', 'shop', 94, 'element', 1510841479, 'always', '', 0, 0, '0'),
(3718, 'shop/topas/topas-822/topas-8-longROUTE_END', 'shop', 95, 'element', 1510841479, 'always', '', 0, 0, '0'),
(3719, 'shop/topas/topas-822/topas-8-prROUTE_END', 'shop', 96, 'element', 1510841480, 'always', '', 0, 0, '0'),
(3720, 'shop/topas/topas-822/topas-8-long-usROUTE_END', 'shop', 97, 'element', 1510841481, 'always', '', 0, 0, '0'),
(3721, 'shop/topas/topas-822/topas-8-long-prROUTE_END', 'shop', 98, 'element', 1510841481, 'always', '', 0, 0, '0'),
(3722, 'shop/topas/topas-822/topas-8-long-us-prROUTE_END', 'shop', 99, 'element', 1510841482, 'always', '', 0, 0, '0'),
(3723, 'shop/topas/topas-950/topas-9ROUTE_END', 'shop', 100, 'element', 1510841483, 'always', '', 0, 0, '0'),
(3724, 'shop/topas/topas-950/topas-9-longROUTE_END', 'shop', 101, 'element', 1510841483, 'always', '', 0, 0, '0'),
(3725, 'shop/topas/topas-950/topas-9-prROUTE_END', 'shop', 102, 'element', 1510841484, 'always', '', 0, 0, '0'),
(3726, 'shop/topas/topas-950/topas-9-long-usROUTE_END', 'shop', 103, 'element', 1510841485, 'always', '', 0, 0, '0'),
(3727, 'shop/topas/topas-950/topas-9-long-prROUTE_END', 'shop', 104, 'element', 1510841485, 'always', '', 0, 0, '0'),
(3728, 'shop/topas/topas-950/topas-9-long-pr-usROUTE_END', 'shop', 105, 'element', 1510841486, 'always', '', 0, 0, '0'),
(3729, 'shop/topas/topas-10/topas-10ROUTE_END', 'shop', 106, 'element', 1510841487, 'always', '', 0, 0, '0'),
(3730, 'shop/topas/topas-10/topas-10-prROUTE_END', 'shop', 107, 'element', 1510841487, 'always', '', 0, 0, '0'),
(3731, 'shop/topas/topas-10/topas-10-longROUTE_END', 'shop', 108, 'element', 1510841488, 'always', '', 0, 0, '0'),
(3732, 'shop/topas/topas-10/topas-10-long-usROUTE_END', 'shop', 109, 'element', 1510841489, 'always', '', 0, 0, '0'),
(3733, 'shop/topas/topas-10/topas-10-long-prROUTE_END', 'shop', 110, 'element', 1510841489, 'always', '', 0, 0, '0'),
(3734, 'shop/topas/topas-10/topas-10-long-pr-usROUTE_END', 'shop', 111, 'element', 1510841490, 'always', '', 0, 0, '0'),
(3735, 'shop/topas/topas-12/topas-12ROUTE_END', 'shop', 112, 'element', 1510841491, 'always', '', 0, 0, '0'),
(3736, 'shop/topas/topas-12/topas-12-longROUTE_END', 'shop', 113, 'element', 1510841492, 'always', '', 0, 0, '0'),
(3737, 'shop/topas/topas-12/topas-12-prROUTE_END', 'shop', 114, 'element', 1510841493, 'always', '', 0, 0, '0'),
(3738, 'shop/topas/topas-12/topas-12-long-usROUTE_END', 'shop', 115, 'element', 1510841493, 'always', '', 0, 0, '0'),
(3739, 'shop/topas/topas-12/topas-12-long-prROUTE_END', 'shop', 116, 'element', 1510841494, 'always', '', 0, 0, '0'),
(3740, 'shop/topas/topas-12/topas-12-long-pr-usROUTE_END', 'shop', 117, 'element', 1510841495, 'always', '', 0, 0, '0'),
(3741, 'shop/topas/topas-15/topas-15-long-pr-usROUTE_END', 'shop', 118, 'element', 1510841496, 'always', '', 0, 0, '0'),
(3742, 'shop/topas/topas-15/topas-15-prROUTE_END', 'shop', 119, 'element', 1510841498, 'always', '', 0, 0, '0'),
(3743, 'shop/topas/topas-15/topas-15-longROUTE_END', 'shop', 120, 'element', 1510841499, 'always', '', 0, 0, '0'),
(3744, 'shop/topas/topas-15/topas-15ROUTE_END', 'shop', 121, 'element', 1510841500, 'always', '', 0, 0, '0'),
(3745, 'shop/topas/topas-15/topas-15-long-usROUTE_END', 'shop', 122, 'element', 1510841501, 'always', '', 0, 0, '0'),
(3746, 'shop/topas/topas-15/topas-15-long-prROUTE_END', 'shop', 123, 'element', 1510841503, 'always', '', 0, 0, '0'),
(3747, 'shop/topas/topas-20/topas-20ROUTE_END', 'shop', 124, 'element', 1510841504, 'always', '', 0, 0, '0'),
(3748, 'shop/topas/topas-20/topas-20-long-prROUTE_END', 'shop', 125, 'element', 1510841505, 'always', '', 0, 0, '0'),
(3749, 'shop/topas/topas-20/topas-20-prROUTE_END', 'shop', 126, 'element', 1510841506, 'always', '', 0, 0, '0'),
(3750, 'shop/topas/topas-20/topas-20-longROUTE_END', 'shop', 127, 'element', 1510841507, 'always', '', 0, 0, '0'),
(3751, 'shop/topas/topas-30/topas-30ROUTE_END', 'shop', 128, 'element', 1510841508, 'always', '', 0, 0, '0'),
(3752, 'shop/topas/topas-30/topas-30-long-prROUTE_END', 'shop', 129, 'element', 1510841509, 'always', '', 0, 0, '0'),
(3753, 'shop/topas/topas-30/topas-30-longROUTE_END', 'shop', 130, 'element', 1510841510, 'always', '', 0, 0, '0'),
(3754, 'shop/topas/topas-30/topas-30-prROUTE_END', 'shop', 131, 'element', 1510841511, 'always', '', 0, 0, '0'),
(3755, 'shop/topas/topas-40/topas-40-prROUTE_END', 'shop', 132, 'element', 1510841511, 'always', '', 0, 0, '0'),
(3756, 'shop/topas/topas-40/topas-40ROUTE_END', 'shop', 133, 'element', 1510841512, 'always', '', 0, 0, '0'),
(3757, 'shop/topas/topas-50/topas-50-prROUTE_END', 'shop', 134, 'element', 1510841513, 'always', '', 0, 0, '0'),
(3758, 'shop/topas/topas-50/topas-50ROUTE_END', 'shop', 135, 'element', 1510841514, 'always', '', 0, 0, '0'),
(3759, 'shop/topas/topas-75/topas-75-prROUTE_END', 'shop', 136, 'element', 1510841515, 'always', '', 0, 0, '0'),
(3760, 'shop/topas/topas-75/topas-75ROUTE_END', 'shop', 137, 'element', 1510841516, 'always', '', 0, 0, '0'),
(3761, 'shop/topas/topas-100/topas-100ROUTE_END', 'shop', 138, 'element', 1510841517, 'always', '', 0, 0, '0'),
(3762, 'shop/topas/topas-100/topas-100-prROUTE_END', 'shop', 139, 'element', 1510841518, 'always', '', 0, 0, '0'),
(3763, 'shop/topas/topas-150/topas-150-prROUTE_END', 'shop', 140, 'element', 1510841519, 'always', '', 0, 0, '0'),
(3764, 'shop/topas/topas-150/topas-150ROUTE_END', 'shop', 141, 'element', 1510841520, 'always', '', 0, 0, '0'),
(3765, 'shop/topaero/topaero-3/topaero-3ROUTE_END', 'shop', 142, 'element', 1510841522, 'always', '', 0, 0, '0'),
(3766, 'shop/topaero/topaero-3/topaero-3-longROUTE_END', 'shop', 143, 'element', 1510841524, 'always', '', 0, 0, '0'),
(3767, 'shop/topaero/topaero-3/topaero-3-prROUTE_END', 'shop', 144, 'element', 1510841525, 'always', '', 0, 0, '0'),
(3768, 'shop/topaero/topaero-3/topaero-3-long-prROUTE_END', 'shop', 145, 'element', 1510841526, 'always', '', 0, 0, '0'),
(3769, 'shop/topaero/topaero-3/topaero-3-long-usROUTE_END', 'shop', 146, 'element', 1510841528, 'always', '', 0, 0, '0'),
(3770, 'shop/topaero/topaero-3/topaero-3-long-pr-usROUTE_END', 'shop', 147, 'element', 1510841529, 'always', '', 0, 0, '0'),
(3771, 'shop/topaero/topaero-4/topaero-4ROUTE_END', 'shop', 148, 'element', 1510841530, 'always', '', 0, 0, '0'),
(3772, 'shop/topaero/topaero-4/topaero-4-longROUTE_END', 'shop', 149, 'element', 1510841530, 'always', '', 0, 0, '0'),
(3773, 'shop/topaero/topaero-4/topaero-4-prROUTE_END', 'shop', 150, 'element', 1510841531, 'always', '', 0, 0, '0'),
(3774, 'shop/topaero/topaero-4/topaero-4-long-usROUTE_END', 'shop', 151, 'element', 1510841532, 'always', '', 0, 0, '0'),
(3775, 'shop/topaero/topaero-4/topaero-4-long-prROUTE_END', 'shop', 152, 'element', 1510841533, 'always', '', 0, 0, '0'),
(3776, 'shop/topaero/topaero-4/topaero-4-long-pr-usROUTE_END', 'shop', 153, 'element', 1510841534, 'always', '', 0, 0, '0'),
(3777, 'shop/topaero/topaero-6/topaero-6ROUTE_END', 'shop', 154, 'element', 1510841535, 'always', '', 0, 0, '0'),
(3778, 'shop/topaero/topaero-6/topaero-6-longROUTE_END', 'shop', 155, 'element', 1510841536, 'always', '', 0, 0, '0'),
(3779, 'shop/topaero/topaero-6/topaero-6-long-usROUTE_END', 'shop', 156, 'element', 1510841536, 'always', '', 0, 0, '0'),
(3780, 'shop/topaero/topaero-6/topaero-6-prROUTE_END', 'shop', 157, 'element', 1510841537, 'always', '', 0, 0, '0'),
(3781, 'shop/topaero/topaero-6/topaero-6-long-prROUTE_END', 'shop', 158, 'element', 1510841538, 'always', '', 0, 0, '0'),
(3782, 'shop/topaero/topaero-6/topaero-6-long-pr-usROUTE_END', 'shop', 159, 'element', 1510841539, 'always', '', 0, 0, '0'),
(3783, 'shop/topaero/topaero-7/topaero-7ROUTE_END', 'shop', 160, 'element', 1510841540, 'always', '', 0, 0, '0'),
(3784, 'shop/topaero/topaero-7/topaero-7-prROUTE_END', 'shop', 161, 'element', 1510841541, 'always', '', 0, 0, '0'),
(3785, 'shop/topaero/topaero-9/topaero-9ROUTE_END', 'shop', 162, 'element', 1510841542, 'always', '', 0, 0, '0'),
(3786, 'shop/topaero/topaero-9/topaero-9-prROUTE_END', 'shop', 163, 'element', 1510841543, 'always', '', 0, 0, '0'),
(3787, 'shop/topaero/topaero-12/topaero-12ROUTE_END', 'shop', 164, 'element', 1510841544, 'always', '', 0, 0, '0'),
(3788, 'shop/topaero/topaero-12/topaero-12-prROUTE_END', 'shop', 165, 'element', 1510841544, 'always', '', 0, 0, '0'),
(3789, 'shop/topaero/topaero-16/topaero-16ROUTE_END', 'shop', 166, 'element', 1510841545, 'always', '', 0, 0, '0'),
(3790, 'shop/topaero/topaero-16/topaero-16-prROUTE_END', 'shop', 167, 'element', 1510841546, 'always', '', 0, 0, '0'),
(3791, 'shop/topaero/topaero-24/topaero-24ROUTE_END', 'shop', 168, 'element', 1510841547, 'always', '', 0, 0, '0'),
(3792, 'shop/topaero/topaero-24/topaero-24-prROUTE_END', 'shop', 169, 'element', 1510841548, 'always', '', 0, 0, '0'),
(3793, 'shop/topaero/topaero-32/topaero-32ROUTE_END', 'shop', 170, 'element', 1510841549, 'always', '', 0, 0, '0'),
(3794, 'shop/topaero/topaero-32/topaero-32-prROUTE_END', 'shop', 171, 'element', 1510841550, 'always', '', 0, 0, '0'),
(3795, 'shop/topbio/topbio/topbioROUTE_END', 'shop', 172, 'element', 1510841550, 'always', '', 0, 0, '0'),
(3796, 'shop/evrolos-udacha/evrolos-udacha/evrolos-udachaROUTE_END', 'shop', 173, 'element', 1510841550, 'always', '', 0, 0, '0'),
(3797, 'shop/evrolos-eko/evrolos-eko/evrolos-ekoROUTE_END', 'shop', 174, 'element', 1510841551, 'always', '', 0, 0, '0'),
(3798, 'shop/evrolos-eko/evrolos-eko-06/evrolos-eko-06ROUTE_END', 'shop', 175, 'element', 1510841551, 'always', '', 0, 0, '0'),
(3799, 'shop/evrolos-eko/evrolos-eko-08/evrolos-eko-08ROUTE_END', 'shop', 176, 'element', 1510841551, 'always', '', 0, 0, '0'),
(3800, 'shop/evrolos-eko/evrolos-eko-1/evrolos-eko-1ROUTE_END', 'shop', 177, 'element', 1510841552, 'always', '', 0, 0, '0'),
(3801, 'shop/evrolos-eko/evrolos-eko-15/evrolos-eko-15ROUTE_END', 'shop', 178, 'element', 1510841552, 'always', '', 0, 0, '0'),
(3802, 'shop/evrolos-eko/evrolos-eko-24/evrolos-eko-24ROUTE_END', 'shop', 179, 'element', 1510841552, 'always', '', 0, 0, '0'),
(3803, 'shop/evrolos-eko/evrolos-eko-3/evrolos-eko-3ROUTE_END', 'shop', 180, 'element', 1510841552, 'always', '', 0, 0, '0'),
(3804, 'shop/evrolos-eko/evrolos-eko-4/evrolos-eko-4ROUTE_END', 'shop', 181, 'element', 1510841553, 'always', '', 0, 0, '0'),
(3805, 'shop/evrolos-bio/evrolos-bio-3/evrolos-bio-3ROUTE_END', 'shop', 182, 'element', 1510841553, 'always', '', 0, 0, '0'),
(3806, 'shop/evrolos-bio/evrolos-bio-4/evrolos-bio-4ROUTE_END', 'shop', 183, 'element', 1510841553, 'always', '', 0, 0, '0'),
(3807, 'shop/evrolos-bio/evrolos-bio-5/evrolos-bio-5ROUTE_END', 'shop', 184, 'element', 1510841553, 'always', '', 0, 0, '0'),
(3808, 'shop/evrolos-bio/evrolos-bio-6/evrolos-bio-6ROUTE_END', 'shop', 185, 'element', 1510841553, 'always', '', 0, 0, '0'),
(3809, 'shop/evrolos-bio/evrolos-bio-8/evrolos-bio-8ROUTE_END', 'shop', 186, 'element', 1510841554, 'always', '', 0, 0, '0'),
(3810, 'shop/evrolos-bio/evrolos-bio-10/evrolos-bio-10ROUTE_END', 'shop', 187, 'element', 1510841554, 'always', '', 0, 0, '0'),
(3811, 'shop/evrolos-bio/evrolos-bio-12/evrolos-bio-12ROUTE_END', 'shop', 188, 'element', 1510841554, 'always', '', 0, 0, '0'),
(3812, 'shop/evrolos-bio/evrolos-bio-15/evrolos-bio-15ROUTE_END', 'shop', 189, 'element', 1510841554, 'always', '', 0, 0, '0'),
(3813, 'shop/evrolos-bio/evrolos-bio-20/evrolos-bio-20ROUTE_END', 'shop', 190, 'element', 1510841555, 'always', '', 0, 0, '0'),
(3814, 'shop/evrolos-bio/evrolos-bio-3/evrolos-bio-3-prROUTE_END', 'shop', 202, 'element', 1510841555, 'always', '', 0, 0, '0'),
(3815, 'shop/evrolos-bio/evrolos-bio-4/evrolos-bio-4-prROUTE_END', 'shop', 203, 'element', 1510841555, 'always', '', 0, 0, '0'),
(3816, 'shop/evrolos-bio/evrolos-bio-5/evrolos-bio-5-prROUTE_END', 'shop', 204, 'element', 1510841555, 'always', '', 0, 0, '0'),
(3817, 'shop/evrolos-bio/evrolos-bio-6/evrolos-bio-6-prROUTE_END', 'shop', 205, 'element', 1510841555, 'always', '', 0, 0, '0'),
(3818, 'shop/evrolos-bio/evrolos-bio-8/evrolos-bio-8-prROUTE_END', 'shop', 206, 'element', 1510841556, 'always', '', 0, 0, '0'),
(3819, 'shop/evrolos-bio/evrolos-bio-10/evrolos-bio-10-prROUTE_END', 'shop', 207, 'element', 1510841556, 'always', '', 0, 0, '0'),
(3820, 'shop/evrolos-bio/evrolos-bio-12/evrolos-bio-12-prROUTE_END', 'shop', 208, 'element', 1510841556, 'always', '', 0, 0, '0'),
(3821, 'shop/evrolos-bio/evrolos-bio-15/evrolos-bio-15-prROUTE_END', 'shop', 209, 'element', 1510841556, 'always', '', 0, 0, '0'),
(3822, 'shop/evrolos-bio/evrolos-bio-20/evrolos-bio-20-prROUTE_END', 'shop', 210, 'element', 1510841556, 'always', '', 0, 0, '0'),
(3823, 'shop/evrolos-pro/evrolos-pro-3/evrolos-pro-3ROUTE_END', 'shop', 191, 'element', 1510841556, 'always', '', 0, 0, '0'),
(3824, 'shop/evrolos-pro/evrolos-pro-4/evrolos-pro-4ROUTE_END', 'shop', 192, 'element', 1510841557, 'always', '', 0, 0, '0'),
(3825, 'shop/evrolos-pro/evrolos-pro-5/evrolos-pro-5ROUTE_END', 'shop', 193, 'element', 1510841557, 'always', '', 0, 0, '0'),
(3826, 'shop/evrolos-pro/evrolos-pro-6/evrolos-pro-6ROUTE_END', 'shop', 194, 'element', 1510841557, 'always', '', 0, 0, '0'),
(3827, 'shop/evrolos-pro/evrolos-pro-8/evrolos-pro-8ROUTE_END', 'shop', 195, 'element', 1510841557, 'always', '', 0, 0, '0'),
(3828, 'shop/evrolos-pro/evrolos-pro-10/evrolos-pro-10ROUTE_END', 'shop', 196, 'element', 1510841557, 'always', '', 0, 0, '0'),
(3829, 'shop/evrolos-pro/evrolos-pro-12/evrolos-pro-12ROUTE_END', 'shop', 197, 'element', 1510841557, 'always', '', 0, 0, '0'),
(3830, 'shop/evrolos-pro/evrolos-pro-15/evrolos-pro-15ROUTE_END', 'shop', 198, 'element', 1510841558, 'always', '', 0, 0, '0'),
(3831, 'shop/evrolos-pro/evrolos-pro-20/evrolos-pro-20ROUTE_END', 'shop', 199, 'element', 1510841558, 'always', '', 0, 0, '0'),
(3832, 'shop/evrolos-pro/evrolos-pro-25/evrolos-pro-25ROUTE_END', 'shop', 200, 'element', 1510841558, 'always', '', 0, 0, '0'),
(3833, 'shop/evrolos-pro/evrolos-pro-30/evrolos-pro-30ROUTE_END', 'shop', 201, 'element', 1510841558, 'always', '', 0, 0, '0'),
(3834, 'shop/evrolos-pro/evrolos-pro-3/evrolos-pro-3-prROUTE_END', 'shop', 211, 'element', 1510841559, 'always', '', 0, 0, '0'),
(3835, 'shop/evrolos-pro/evrolos-pro-4/evrolos-pro-4-prROUTE_END', 'shop', 212, 'element', 1510841559, 'always', '', 0, 0, '0'),
(3836, 'shop/evrolos-pro/evrolos-pro-5/evrolos-pro-5-prROUTE_END', 'shop', 213, 'element', 1510841559, 'always', '', 0, 0, '0'),
(3837, 'shop/evrolos-pro/evrolos-pro-6/evrolos-pro-6-prROUTE_END', 'shop', 214, 'element', 1510841559, 'always', '', 0, 0, '0'),
(3838, 'shop/evrolos-pro/evrolos-pro-8/evrolos-pro-8-prROUTE_END', 'shop', 215, 'element', 1510841560, 'always', '', 0, 0, '0'),
(3839, 'shop/evrolos-pro/evrolos-pro-10/evrolos-pro-10-prROUTE_END', 'shop', 216, 'element', 1510841560, 'always', '', 0, 0, '0'),
(3840, 'shop/evrolos-pro/evrolos-pro-12/evrolos-pro-12-prROUTE_END', 'shop', 217, 'element', 1510841560, 'always', '', 0, 0, '0'),
(3841, 'shop/evrolos-pro/evrolos-pro-15/evrolos-pro-15-prROUTE_END', 'shop', 218, 'element', 1510841560, 'always', '', 0, 0, '0'),
(3842, 'shop/evrolos-pro/evrolos-pro-20/evrolos-pro-20-prROUTE_END', 'shop', 219, 'element', 1510841560, 'always', '', 0, 0, '0'),
(3843, 'shop/evrolos-pro/evrolos-pro-25/evrolos-pro-25-prROUTE_END', 'shop', 220, 'element', 1510841561, 'always', '', 0, 0, '0'),
(3844, 'shop/evrolos-pro/evrolos-pro-30/evrolos-pro-30-prROUTE_END', 'shop', 221, 'element', 1510841561, 'always', '', 0, 0, '0'),
(3865, 'shop/topas-sROUTE_END', 'shop', 6, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3866, 'shop/topasROUTE_END', 'shop', 7, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3867, 'shop/topaeroROUTE_END', 'shop', 15, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3868, 'shop/topbioROUTE_END', 'shop', 16, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3871, 'shop/evrolos-bioROUTE_END', 'shop', 19, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3872, 'shop/evrolos-proROUTE_END', 'shop', 20, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3873, 'shop/topas-s/topas-s-49ROUTE_END', 'shop', 9, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3874, 'shop/topas-s/topas-s-510ROUTE_END', 'shop', 10, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3875, 'shop/topas-s/topas-s-611ROUTE_END', 'shop', 11, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3876, 'shop/topas-s/topas-s-833ROUTE_END', 'shop', 33, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3877, 'shop/topas-s/topas-s-934ROUTE_END', 'shop', 34, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3878, 'shop/topas-s/topas-s-1035ROUTE_END', 'shop', 35, 'cat', 1510907109, 'always', '', 0, 0, '0'),
(3879, 'shop/topas-s/topas-s-1236ROUTE_END', 'shop', 36, 'cat', 1510907110, 'always', '', 0, 0, '0'),
(3880, 'shop/topas/topas-413ROUTE_END', 'shop', 13, 'cat', 1510907110, 'always', '', 0, 0, '0'),
(3881, 'shop/topas/topas-514ROUTE_END', 'shop', 14, 'cat', 1510907110, 'always', '', 0, 0, '0'),
(3882, 'shop/topas/topas-621ROUTE_END', 'shop', 21, 'cat', 1510907110, 'always', '', 0, 0, '0'),
(3883, 'shop/topas/topas-822ROUTE_END', 'shop', 22, 'cat', 1510907110, 'always', '', 0, 0, '0'),
(3884, 'shop/topas/topas-950ROUTE_END', 'shop', 50, 'cat', 1510907110, 'always', '', 0, 0, '0'),
(3885, 'shop/topas/topas-10ROUTE_END', 'shop', 23, 'cat', 1510907110, 'always', '', 0, 0, '0'),
(3886, 'shop/topas/topas-12ROUTE_END', 'shop', 24, 'cat', 1510907110, 'always', '', 0, 0, '0'),
(3887, 'shop/topas/topas-15ROUTE_END', 'shop', 25, 'cat', 1510907110, 'always', '', 0, 0, '0'),
(3888, 'shop/topas/topas-20ROUTE_END', 'shop', 26, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3889, 'shop/topas/topas-30ROUTE_END', 'shop', 27, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3890, 'shop/topas/topas-40ROUTE_END', 'shop', 28, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3891, 'shop/topas/topas-50ROUTE_END', 'shop', 29, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3892, 'shop/topas/topas-75ROUTE_END', 'shop', 30, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3893, 'shop/topas/topas-100ROUTE_END', 'shop', 31, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3894, 'shop/topas/topas-150ROUTE_END', 'shop', 32, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3895, 'shop/topaero/topaero-3ROUTE_END', 'shop', 37, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3896, 'shop/topaero/topaero-4ROUTE_END', 'shop', 38, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3897, 'shop/topaero/topaero-6ROUTE_END', 'shop', 39, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3898, 'shop/topaero/topaero-7ROUTE_END', 'shop', 40, 'cat', 1510907111, 'always', '', 0, 0, '0'),
(3899, 'shop/topaero/topaero-9ROUTE_END', 'shop', 41, 'cat', 1510907112, 'always', '', 0, 0, '0'),
(3900, 'shop/topaero/topaero-12ROUTE_END', 'shop', 42, 'cat', 1510907112, 'always', '', 0, 0, '0'),
(3901, 'shop/topaero/topaero-16ROUTE_END', 'shop', 43, 'cat', 1510907112, 'always', '', 0, 0, '0'),
(3902, 'shop/topaero/topaero-24ROUTE_END', 'shop', 44, 'cat', 1510907112, 'always', '', 0, 0, '0'),
(3903, 'shop/topaero/topaero-32ROUTE_END', 'shop', 45, 'cat', 1510907112, 'always', '', 0, 0, '0'),
(3904, 'shop/topbio/topbioROUTE_END', 'shop', 46, 'cat', 1510907112, 'always', '', 0, 0, '0'),
(3914, 'shop/evrolos-bio/evrolos-bio-3ROUTE_END', 'shop', 258, 'cat', 1510907113, 'always', '', 0, 0, '0'),
(3915, 'shop/evrolos-bio/evrolos-bio-4ROUTE_END', 'shop', 259, 'cat', 1510907113, 'always', '', 0, 0, '0'),
(3916, 'shop/evrolos-bio/evrolos-bio-5ROUTE_END', 'shop', 260, 'cat', 1510907113, 'always', '', 0, 0, '0'),
(3917, 'shop/evrolos-bio/evrolos-bio-6ROUTE_END', 'shop', 261, 'cat', 1510907113, 'always', '', 0, 0, '0'),
(3918, 'shop/evrolos-bio/evrolos-bio-8ROUTE_END', 'shop', 262, 'cat', 1510907113, 'always', '', 0, 0, '0'),
(3919, 'shop/evrolos-bio/evrolos-bio-10ROUTE_END', 'shop', 263, 'cat', 1510907113, 'always', '', 0, 0, '0'),
(3920, 'shop/evrolos-bio/evrolos-bio-12ROUTE_END', 'shop', 264, 'cat', 1510907113, 'always', '', 0, 0, '0'),
(3921, 'shop/evrolos-bio/evrolos-bio-15ROUTE_END', 'shop', 265, 'cat', 1510907113, 'always', '', 0, 0, '0'),
(3922, 'shop/evrolos-bio/evrolos-bio-20ROUTE_END', 'shop', 266, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3923, 'shop/evrolos-pro/evrolos-pro-3ROUTE_END', 'shop', 267, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3924, 'shop/evrolos-pro/evrolos-pro-4ROUTE_END', 'shop', 268, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3925, 'shop/evrolos-pro/evrolos-pro-5ROUTE_END', 'shop', 269, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3926, 'shop/evrolos-pro/evrolos-pro-6ROUTE_END', 'shop', 270, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3927, 'shop/evrolos-pro/evrolos-pro-8ROUTE_END', 'shop', 271, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3928, 'shop/evrolos-pro/evrolos-pro-10ROUTE_END', 'shop', 272, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3929, 'shop/evrolos-pro/evrolos-pro-12ROUTE_END', 'shop', 273, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3930, 'shop/evrolos-pro/evrolos-pro-15ROUTE_END', 'shop', 274, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3931, 'shop/evrolos-pro/evrolos-pro-20ROUTE_END', 'shop', 275, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3932, 'shop/evrolos-pro/evrolos-pro-25ROUTE_END', 'shop', 276, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3933, 'shop/evrolos-pro/evrolos-pro-30ROUTE_END', 'shop', 277, 'cat', 1510907114, 'always', '', 0, 0, '0'),
(3935, 'shop/topas-s/topas-s-49/topas-s-4ROUTE_END', 'shop', 50, 'element', 1528274606, 'always', '', 0, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_menu`
--

CREATE TABLE IF NOT EXISTS `diafan_menu` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat','brand','param') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор меню из таблицы `diafan_menu_category`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пункта меню - родителя из таблицы `diafan_menu`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных пунтов',
  `othurl` varchar(250) NOT NULL DEFAULT '' COMMENT 'внешнаяя ссылка',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `text1` varchar(255) NOT NULL DEFAULT '' COMMENT 'описание пункта меню',
  `attributes` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибуты ссылки',
  `target_blank` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'открывать в новом окне',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Пункты меню';

--
-- Dumping data for table `diafan_menu`
--

INSERT INTO `diafan_menu` (`id`, `name1`, `module_name`, `element_type`, `element_id`, `cat_id`, `parent_id`, `count_children`, `othurl`, `access`, `date_start`, `date_finish`, `sort`, `act1`, `text1`, `attributes`, `target_blank`, `trash`) VALUES
(1, 'Полезное', 'site', 'element', 2, 1, 0, 6, '', '0', 0, 0, 2, '1', '', '', '0', '0'),
(2, 'О компании', 'site', 'element', 4, 1, 0, 3, '', '0', 0, 0, 1, '1', '', '', '0', '0'),
(3, 'Объявления', 'site', 'element', 5, 1, 1, 0, '', '0', 0, 0, 5, '1', '', '', '0', '0'),
(4, 'Статьи', 'site', 'element', 7, 1, 1, 0, '', '0', 0, 0, 7, '1', '', '', '0', '0'),
(5, 'Вопрос-Ответ', 'site', 'element', 8, 1, 2, 0, '', '0', 0, 0, 8, '1', '', '', '0', '0'),
(6, 'Обратная связь', 'site', 'element', 9, 1, 2, 0, '', '0', 0, 0, 9, '1', '', '', '0', '0'),
(7, 'Файловый архив', 'site', 'element', 10, 1, 1, 0, '', '0', 0, 0, 10, '1', '', '', '0', '0'),
(8, 'Форум', 'site', 'element', 11, 1, 1, 0, '', '0', 0, 0, 11, '1', '', '', '0', '0'),
(9, 'Новости', 'site', 'element', 14, 1, 1, 0, '', '0', 0, 0, 14, '1', '', '', '0', '0'),
(10, 'Фотогалерея', 'site', 'element', 15, 1, 1, 0, '', '0', 0, 0, 15, '1', '', '', '0', '0'),
(11, 'Отзывы', 'site', 'element', 16, 1, 2, 0, '', '0', 0, 0, 16, '1', '', '', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_menu_category`
--

CREATE TABLE IF NOT EXISTS `diafan_menu_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `show_title` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать заголовок: 0 - нет, 1 - да',
  `show_all_level` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводить сразу все уровни вложенности: 0 - нет, 1 - да',
  `hide_parent_link` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не выводить ссылку, если есть вложенные пункты: 0 - нет, 1 - да',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `current_link` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'текущий пункт ссылкой: 0 - нет, 1 - да',
  `only_image` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не отображать имя пункта меню, если используется изображние: 0 - нет, 1 - да',
  `menu_template` varchar(100) NOT NULL DEFAULT '' COMMENT 'шаблон вывода меню',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Меню';

--
-- Dumping data for table `diafan_menu_category`
--

INSERT INTO `diafan_menu_category` (`id`, `name1`, `show_title`, `show_all_level`, `hide_parent_link`, `act1`, `access`, `current_link`, `only_image`, `menu_template`, `sort`, `trash`) VALUES
(1, 'Меню верхнее', '0', '1', '0', '1', '0', '1', '0', '', 1, '0'),
(2, 'Меню интернет-магазин', '0', '0', '0', '1', '0', '0', '0', '', 2, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_menu_category_site_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_menu_category_site_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пункта меню из таблицы `diafan_menu`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Данные о том, на каких страницах сайта выводится меню';

--
-- Dumping data for table `diafan_menu_category_site_rel`
--

INSERT INTO `diafan_menu_category_site_rel` (`id`, `element_id`, `site_id`, `trash`) VALUES
(1, 1, 0, '0'),
(2, 2, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_menu_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_menu_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пункта меню из таблицы `diafan_menu`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пункта меню - родителя из таблицы `diafan_menu`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Родительские связи пунктов меню';

--
-- Dumping data for table `diafan_menu_parents`
--

INSERT INTO `diafan_menu_parents` (`id`, `element_id`, `parent_id`, `trash`) VALUES
(1, 3, 1, '0'),
(2, 4, 1, '0'),
(3, 5, 2, '0'),
(4, 6, 2, '0'),
(5, 7, 1, '0'),
(6, 8, 1, '0'),
(7, 9, 1, '0'),
(8, 10, 1, '0'),
(9, 11, 2, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_messages`
--

CREATE TABLE IF NOT EXISTS `diafan_messages` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `author` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`, написавшего сообщение',
  `to_user` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users` получателя сообщения',
  `text` text COMMENT 'текст сообщения',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'сообщение прочитано: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Личные сообщения пользователей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_messages_user`
--

CREATE TABLE IF NOT EXISTS `diafan_messages_user` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users` кто инициировал контакт',
  `contact_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users` с кем создан контакт',
  `date_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата последнего сообщения',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'все сообщения прочитаны: 0 - нет, 1 - да',
  `count_message` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество сообщений',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Контакты пользователей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_mistakes`
--

CREATE TABLE IF NOT EXISTS `diafan_mistakes` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'ссылка на сайте',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `selected_text` text COMMENT 'выделенный текст с ошибкой',
  `comment` text COMMENT 'комментарий пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ошибки на сайте, добавленные пользователями';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_modules`
--

CREATE TABLE IF NOT EXISTS `diafan_modules` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT 'название',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название основного модуля',
  `site` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'используется на сайте: 0 - нет, 1 - да',
  `site_page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'подключается к странице сайта: 0 - нет, 1 - да',
  `admin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'используется в административной части: 0 - нет, 1 - да',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT 'название для пользователей'
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Модули';

--
-- Dumping data for table `diafan_modules`
--

INSERT INTO `diafan_modules` (`id`, `name`, `module_name`, `site`, `site_page`, `admin`, `title`) VALUES
(1, 'service', 'core', '1', '0', '1', 'Модули и БД'),
(2, 'admin', 'core', '0', '0', '1', 'Страницы админки'),
(3, 'config', 'core', '0', '0', '1', 'Параметры сайта'),
(4, 'images', 'core', '1', '0', '1', 'Изображения'),
(5, 'attachments', 'core', '1', '0', '1', 'Прикрепленные файлы'),
(6, 'menu', 'core', '1', '0', '1', 'Меню'),
(7, 'site', 'core', '1', '0', '1', 'Страницы сайта'),
(8, 'ab', 'ab', '1', '1', '1', 'Объявления'),
(9, 'balance', 'balance', '1', '1', '1', 'Баланс пользователя'),
(10, 'bbcode', 'core', '1', '0', '0', 'Bbcode'),
(11, 'bs', 'bs', '1', '0', '1', 'Баннеры'),
(12, 'captcha', 'core', '1', '0', '1', 'Captcha'),
(13, 'clauses', 'clauses', '1', '1', '1', 'Статьи'),
(14, 'comments', 'comments', '1', '0', '1', 'Комментарии'),
(15, 'consultant', 'consultant', '1', '0', '1', 'On-line консультант'),
(16, 'custom', 'core', '1', '0', '1', 'Темы и дизайн'),
(17, 'dashboard', 'core', '0', '0', '1', 'События'),
(18, 'faq', 'faq', '1', '1', '1', 'Вопрос-Ответ'),
(19, 'feedback', 'feedback', '1', '1', '1', 'Обратная связь'),
(20, 'filemanager', 'filemanager', '0', '0', '1', 'Файловый менеджер'),
(21, 'files', 'files', '1', '1', '1', 'Файловый архив'),
(22, 'forum', 'forum', '1', '1', '1', 'Форум'),
(23, 'geomap', 'geomap', '1', '1', '1', 'Геокарта'),
(24, 'keywords', 'keywords', '1', '0', '1', 'Перелинковка'),
(25, 'languages', 'core', '1', '0', '1', 'Языки сайта'),
(26, 'map', 'map', '1', '1', '0', 'Карта сайта'),
(27, 'messages', 'messages', '1', '1', '0', 'Личные сообщения'),
(28, 'mistakes', 'mistakes', '1', '0', '1', 'Ошибки на сайте'),
(29, 'news', 'news', '1', '1', '1', 'Новости'),
(30, 'paginator', 'core', '1', '0', '1', 'Постраничная навигация'),
(31, 'payment', 'payment', '1', '0', '1', 'Оплата'),
(32, 'photo', 'photo', '1', '1', '1', 'Фотогалерея'),
(33, 'rating', 'rating', '1', '0', '1', 'Рейтинг'),
(34, 'reviews', 'reviews', '1', '0', '1', 'Отзывы'),
(35, 'search', 'search', '1', '1', '1', 'Поиск'),
(36, 'shop', 'shop', '1', '1', '1', 'Интернет-магазин'),
(37, 'cart', 'shop', '1', '1', '0', 'Корзина'),
(38, 'wishlist', 'shop', '1', '1', '0', 'Отложенные'),
(39, 'delivery', 'shop', '1', '0', '1', 'Служба доставки'),
(40, 'subscribtion', 'subscribtion', '1', '1', '1', 'Рассылки'),
(41, 'tags', 'tags', '1', '1', '1', 'Теги'),
(42, 'trash', 'core', '0', '0', '1', 'Корзина'),
(43, 'update', 'core', '1', '0', '1', 'Обновление DIAFAN.CMS'),
(44, 'useradmin', 'core', '1', '0', '1', 'Панель быстрого редактирования'),
(45, 'users', 'core', '1', '0', '1', 'Пользователи'),
(46, 'userpage', 'core', '1', '1', '0', 'Страница пользователя'),
(47, 'usersettings', 'core', '1', '1', '0', 'Настройки аккаунта'),
(48, 'registration', 'core', '1', '1', '0', 'Регистрация'),
(49, 'reminding', 'core', '1', '1', '0', 'Восстановление доступа'),
(50, 'votes', 'votes', '1', '0', '1', 'Опросы');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_news`
--

CREATE TABLE IF NOT EXISTS `diafan_news` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор основной категории из таблицы `diafan_news_category`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `prior` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'важно, всегда сверху: 0 - нет, 1 - да',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший новость в административной части',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Новости';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_news_category`
--

CREATE TABLE IF NOT EXISTS `diafan_news_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_news_category`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных категорий',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории новостей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_news_category_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_news_category_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_news_category`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории-родителя из таблицы `diafan_news_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий новостей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_news_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_news_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор новости из таблицы `diafan_news`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_news_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи новостей и категорий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_news_counter`
--

CREATE TABLE IF NOT EXISTS `diafan_news_counter` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор новости из таблицы `diafan_news`',
  `count_view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров новостей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_news_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_news_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор новости из таблицы `diafan_news`',
  `rel_element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор связанной новости из таблицы `diafan_news`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих новостей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_payment`
--

CREATE TABLE IF NOT EXISTS `diafan_payment` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text COMMENT 'описание',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `payment` varchar(20) NOT NULL DEFAULT '' COMMENT 'платежная система',
  `params` text COMMENT 'серилизованные настройки платежной системы',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Методы оплаты';

--
-- Dumping data for table `diafan_payment`
--

INSERT INTO `diafan_payment` (`id`, `name1`, `text1`, `act1`, `payment`, `params`, `trash`, `sort`) VALUES
(1, 'Наличными курьеру', 'Заказ необходимо оплатить курьеру на руки наличными', '1', '', NULL, '0', 1),
(2, 'Оплата счета балансом', 'Вы можете оплатить счет используя баланс', '1', 'balance', NULL, '0', 2);

-- --------------------------------------------------------

--
-- Table structure for table `diafan_payment_history`
--

CREATE TABLE IF NOT EXISTS `diafan_payment_history` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'элемент модуля, для которого производится платеж (номер заказа или идентификатор пользователя)',
  `status` enum('request_pay','pay') NOT NULL DEFAULT 'request_pay' COMMENT 'статус платежа: request_pay - запрошен, pay - оплачен',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `summ` double NOT NULL DEFAULT '0' COMMENT 'сумма платежа',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор метода оплаты из таблицы `diafan_payment`',
  `module_name` enum('cart','balance') NOT NULL DEFAULT 'cart' COMMENT 'модуль, в котором используются платежи',
  `code` varchar(32) NOT NULL DEFAULT '0' COMMENT 'код доступа к платежным документам',
  `payment_data` varchar(50) NOT NULL DEFAULT '0' COMMENT 'данные о платеже из платежной системы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='История платежей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_photo`
--

CREATE TABLE IF NOT EXISTS `diafan_photo` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор основного альбома из таблицы `diafan_photo_category`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший фотографию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Фотографии';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_photo_category`
--

CREATE TABLE IF NOT EXISTS `diafan_photo_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_photo_category`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных альбомов',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший альбом в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Альбомы фотографий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_photo_category_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_photo_category_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор альбома из таблицы `diafan_photo_category`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор альбома-родителя из таблицы `diafan_photo_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи альбомов фотографий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_photo_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_photo_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор фотографии из таблицы `diafan_photo`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор альбома из таблицы `diafan_photo_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи фотографий с альбомами';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_photo_counter`
--

CREATE TABLE IF NOT EXISTS `diafan_photo_counter` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор фотографии из таблицы `diafan_photo`',
  `count_view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров фотографий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_photo_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_photo_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор фотографии из таблицы `diafan_photo`',
  `rel_element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор связанной фотографии из таблицы `diafan_photo`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих фотографий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_rating`
--

CREATE TABLE IF NOT EXISTS `diafan_rating` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `rating` double NOT NULL DEFAULT '0' COMMENT 'средняя оценка',
  `count_votes` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество оценок',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата последней оценки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Рейтинг элементов модулей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_redirect`
--

CREATE TABLE IF NOT EXISTS `diafan_redirect` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `redirect` varchar(255) NOT NULL DEFAULT '' COMMENT 'исходная псевдоссылка, с которой иустановлен редирект',
  `code` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'код редиректа',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat','brand','param') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Редиректы';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_reviews`
--

CREATE TABLE IF NOT EXISTS `diafan_reviews` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'сообщение прочитано: 0 - нет, 1 - да',
  `votes` double NOT NULL DEFAULT '0' COMMENT 'средняя оценка',
  `count_votes_plus` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество согласных',
  `count_votes_minues` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество несогласных',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `text` text COMMENT 'ответ',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Отзывы';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_reviews_param`
--

CREATE TABLE IF NOT EXISTS `diafan_reviews_param` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `info` varchar(20) NOT NULL DEFAULT '' COMMENT 'смысловая нагрузка',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `show_in_list` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в списке: 0 - нет, 1 - да',
  `show_in_form_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в форме авторизованным пользователям: 0 - нет, 1 - да',
  `show_in_form_no_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в списке: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `config` text COMMENT 'серилизованные настройки поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Дополнительные поля отзывов';

--
-- Dumping data for table `diafan_reviews_param`
--

INSERT INTO `diafan_reviews_param` (`id`, `name1`, `type`, `info`, `module_name`, `sort`, `required`, `show_in_list`, `show_in_form_auth`, `show_in_form_no_auth`, `text1`, `config`, `trash`) VALUES
(1, 'Имя', 'text', 'name', '', 1, '1', '0', '0', '1', NULL, NULL, '0'),
(2, 'E-mail', 'email', 'email', '', 2, '1', '0', '1', '1', NULL, NULL, '0'),
(3, 'Город', 'text', '', '', 3, '0', '1', '1', '1', NULL, NULL, '0'),
(4, 'Аватар', 'images', 'avatar', '', 4, '0', '0', '0', '1', NULL, 'a:1:{i:0;a:2:{s:4:"name";s:5:"large";s:2:"id";s:1:"5";}}', '0'),
(5, 'Оценка', 'radio', 'rating', '', 5, '0', '1', '1', '1', NULL, NULL, '0'),
(6, 'Достоинства', 'textarea', '', '', 6, '0', '1', '1', '1', NULL, NULL, '0'),
(7, 'Недостатки', 'textarea', '', '', 7, '0', '1', '1', '1', NULL, NULL, '0'),
(8, 'Отзыв', 'textarea', '', '', 8, '0', '1', '1', '1', NULL, NULL, '0'),
(9, 'Приложить файлы', 'attachments', '', '', 9, '0', '1', '1', '1', NULL, 'a:11:{s:21:"max_count_attachments";i:3;s:21:"attachment_extensions";s:13:"jpg, png, zip";s:15:"recognize_image";i:0;s:24:"attachments_access_admin";i:0;s:16:"attach_big_width";i:0;s:17:"attach_big_height";i:0;s:18:"attach_big_quality";i:0;s:19:"attach_medium_width";i:0;s:20:"attach_medium_height";i:0;s:21:"attach_medium_quality";i:0;s:13:"use_animation";i:0;}', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_reviews_param_element`
--

CREATE TABLE IF NOT EXISTS `diafan_reviews_param_element` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `value` text COMMENT 'значение',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_reviews_param`',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор отзыва из таблицы `diafan_reviews`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения дополнительных полей отзывов';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_reviews_param_select`
--

CREATE TABLE IF NOT EXISTS `diafan_reviews_param_select` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_reviews_param`',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `value` varchar(1) NOT NULL DEFAULT '' COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Варианты значения дополнительных полей отзывов с типом список';

--
-- Dumping data for table `diafan_reviews_param_select`
--

INSERT INTO `diafan_reviews_param_select` (`id`, `param_id`, `name1`, `value`, `sort`, `trash`) VALUES
(1, 5, '1', '', 1, '0'),
(2, 5, '2', '', 2, '0'),
(3, 5, '3', '', 3, '0'),
(4, 5, '4', '', 4, '0'),
(5, 5, '5', '', 5, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_rewrite`
--

CREATE TABLE IF NOT EXISTS `diafan_rewrite` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `rewrite` varchar(250) NOT NULL DEFAULT '' COMMENT 'псевдоссылка',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat','brand','param') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2113 DEFAULT CHARSET=utf8 COMMENT='Псевдоссылки';

--
-- Dumping data for table `diafan_rewrite`
--

INSERT INTO `diafan_rewrite` (`id`, `rewrite`, `module_name`, `element_id`, `element_type`, `trash`) VALUES
(1, '', 'site', 1, 'element', '0'),
(2, 'useful', 'site', 2, 'element', '0'),
(3, 'ads', 'site', 5, 'element', '0'),
(4, 'balance', 'site', 6, 'element', '0'),
(5, 'clauses', 'site', 7, 'element', '0'),
(6, 'faq', 'site', 8, 'element', '0'),
(7, 'feedback', 'site', 9, 'element', '0'),
(8, 'files', 'site', 10, 'element', '0'),
(9, 'forum', 'site', 11, 'element', '0'),
(10, 'map', 'site', 12, 'element', '0'),
(11, 'messages', 'site', 13, 'element', '0'),
(12, 'news', 'site', 14, 'element', '0'),
(13, 'photo', 'site', 15, 'element', '0'),
(14, 'reviews', 'site', 16, 'element', '0'),
(15, 'search', 'site', 17, 'element', '0'),
(16, 'shop', 'site', 18, 'element', '0'),
(17, 'shop/cart', 'site', 19, 'element', '0'),
(18, 'shop/cart/done', 'site', 20, 'element', '0'),
(19, 'shop/wishlist', 'site', 21, 'element', '0'),
(20, 'subscribtion', 'site', 22, 'element', '0'),
(21, 'tags', 'site', 23, 'element', '0'),
(22, 'user', 'site', 3, 'element', '0'),
(23, 'registration', 'site', 24, 'element', '0'),
(24, 'reminding', 'site', 25, 'element', '0'),
(25, 'settings', 'site', 26, 'element', '0'),
(31, 'shop/topas2', 'shop', 2, 'brand', '0'),
(32, 'shop/evrolos', 'shop', 3, 'brand', '0'),
(33, 'tags/topas-s', 'tags', 1, 'element', '0'),
(1700, 'shop/topas-s', 'shop', 6, 'cat', '0'),
(1701, 'shop/topas', 'shop', 7, 'cat', '0'),
(1702, 'shop/topaero', 'shop', 15, 'cat', '0'),
(1703, 'shop/topbio', 'shop', 16, 'cat', '0'),
(1704, 'shop/evrolos-udacha', 'shop', 17, 'cat', '0'),
(1705, 'shop/evrolos-eko', 'shop', 18, 'cat', '0'),
(1706, 'shop/evrolos-bio', 'shop', 19, 'cat', '0'),
(1707, 'shop/evrolos-pro', 'shop', 20, 'cat', '0'),
(1708, 'shop/topas-s/topas-s-49', 'shop', 9, 'cat', '0'),
(1709, 'shop/topas-s/topas-s-510', 'shop', 10, 'cat', '0'),
(1710, 'shop/topas-s/topas-s-611', 'shop', 11, 'cat', '0'),
(1711, 'shop/topas-s/topas-s-833', 'shop', 33, 'cat', '0'),
(1712, 'shop/topas-s/topas-s-934', 'shop', 34, 'cat', '0'),
(1713, 'shop/topas-s/topas-s-1035', 'shop', 35, 'cat', '0'),
(1714, 'shop/topas-s/topas-s-1236', 'shop', 36, 'cat', '0'),
(1715, 'shop/topas/topas-413', 'shop', 13, 'cat', '0'),
(1716, 'shop/topas/topas-514', 'shop', 14, 'cat', '0'),
(1717, 'shop/topas/topas-621', 'shop', 21, 'cat', '0'),
(1718, 'shop/topas/topas-822', 'shop', 22, 'cat', '0'),
(1719, 'shop/topas/topas-950', 'shop', 50, 'cat', '0'),
(1720, 'shop/topas/topas-10', 'shop', 23, 'cat', '0'),
(1721, 'shop/topas/topas-12', 'shop', 24, 'cat', '0'),
(1722, 'shop/topas/topas-15', 'shop', 25, 'cat', '0'),
(1723, 'shop/topas/topas-20', 'shop', 26, 'cat', '0'),
(1724, 'shop/topas/topas-30', 'shop', 27, 'cat', '0'),
(1725, 'shop/topas/topas-40', 'shop', 28, 'cat', '0'),
(1726, 'shop/topas/topas-50', 'shop', 29, 'cat', '0'),
(1727, 'shop/topas/topas-75', 'shop', 30, 'cat', '0'),
(1728, 'shop/topas/topas-100', 'shop', 31, 'cat', '0'),
(1729, 'shop/topas/topas-150', 'shop', 32, 'cat', '0'),
(1730, 'shop/topaero/topaero-3', 'shop', 37, 'cat', '0'),
(1731, 'shop/topaero/topaero-4', 'shop', 38, 'cat', '0'),
(1732, 'shop/topaero/topaero-6', 'shop', 39, 'cat', '0'),
(1733, 'shop/topaero/topaero-7', 'shop', 40, 'cat', '0'),
(1734, 'shop/topaero/topaero-9', 'shop', 41, 'cat', '0'),
(1735, 'shop/topaero/topaero-12', 'shop', 42, 'cat', '0'),
(1736, 'shop/topaero/topaero-16', 'shop', 43, 'cat', '0'),
(1737, 'shop/topaero/topaero-24', 'shop', 44, 'cat', '0'),
(1738, 'shop/topaero/topaero-32', 'shop', 45, 'cat', '0'),
(1739, 'shop/topbio/topbio', 'shop', 46, 'cat', '0'),
(1740, 'shop/evrolos-udacha/evrolos-udacha', 'shop', 12, 'cat', '0'),
(1741, 'shop/evrolos-eko/evrolos-eko', 'shop', 250, 'cat', '0'),
(1742, 'shop/evrolos-eko/evrolos-eko-06', 'shop', 251, 'cat', '0'),
(1743, 'shop/evrolos-eko/evrolos-eko-08', 'shop', 252, 'cat', '0'),
(1744, 'shop/evrolos-eko/evrolos-eko-1', 'shop', 253, 'cat', '0'),
(1745, 'shop/evrolos-eko/evrolos-eko-15', 'shop', 254, 'cat', '0'),
(1746, 'shop/evrolos-eko/evrolos-eko-24', 'shop', 255, 'cat', '0'),
(1747, 'shop/evrolos-eko/evrolos-eko-3', 'shop', 256, 'cat', '0'),
(1748, 'shop/evrolos-eko/evrolos-eko-4', 'shop', 257, 'cat', '0'),
(1749, 'shop/evrolos-bio/evrolos-bio-3', 'shop', 258, 'cat', '0'),
(1750, 'shop/evrolos-bio/evrolos-bio-4', 'shop', 259, 'cat', '0'),
(1751, 'shop/evrolos-bio/evrolos-bio-5', 'shop', 260, 'cat', '0'),
(1752, 'shop/evrolos-bio/evrolos-bio-6', 'shop', 261, 'cat', '0'),
(1753, 'shop/evrolos-bio/evrolos-bio-8', 'shop', 262, 'cat', '0'),
(1754, 'shop/evrolos-bio/evrolos-bio-10', 'shop', 263, 'cat', '0'),
(1755, 'shop/evrolos-bio/evrolos-bio-12', 'shop', 264, 'cat', '0'),
(1756, 'shop/evrolos-bio/evrolos-bio-15', 'shop', 265, 'cat', '0'),
(1757, 'shop/evrolos-bio/evrolos-bio-20', 'shop', 266, 'cat', '0'),
(1758, 'shop/evrolos-pro/evrolos-pro-3', 'shop', 267, 'cat', '0'),
(1759, 'shop/evrolos-pro/evrolos-pro-4', 'shop', 268, 'cat', '0'),
(1760, 'shop/evrolos-pro/evrolos-pro-5', 'shop', 269, 'cat', '0'),
(1761, 'shop/evrolos-pro/evrolos-pro-6', 'shop', 270, 'cat', '0'),
(1762, 'shop/evrolos-pro/evrolos-pro-8', 'shop', 271, 'cat', '0'),
(1763, 'shop/evrolos-pro/evrolos-pro-10', 'shop', 272, 'cat', '0'),
(1764, 'shop/evrolos-pro/evrolos-pro-12', 'shop', 273, 'cat', '0'),
(1765, 'shop/evrolos-pro/evrolos-pro-15', 'shop', 274, 'cat', '0'),
(1766, 'shop/evrolos-pro/evrolos-pro-20', 'shop', 275, 'cat', '0'),
(1767, 'shop/evrolos-pro/evrolos-pro-25', 'shop', 276, 'cat', '0'),
(1768, 'shop/evrolos-pro/evrolos-pro-30', 'shop', 277, 'cat', '0'),
(1941, 'shop/topas-s/topas-s-49/topas-s-4', 'shop', 50, 'element', '0'),
(1942, 'shop/topas-s/topas-s-49/topas-s-4-pr', 'shop', 51, 'element', '0'),
(1943, 'shop/topas-s/topas-s-510/topas-s-5', 'shop', 52, 'element', '0'),
(1944, 'shop/topas-s/topas-s-510/topas-s-5-long', 'shop', 53, 'element', '0'),
(1945, 'shop/topas-s/topas-s-510/topas-s-5-pr', 'shop', 54, 'element', '0'),
(1946, 'shop/topas-s/topas-s-510/topas-s-5-long-pr', 'shop', 55, 'element', '0'),
(1947, 'shop/topas-s/topas-s-611/topas-s-6', 'shop', 56, 'element', '0'),
(1948, 'shop/topas-s/topas-s-611/topas-s-6-long', 'shop', 57, 'element', '0'),
(1949, 'shop/topas-s/topas-s-611/topas-s-6-pr', 'shop', 58, 'element', '0'),
(1950, 'shop/topas-s/topas-s-611/topas-s-6-long-pr', 'shop', 59, 'element', '0'),
(1951, 'shop/topas-s/topas-s-833/topas-s-8', 'shop', 60, 'element', '0'),
(1952, 'shop/topas-s/topas-s-833/topas-s-8-long', 'shop', 61, 'element', '0'),
(1953, 'shop/topas-s/topas-s-833/topas-s-8-pr', 'shop', 62, 'element', '0'),
(1954, 'shop/topas-s/topas-s-833/topas-s-8-long-pr', 'shop', 63, 'element', '0'),
(1955, 'shop/topas-s/topas-s-833/topas-s-8-long-us', 'shop', 64, 'element', '0'),
(1956, 'shop/topas-s/topas-s-833/topas-s-8-long-us-pr', 'shop', 65, 'element', '0'),
(1957, 'shop/topas-s/topas-s-934/topas-s-9', 'shop', 66, 'element', '0'),
(1958, 'shop/topas-s/topas-s-934/topas-s-9-long', 'shop', 67, 'element', '0'),
(1959, 'shop/topas-s/topas-s-934/topas-s-9-long-us', 'shop', 68, 'element', '0'),
(1960, 'shop/topas-s/topas-s-934/topas-s-9-pr', 'shop', 69, 'element', '0'),
(1961, 'shop/topas-s/topas-s-934/topas-s-9-long-pr', 'shop', 70, 'element', '0'),
(1962, 'shop/topas-s/topas-s-934/topas-s-9-long-us-pr', 'shop', 71, 'element', '0'),
(1963, 'shop/topas-s/topas-s-1035/topas-s-10', 'shop', 72, 'element', '0'),
(1964, 'shop/topas-s/topas-s-1035/topas-s-10-long', 'shop', 73, 'element', '0'),
(1965, 'shop/topas-s/topas-s-1035/topas-s-10-long-us', 'shop', 74, 'element', '0'),
(1966, 'shop/topas-s/topas-s-1035/topas-s-10-pr', 'shop', 75, 'element', '0'),
(1967, 'shop/topas-s/topas-s-1035/topas-s-10-long-pr', 'shop', 76, 'element', '0'),
(1968, 'shop/topas-s/topas-s-1035/topas-s-10-long-us-pr', 'shop', 77, 'element', '0'),
(1969, 'shop/topas-s/topas-s-1236/topas-s-12', 'shop', 78, 'element', '0'),
(1970, 'shop/topas-s/topas-s-1236/topas-s-12-pr', 'shop', 79, 'element', '0'),
(1971, 'shop/topas-s/topas-s-1236/topas-s-12-long-us', 'shop', 80, 'element', '0'),
(1972, 'shop/topas-s/topas-s-1236/topas-s-12-long', 'shop', 81, 'element', '0'),
(1973, 'shop/topas-s/topas-s-1236/topas-s-12-long-pr', 'shop', 82, 'element', '0'),
(1974, 'shop/topas-s/topas-s-1236/topas-s-12-long-pr-us', 'shop', 83, 'element', '0'),
(1975, 'shop/topas/topas-413/topas-4', 'shop', 84, 'element', '0'),
(1976, 'shop/topas/topas-413/topas-4-pr', 'shop', 85, 'element', '0'),
(1977, 'shop/topas/topas-514/topas-5', 'shop', 86, 'element', '0'),
(1978, 'shop/topas/topas-514/topas-5-long', 'shop', 87, 'element', '0'),
(1979, 'shop/topas/topas-514/topas-5-pr', 'shop', 88, 'element', '0'),
(1980, 'shop/topas/topas-514/topas-5-long-pr', 'shop', 89, 'element', '0'),
(1981, 'shop/topas/topas-621/topas-6', 'shop', 90, 'element', '0'),
(1982, 'shop/topas/topas-621/topas-6-pr', 'shop', 91, 'element', '0'),
(1983, 'shop/topas/topas-621/topas-6-long', 'shop', 92, 'element', '0'),
(1984, 'shop/topas/topas-621/topas-6-long-pr', 'shop', 93, 'element', '0'),
(1985, 'shop/topas/topas-822/topas-8', 'shop', 94, 'element', '0'),
(1986, 'shop/topas/topas-822/topas-8-long', 'shop', 95, 'element', '0'),
(1987, 'shop/topas/topas-822/topas-8-pr', 'shop', 96, 'element', '0'),
(1988, 'shop/topas/topas-822/topas-8-long-us', 'shop', 97, 'element', '0'),
(1989, 'shop/topas/topas-822/topas-8-long-pr', 'shop', 98, 'element', '0'),
(1990, 'shop/topas/topas-822/topas-8-long-us-pr', 'shop', 99, 'element', '0'),
(1991, 'shop/topas/topas-950/topas-9', 'shop', 100, 'element', '0'),
(1992, 'shop/topas/topas-950/topas-9-long', 'shop', 101, 'element', '0'),
(1993, 'shop/topas/topas-950/topas-9-pr', 'shop', 102, 'element', '0'),
(1994, 'shop/topas/topas-950/topas-9-long-us', 'shop', 103, 'element', '0'),
(1995, 'shop/topas/topas-950/topas-9-long-pr', 'shop', 104, 'element', '0'),
(1996, 'shop/topas/topas-950/topas-9-long-pr-us', 'shop', 105, 'element', '0'),
(1997, 'shop/topas/topas-10/topas-10', 'shop', 106, 'element', '0'),
(1998, 'shop/topas/topas-10/topas-10-pr', 'shop', 107, 'element', '0'),
(1999, 'shop/topas/topas-10/topas-10-long', 'shop', 108, 'element', '0'),
(2000, 'shop/topas/topas-10/topas-10-long-us', 'shop', 109, 'element', '0'),
(2001, 'shop/topas/topas-10/topas-10-long-pr', 'shop', 110, 'element', '0'),
(2002, 'shop/topas/topas-10/topas-10-long-pr-us', 'shop', 111, 'element', '0'),
(2003, 'shop/topas/topas-12/topas-12', 'shop', 112, 'element', '0'),
(2004, 'shop/topas/topas-12/topas-12-long', 'shop', 113, 'element', '0'),
(2005, 'shop/topas/topas-12/topas-12-pr', 'shop', 114, 'element', '0'),
(2006, 'shop/topas/topas-12/topas-12-long-us', 'shop', 115, 'element', '0'),
(2007, 'shop/topas/topas-12/topas-12-long-pr', 'shop', 116, 'element', '0'),
(2008, 'shop/topas/topas-12/topas-12-long-pr-us', 'shop', 117, 'element', '0'),
(2009, 'shop/topas/topas-15/topas-15-long-pr-us', 'shop', 118, 'element', '0'),
(2010, 'shop/topas/topas-15/topas-15-pr', 'shop', 119, 'element', '0'),
(2011, 'shop/topas/topas-15/topas-15-long', 'shop', 120, 'element', '0'),
(2012, 'shop/topas/topas-15/topas-15', 'shop', 121, 'element', '0'),
(2013, 'shop/topas/topas-15/topas-15-long-us', 'shop', 122, 'element', '0'),
(2014, 'shop/topas/topas-15/topas-15-long-pr', 'shop', 123, 'element', '0'),
(2015, 'shop/topas/topas-20/topas-20', 'shop', 124, 'element', '0'),
(2016, 'shop/topas/topas-20/topas-20-long-pr', 'shop', 125, 'element', '0'),
(2017, 'shop/topas/topas-20/topas-20-pr', 'shop', 126, 'element', '0'),
(2018, 'shop/topas/topas-20/topas-20-long', 'shop', 127, 'element', '0'),
(2019, 'shop/topas/topas-30/topas-30', 'shop', 128, 'element', '0'),
(2020, 'shop/topas/topas-30/topas-30-long-pr', 'shop', 129, 'element', '0'),
(2021, 'shop/topas/topas-30/topas-30-long', 'shop', 130, 'element', '0'),
(2022, 'shop/topas/topas-30/topas-30-pr', 'shop', 131, 'element', '0'),
(2023, 'shop/topas/topas-40/topas-40-pr', 'shop', 132, 'element', '0'),
(2024, 'shop/topas/topas-40/topas-40', 'shop', 133, 'element', '0'),
(2025, 'shop/topas/topas-50/topas-50-pr', 'shop', 134, 'element', '0'),
(2026, 'shop/topas/topas-50/topas-50', 'shop', 135, 'element', '0'),
(2027, 'shop/topas/topas-75/topas-75-pr', 'shop', 136, 'element', '0'),
(2028, 'shop/topas/topas-75/topas-75', 'shop', 137, 'element', '0'),
(2029, 'shop/topas/topas-100/topas-100', 'shop', 138, 'element', '0'),
(2030, 'shop/topas/topas-100/topas-100-pr', 'shop', 139, 'element', '0'),
(2031, 'shop/topas/topas-150/topas-150-pr', 'shop', 140, 'element', '0'),
(2032, 'shop/topas/topas-150/topas-150', 'shop', 141, 'element', '0'),
(2033, 'shop/topaero/topaero-3/topaero-3', 'shop', 142, 'element', '0'),
(2034, 'shop/topaero/topaero-3/topaero-3-long', 'shop', 143, 'element', '0'),
(2035, 'shop/topaero/topaero-3/topaero-3-pr', 'shop', 144, 'element', '0'),
(2036, 'shop/topaero/topaero-3/topaero-3-long-pr', 'shop', 145, 'element', '0'),
(2037, 'shop/topaero/topaero-3/topaero-3-long-us', 'shop', 146, 'element', '0'),
(2038, 'shop/topaero/topaero-3/topaero-3-long-pr-us', 'shop', 147, 'element', '0'),
(2039, 'shop/topaero/topaero-4/topaero-4', 'shop', 148, 'element', '0'),
(2040, 'shop/topaero/topaero-4/topaero-4-long', 'shop', 149, 'element', '0'),
(2041, 'shop/topaero/topaero-4/topaero-4-pr', 'shop', 150, 'element', '0'),
(2042, 'shop/topaero/topaero-4/topaero-4-long-us', 'shop', 151, 'element', '0'),
(2043, 'shop/topaero/topaero-4/topaero-4-long-pr', 'shop', 152, 'element', '0'),
(2044, 'shop/topaero/topaero-4/topaero-4-long-pr-us', 'shop', 153, 'element', '0'),
(2045, 'shop/topaero/topaero-6/topaero-6', 'shop', 154, 'element', '0'),
(2046, 'shop/topaero/topaero-6/topaero-6-long', 'shop', 155, 'element', '0'),
(2047, 'shop/topaero/topaero-6/topaero-6-long-us', 'shop', 156, 'element', '0'),
(2048, 'shop/topaero/topaero-6/topaero-6-pr', 'shop', 157, 'element', '0'),
(2049, 'shop/topaero/topaero-6/topaero-6-long-pr', 'shop', 158, 'element', '0'),
(2050, 'shop/topaero/topaero-6/topaero-6-long-pr-us', 'shop', 159, 'element', '0'),
(2051, 'shop/topaero/topaero-7/topaero-7', 'shop', 160, 'element', '0'),
(2052, 'shop/topaero/topaero-7/topaero-7-pr', 'shop', 161, 'element', '0'),
(2053, 'shop/topaero/topaero-9/topaero-9', 'shop', 162, 'element', '0'),
(2054, 'shop/topaero/topaero-9/topaero-9-pr', 'shop', 163, 'element', '0'),
(2055, 'shop/topaero/topaero-12/topaero-12', 'shop', 164, 'element', '0'),
(2056, 'shop/topaero/topaero-12/topaero-12-pr', 'shop', 165, 'element', '0'),
(2057, 'shop/topaero/topaero-16/topaero-16', 'shop', 166, 'element', '0'),
(2058, 'shop/topaero/topaero-16/topaero-16-pr', 'shop', 167, 'element', '0'),
(2059, 'shop/topaero/topaero-24/topaero-24', 'shop', 168, 'element', '0'),
(2060, 'shop/topaero/topaero-24/topaero-24-pr', 'shop', 169, 'element', '0'),
(2061, 'shop/topaero/topaero-32/topaero-32', 'shop', 170, 'element', '0'),
(2062, 'shop/topaero/topaero-32/topaero-32-pr', 'shop', 171, 'element', '0'),
(2063, 'shop/topbio/topbio/topbio', 'shop', 172, 'element', '0'),
(2064, 'shop/evrolos-udacha/evrolos-udacha/evrolos-udacha', 'shop', 173, 'element', '0'),
(2065, 'shop/evrolos-eko/evrolos-eko/evrolos-eko', 'shop', 174, 'element', '0'),
(2066, 'shop/evrolos-eko/evrolos-eko-06/evrolos-eko-06', 'shop', 175, 'element', '0'),
(2067, 'shop/evrolos-eko/evrolos-eko-08/evrolos-eko-08', 'shop', 176, 'element', '0'),
(2068, 'shop/evrolos-eko/evrolos-eko-1/evrolos-eko-1', 'shop', 177, 'element', '0'),
(2069, 'shop/evrolos-eko/evrolos-eko-15/evrolos-eko-15', 'shop', 178, 'element', '0'),
(2070, 'shop/evrolos-eko/evrolos-eko-24/evrolos-eko-24', 'shop', 179, 'element', '0'),
(2071, 'shop/evrolos-eko/evrolos-eko-3/evrolos-eko-3', 'shop', 180, 'element', '0'),
(2072, 'shop/evrolos-eko/evrolos-eko-4/evrolos-eko-4', 'shop', 181, 'element', '0'),
(2073, 'shop/evrolos-bio/evrolos-bio-3/evrolos-bio-3', 'shop', 182, 'element', '0'),
(2074, 'shop/evrolos-bio/evrolos-bio-4/evrolos-bio-4', 'shop', 183, 'element', '0'),
(2075, 'shop/evrolos-bio/evrolos-bio-5/evrolos-bio-5', 'shop', 184, 'element', '0'),
(2076, 'shop/evrolos-bio/evrolos-bio-6/evrolos-bio-6', 'shop', 185, 'element', '0'),
(2077, 'shop/evrolos-bio/evrolos-bio-8/evrolos-bio-8', 'shop', 186, 'element', '0'),
(2078, 'shop/evrolos-bio/evrolos-bio-10/evrolos-bio-10', 'shop', 187, 'element', '0'),
(2079, 'shop/evrolos-bio/evrolos-bio-12/evrolos-bio-12', 'shop', 188, 'element', '0'),
(2080, 'shop/evrolos-bio/evrolos-bio-15/evrolos-bio-15', 'shop', 189, 'element', '0'),
(2081, 'shop/evrolos-bio/evrolos-bio-20/evrolos-bio-20', 'shop', 190, 'element', '0'),
(2082, 'shop/evrolos-bio/evrolos-bio-3/evrolos-bio-3-pr', 'shop', 202, 'element', '0'),
(2083, 'shop/evrolos-bio/evrolos-bio-4/evrolos-bio-4-pr', 'shop', 203, 'element', '0'),
(2084, 'shop/evrolos-bio/evrolos-bio-5/evrolos-bio-5-pr', 'shop', 204, 'element', '0'),
(2085, 'shop/evrolos-bio/evrolos-bio-6/evrolos-bio-6-pr', 'shop', 205, 'element', '0'),
(2086, 'shop/evrolos-bio/evrolos-bio-8/evrolos-bio-8-pr', 'shop', 206, 'element', '0'),
(2087, 'shop/evrolos-bio/evrolos-bio-10/evrolos-bio-10-pr', 'shop', 207, 'element', '0'),
(2088, 'shop/evrolos-bio/evrolos-bio-12/evrolos-bio-12-pr', 'shop', 208, 'element', '0'),
(2089, 'shop/evrolos-bio/evrolos-bio-15/evrolos-bio-15-pr', 'shop', 209, 'element', '0'),
(2090, 'shop/evrolos-bio/evrolos-bio-20/evrolos-bio-20-pr', 'shop', 210, 'element', '0'),
(2091, 'shop/evrolos-pro/evrolos-pro-3/evrolos-pro-3', 'shop', 191, 'element', '0'),
(2092, 'shop/evrolos-pro/evrolos-pro-4/evrolos-pro-4', 'shop', 192, 'element', '0'),
(2093, 'shop/evrolos-pro/evrolos-pro-5/evrolos-pro-5', 'shop', 193, 'element', '0'),
(2094, 'shop/evrolos-pro/evrolos-pro-6/evrolos-pro-6', 'shop', 194, 'element', '0'),
(2095, 'shop/evrolos-pro/evrolos-pro-8/evrolos-pro-8', 'shop', 195, 'element', '0'),
(2096, 'shop/evrolos-pro/evrolos-pro-10/evrolos-pro-10', 'shop', 196, 'element', '0'),
(2097, 'shop/evrolos-pro/evrolos-pro-12/evrolos-pro-12', 'shop', 197, 'element', '0'),
(2098, 'shop/evrolos-pro/evrolos-pro-15/evrolos-pro-15', 'shop', 198, 'element', '0'),
(2099, 'shop/evrolos-pro/evrolos-pro-20/evrolos-pro-20', 'shop', 199, 'element', '0'),
(2100, 'shop/evrolos-pro/evrolos-pro-25/evrolos-pro-25', 'shop', 200, 'element', '0'),
(2101, 'shop/evrolos-pro/evrolos-pro-30/evrolos-pro-30', 'shop', 201, 'element', '0'),
(2102, 'shop/evrolos-pro/evrolos-pro-3/evrolos-pro-3-pr', 'shop', 211, 'element', '0'),
(2103, 'shop/evrolos-pro/evrolos-pro-4/evrolos-pro-4-pr', 'shop', 212, 'element', '0'),
(2104, 'shop/evrolos-pro/evrolos-pro-5/evrolos-pro-5-pr', 'shop', 213, 'element', '0'),
(2105, 'shop/evrolos-pro/evrolos-pro-6/evrolos-pro-6-pr', 'shop', 214, 'element', '0'),
(2106, 'shop/evrolos-pro/evrolos-pro-8/evrolos-pro-8-pr', 'shop', 215, 'element', '0'),
(2107, 'shop/evrolos-pro/evrolos-pro-10/evrolos-pro-10-pr', 'shop', 216, 'element', '0'),
(2108, 'shop/evrolos-pro/evrolos-pro-12/evrolos-pro-12-pr', 'shop', 217, 'element', '0'),
(2109, 'shop/evrolos-pro/evrolos-pro-15/evrolos-pro-15-pr', 'shop', 218, 'element', '0'),
(2110, 'shop/evrolos-pro/evrolos-pro-20/evrolos-pro-20-pr', 'shop', 219, 'element', '0'),
(2111, 'shop/evrolos-pro/evrolos-pro-25/evrolos-pro-25-pr', 'shop', 220, 'element', '0'),
(2112, 'shop/evrolos-pro/evrolos-pro-30/evrolos-pro-30-pr', 'shop', 221, 'element', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_search_history`
--

CREATE TABLE IF NOT EXISTS `diafan_search_history` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `name` text COMMENT 'поисковый запрос'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='История поисковых запросов';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_search_index`
--

CREATE TABLE IF NOT EXISTS `diafan_search_index` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `keyword_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор слова из таблицы `diafan_search_keywords`',
  `result_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор проиндексированного элемента из таблицы `diafan_saerch_results`',
  `rating` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'рейтинг для сортировки результатов'
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8 COMMENT='Связи слов и проиндексированных для поиска элементов';

--
-- Dumping data for table `diafan_search_index`
--

INSERT INTO `diafan_search_index` (`id`, `keyword_id`, `result_id`, `rating`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 3, 1, 1),
(4, 4, 1, 1),
(5, 5, 1, 1),
(6, 6, 1, 1),
(7, 7, 1, 1),
(8, 8, 1, 1),
(9, 9, 1, 1),
(10, 10, 1, 1),
(11, 11, 1, 1),
(12, 12, 1, 1),
(13, 13, 1, 1),
(14, 14, 1, 1),
(15, 15, 1, 1),
(16, 16, 1, 1),
(17, 17, 1, 1),
(18, 18, 1, 1),
(19, 19, 1, 1),
(20, 20, 1, 1),
(21, 21, 1, 1),
(22, 22, 1, 1),
(23, 23, 1, 1),
(24, 24, 1, 1),
(25, 25, 1, 1),
(26, 26, 2, 0),
(27, 27, 3, 0),
(28, 28, 4, 0),
(29, 29, 5, 0),
(30, 18, 6, 0),
(31, 19, 6, 0),
(32, 30, 7, 0),
(33, 31, 7, 0),
(34, 22, 8, 0),
(35, 21, 8, 0),
(36, 32, 9, 0),
(37, 20, 10, 0),
(38, 23, 11, 0),
(39, 33, 12, 0),
(40, 16, 13, 0),
(41, 17, 13, 0),
(42, 5, 14, 0),
(43, 15, 14, 0),
(44, 34, 15, 0),
(45, 35, 16, 0),
(46, 36, 17, 0),
(47, 37, 17, 0),
(53, 37, 22, 0),
(54, 39, 23, 0),
(63, 39, 32, 0),
(64, 2, 32, 0),
(65, 2, 33, 0),
(66, 37, 33, 0),
(67, 39, 34, 0),
(357, 37, 110, 0),
(358, 37, 111, 0),
(359, 193, 112, 1),
(360, 175, 112, 1),
(361, 37, 112, 0),
(362, 194, 113, 1),
(363, 175, 113, 1),
(364, 37, 113, 0),
(365, 195, 114, 1),
(366, 175, 114, 1),
(367, 37, 114, 0),
(372, 193, 116, 1),
(373, 175, 116, 1),
(374, 37, 116, 0),
(375, 176, 117, 1),
(376, 175, 117, 1),
(377, 37, 117, 0),
(378, 262, 117, 1),
(379, 199, 118, 0),
(380, 200, 119, 0),
(385, 202, 122, 0),
(386, 39, 122, 0),
(387, 39, 123, 0),
(388, 203, 123, 0),
(389, 195, 124, 1),
(390, 175, 124, 1),
(391, 37, 124, 0),
(392, 263, 124, 1),
(393, 206, 125, 1),
(394, 175, 125, 1),
(395, 37, 125, 0),
(396, 264, 125, 1),
(397, 195, 126, 1),
(398, 175, 126, 1),
(399, 37, 126, 0),
(400, 265, 126, 1),
(401, 209, 127, 1),
(402, 175, 127, 1),
(403, 37, 127, 0),
(404, 266, 127, 1),
(405, 193, 128, 1),
(406, 195, 128, 1),
(407, 175, 128, 1),
(408, 37, 128, 0),
(409, 206, 129, 1),
(410, 175, 129, 1),
(411, 37, 129, 0),
(412, 267, 129, 1),
(413, 212, 130, 1),
(414, 175, 130, 1),
(415, 37, 130, 0),
(416, 268, 130, 1),
(417, 209, 131, 1),
(418, 175, 131, 1),
(419, 37, 131, 0),
(420, 269, 131, 1),
(421, 197, 132, 1),
(422, 175, 132, 1),
(423, 37, 132, 0),
(424, 270, 132, 1),
(425, 212, 133, 1),
(426, 175, 133, 1),
(427, 37, 133, 0),
(428, 271, 133, 1),
(429, 216, 134, 0),
(430, 176, 134, 1),
(431, 175, 134, 1),
(432, 37, 134, 0),
(433, 272, 134, 1),
(434, 209, 135, 1),
(435, 175, 135, 1),
(436, 37, 135, 0),
(437, 273, 135, 0),
(438, 274, 135, 1),
(439, 176, 136, 1),
(440, 175, 136, 1),
(441, 37, 136, 0),
(442, 275, 136, 1),
(443, 194, 137, 1),
(444, 175, 137, 1),
(445, 37, 137, 0),
(446, 276, 137, 1),
(447, 195, 138, 1),
(448, 175, 138, 1),
(449, 37, 138, 0),
(450, 277, 138, 1),
(451, 195, 139, 1),
(452, 175, 139, 1),
(453, 37, 139, 0),
(454, 278, 139, 1),
(455, 194, 140, 1),
(456, 175, 140, 1),
(457, 199, 140, 0),
(458, 279, 140, 1),
(459, 193, 141, 1),
(460, 175, 141, 1),
(461, 199, 141, 0),
(462, 280, 141, 1),
(463, 175, 142, 1),
(464, 199, 142, 0),
(465, 282, 142, 1),
(466, 281, 142, 1),
(467, 209, 143, 1),
(468, 175, 143, 1),
(469, 199, 143, 0),
(470, 283, 143, 1),
(471, 216, 144, 1),
(472, 175, 144, 1),
(473, 199, 144, 0),
(474, 284, 144, 1),
(475, 206, 145, 1),
(476, 175, 145, 1),
(477, 199, 145, 0),
(478, 285, 145, 1),
(479, 194, 146, 1),
(480, 175, 146, 1),
(481, 199, 146, 0),
(482, 286, 146, 1),
(483, 212, 147, 1),
(484, 175, 147, 1),
(485, 199, 147, 0),
(486, 287, 147, 1),
(487, 193, 148, 1),
(488, 175, 148, 1),
(489, 199, 148, 0),
(490, 288, 148, 1),
(491, 195, 149, 1),
(492, 175, 149, 1),
(493, 200, 149, 0),
(494, 289, 149, 1),
(495, 197, 150, 1),
(496, 39, 150, 0),
(497, 175, 150, 1),
(498, 201, 150, 0),
(499, 197, 151, 1),
(500, 202, 151, 0),
(501, 39, 151, 0),
(502, 175, 151, 1),
(503, 197, 152, 1),
(504, 39, 152, 0),
(505, 203, 152, 0),
(506, 175, 152, 1),
(507, 194, 153, 1),
(508, 175, 153, 1),
(509, 37, 153, 0),
(510, 290, 153, 1),
(511, 197, 154, 1),
(512, 39, 154, 0),
(513, 203, 154, 0),
(514, 175, 154, 1),
(547, 202, 163, 0),
(548, 39, 163, 0),
(549, 175, 163, 1),
(550, 296, 163, 1),
(551, 202, 164, 0),
(552, 39, 164, 0),
(553, 175, 164, 1),
(554, 297, 164, 1),
(555, 202, 165, 0),
(556, 39, 165, 0),
(557, 175, 165, 1),
(558, 298, 165, 1),
(559, 240, 166, 1),
(560, 202, 166, 0),
(561, 39, 166, 0),
(562, 175, 166, 1),
(563, 202, 167, 0),
(564, 39, 167, 0),
(565, 175, 167, 1),
(566, 299, 167, 1),
(567, 202, 168, 0),
(568, 39, 168, 0),
(569, 175, 168, 1),
(570, 300, 168, 1),
(571, 202, 169, 0),
(572, 39, 169, 0),
(573, 175, 169, 1),
(574, 301, 169, 1),
(575, 202, 170, 0),
(576, 39, 170, 0),
(577, 175, 170, 1),
(578, 302, 170, 1),
(579, 202, 171, 0),
(580, 39, 171, 0),
(581, 175, 171, 1),
(582, 303, 171, 1),
(583, 39, 172, 0),
(584, 203, 172, 0),
(585, 175, 172, 1),
(586, 304, 172, 1),
(587, 39, 173, 0),
(588, 203, 173, 0),
(589, 175, 173, 1),
(590, 305, 173, 1),
(591, 39, 174, 0),
(592, 203, 174, 0),
(593, 175, 174, 1),
(594, 306, 174, 1),
(595, 39, 175, 0),
(596, 203, 175, 0),
(597, 175, 175, 1),
(598, 307, 175, 1),
(599, 39, 176, 0),
(600, 203, 176, 0),
(601, 175, 176, 1),
(602, 308, 176, 1),
(603, 39, 177, 0),
(604, 203, 177, 0),
(605, 175, 177, 1),
(606, 309, 177, 1),
(607, 39, 178, 0),
(608, 203, 178, 0),
(609, 175, 178, 1),
(610, 310, 178, 1),
(611, 39, 179, 0),
(612, 203, 179, 0),
(613, 175, 179, 1),
(614, 311, 179, 1),
(615, 39, 180, 0),
(616, 203, 180, 0),
(617, 175, 180, 1),
(618, 312, 180, 1),
(619, 39, 181, 0),
(620, 203, 181, 0),
(621, 175, 181, 1),
(622, 313, 181, 1),
(623, 39, 182, 0),
(624, 203, 182, 0),
(625, 175, 182, 1),
(626, 314, 182, 1),
(638, 37, 184, 0),
(639, 325, 184, 2),
(640, 326, 184, 2),
(641, 327, 184, 2),
(642, 328, 184, 2),
(643, 329, 184, 2),
(644, 330, 184, 2),
(645, 331, 184, 2),
(646, 332, 184, 2),
(647, 333, 184, 2);

-- --------------------------------------------------------

--
-- Table structure for table `diafan_search_keywords`
--

CREATE TABLE IF NOT EXISTS `diafan_search_keywords` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT 'уникальное слово'
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 COMMENT='Индексированные для поиска слова';

--
-- Dumping data for table `diafan_search_keywords`
--

INSERT INTO `diafan_search_keywords` (`id`, `keyword`) VALUES
(1, 'главн'),
(2, 'страниц'),
(3, 'добро'),
(4, 'пожалова'),
(5, 'наш'),
(6, 'нов'),
(7, 'сайт'),
(8, 'зде'),
(9, 'можно'),
(10, 'найт'),
(11, 'много'),
(12, 'чего'),
(13, 'интересн'),
(14, 'каталог'),
(15, 'товар'),
(16, 'интернет'),
(17, 'магазин'),
(18, 'вопрос'),
(19, 'ответ'),
(20, 'новост'),
(21, 'файлов'),
(22, 'арх'),
(23, 'фотогалере'),
(24, 'мног'),
(25, 'друг'),
(26, 'полезн'),
(27, 'компан'),
(28, 'объявлен'),
(29, 'стат'),
(30, 'обратн'),
(31, 'связ'),
(32, 'форум'),
(33, 'отзыв'),
(34, 'фирм'),
(35, 'тег'),
(36, 'тест'),
(37, 'топас'),
(39, 'евролос'),
(134, 'производительност'),
(135, 'количество'),
(136, 'пользовател'),
(137, 'глубин'),
(138, 'залеган'),
(139, 'труб'),
(144, 'потребля'),
(145, 'электроэнерг'),
(146, 'вес'),
(148, 'габарит'),
(149, 'установк'),
(151, 'topas'),
(175, 'руб'),
(176, '900'),
(193, '200'),
(194, '700'),
(195, '600'),
(196, 'удач'),
(197, '000'),
(199, 'топаэро'),
(200, 'топбио'),
(201, 'эко'),
(202, 'био'),
(203, 'про'),
(206, '500'),
(209, '400'),
(212, '800'),
(216, '100'),
(236, '32000'),
(240, '76000'),
(262, '102'),
(263, '106'),
(264, '129'),
(265, '168'),
(266, '172'),
(267, '267'),
(268, '335'),
(269, '433'),
(270, '479'),
(271, '586'),
(272, '789'),
(273, '150'),
(274, '173'),
(275, '116'),
(276, '121'),
(277, '151'),
(278, '155'),
(279, '224'),
(280, '286'),
(281, '363'),
(282, '300'),
(283, '437'),
(284, '546'),
(285, '665'),
(286, '949'),
(287, '330'),
(288, '895'),
(289, '123'),
(290, '131'),
(296, '57000'),
(297, '62000'),
(298, '68000'),
(299, '94000'),
(300, '116000'),
(301, '129000'),
(302, '146000'),
(303, '172000'),
(304, '67000'),
(305, '73000'),
(306, '79000'),
(307, '87000'),
(308, '99000'),
(309, '120000'),
(310, '136000'),
(311, '155000'),
(312, '193000'),
(313, '225000'),
(314, '240000'),
(325, 'локальн'),
(326, 'очистн'),
(327, 'сооружен'),
(328, 'компрессор'),
(329, 'электромагнитн'),
(330, 'клапан'),
(331, 'гарант'),
(332, 'производител'),
(333, 'год');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_search_results`
--

CREATE TABLE IF NOT EXISTS `diafan_search_results` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента',
  `table_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'таблица элемента',
  `lang_id` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ к элементу ограничен',
  `rating` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'рейтинг для сортировки результатов',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа'
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COMMENT='Индексированные для поиска элементы';

--
-- Dumping data for table `diafan_search_results`
--

INSERT INTO `diafan_search_results` (`id`, `element_id`, `table_name`, `lang_id`, `access`, `rating`, `date_start`, `date_finish`) VALUES
(1, 1, 'site', 1, '0', 5, 0, 0),
(2, 2, 'site', 1, '0', 5, 0, 0),
(3, 4, 'site', 1, '0', 5, 0, 0),
(4, 5, 'site', 1, '0', 5, 0, 0),
(5, 7, 'site', 1, '0', 5, 0, 0),
(6, 8, 'site', 1, '0', 5, 0, 0),
(7, 9, 'site', 1, '0', 5, 0, 0),
(8, 10, 'site', 1, '0', 5, 0, 0),
(9, 11, 'site', 1, '0', 5, 0, 0),
(10, 14, 'site', 1, '0', 5, 0, 0),
(11, 15, 'site', 1, '0', 5, 0, 0),
(12, 16, 'site', 1, '0', 5, 0, 0),
(13, 18, 'site', 1, '0', 5, 0, 0),
(14, 1, 'shop_category', 1, '0', 6, 0, 0),
(15, 1, 'shop_brand', 1, '0', 6, 0, 0),
(16, 23, 'site', 1, '0', 5, 0, 0),
(17, 2, 'shop_category', 1, '0', 6, 0, 0),
(22, 2, 'shop_brand', 1, '0', 6, 0, 0),
(23, 3, 'shop_brand', 1, '0', 6, 0, 0),
(32, 4, 'shop_category', 1, '0', 6, 0, 0),
(33, 5, 'shop_category', 1, '0', 6, 0, 0),
(34, 3, 'shop_category', 1, '0', 6, 0, 0),
(110, 6, 'shop_category', 1, '0', 6, 0, 0),
(111, 7, 'shop_category', 1, '0', 6, 0, 0),
(112, 9, 'shop_category', 1, '0', 6, 0, 0),
(113, 10, 'shop_category', 1, '0', 6, 0, 0),
(114, 11, 'shop_category', 1, '0', 6, 0, 0),
(116, 13, 'shop_category', 1, '0', 6, 0, 0),
(117, 14, 'shop_category', 1, '0', 6, 0, 0),
(118, 15, 'shop_category', 1, '0', 6, 0, 0),
(119, 16, 'shop_category', 1, '0', 6, 0, 0),
(122, 19, 'shop_category', 1, '0', 6, 0, 0),
(123, 20, 'shop_category', 1, '0', 6, 0, 0),
(124, 21, 'shop_category', 1, '0', 6, 0, 0),
(125, 22, 'shop_category', 1, '0', 6, 0, 0),
(126, 23, 'shop_category', 1, '0', 6, 0, 0),
(127, 24, 'shop_category', 1, '0', 6, 0, 0),
(128, 25, 'shop_category', 1, '0', 6, 0, 0),
(129, 26, 'shop_category', 1, '0', 6, 0, 0),
(130, 27, 'shop_category', 1, '0', 6, 0, 0),
(131, 28, 'shop_category', 1, '0', 6, 0, 0),
(132, 29, 'shop_category', 1, '0', 6, 0, 0),
(133, 30, 'shop_category', 1, '0', 6, 0, 0),
(134, 31, 'shop_category', 1, '0', 6, 0, 0),
(135, 32, 'shop_category', 1, '0', 6, 0, 0),
(136, 33, 'shop_category', 1, '0', 6, 0, 0),
(137, 34, 'shop_category', 1, '0', 6, 0, 0),
(138, 35, 'shop_category', 1, '0', 6, 0, 0),
(139, 36, 'shop_category', 1, '0', 6, 0, 0),
(140, 37, 'shop_category', 1, '0', 6, 0, 0),
(141, 38, 'shop_category', 1, '0', 6, 0, 0),
(142, 39, 'shop_category', 1, '0', 6, 0, 0),
(143, 40, 'shop_category', 1, '0', 6, 0, 0),
(144, 41, 'shop_category', 1, '0', 6, 0, 0),
(145, 42, 'shop_category', 1, '0', 6, 0, 0),
(146, 43, 'shop_category', 1, '0', 6, 0, 0),
(147, 44, 'shop_category', 1, '0', 6, 0, 0),
(148, 45, 'shop_category', 1, '0', 6, 0, 0),
(149, 46, 'shop_category', 1, '0', 6, 0, 0),
(150, 47, 'shop_category', 1, '0', 6, 0, 0),
(151, 48, 'shop_category', 1, '0', 6, 0, 0),
(152, 49, 'shop_category', 1, '0', 6, 0, 0),
(153, 50, 'shop_category', 1, '0', 6, 0, 0),
(154, 51, 'shop_category', 1, '0', 6, 0, 0),
(163, 258, 'shop_category', 1, '0', 6, 0, 0),
(164, 259, 'shop_category', 1, '0', 6, 0, 0),
(165, 260, 'shop_category', 1, '0', 6, 0, 0),
(166, 261, 'shop_category', 1, '0', 6, 0, 0),
(167, 262, 'shop_category', 1, '0', 6, 0, 0),
(168, 263, 'shop_category', 1, '0', 6, 0, 0),
(169, 264, 'shop_category', 1, '0', 6, 0, 0),
(170, 265, 'shop_category', 1, '0', 6, 0, 0),
(171, 266, 'shop_category', 1, '0', 6, 0, 0),
(172, 267, 'shop_category', 1, '0', 6, 0, 0),
(173, 268, 'shop_category', 1, '0', 6, 0, 0),
(174, 269, 'shop_category', 1, '0', 6, 0, 0),
(175, 270, 'shop_category', 1, '0', 6, 0, 0),
(176, 271, 'shop_category', 1, '0', 6, 0, 0),
(177, 272, 'shop_category', 1, '0', 6, 0, 0),
(178, 273, 'shop_category', 1, '0', 6, 0, 0),
(179, 274, 'shop_category', 1, '0', 6, 0, 0),
(180, 275, 'shop_category', 1, '0', 6, 0, 0),
(181, 276, 'shop_category', 1, '0', 6, 0, 0),
(182, 277, 'shop_category', 1, '0', 6, 0, 0),
(184, 50, 'shop', 1, '0', 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `diafan_sessions`
--

CREATE TABLE IF NOT EXISTS `diafan_sessions` (
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'уникальный идентификатор сессии',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'хост',
  `user_agent` varchar(255) NOT NULL DEFAULT '' COMMENT 'браузер пользователя',
  `timestamp` varchar(20) NOT NULL DEFAULT '0' COMMENT 'время, до которого сессия действует',
  `session` text COMMENT 'серилизованные данные сессии'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сессии';

--
-- Dumping data for table `diafan_sessions`
--

INSERT INTO `diafan_sessions` (`user_id`, `session_id`, `hostname`, `user_agent`, `timestamp`, `session`) VALUES
(0, '00od265l8a8rds40aq1gf7mea2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1501224637', ''),
(0, '0sk4pmcnvvoframhb8mndmqtg1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '1501681100', ''),
(0, '18b28efn1jq760ld6easshqn10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1500895154', ''),
(0, '1o94v4rstovp5cjuiaf6ed5s05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1501163787', ''),
(0, '2a4r2uv0ted6r35ro3lclkrnm4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1503901327', ''),
(1, '3c43q67ci76h98qg2c6sobbfb4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1510907122', 'cart_summ|i:0;cart_count|i:0;'),
(1, '529lrcqn9qg6ibv1cfgv372kj4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1502182555', 'cart_summ|i:0;cart_count|i:0;group_action|a:2:{s:13:"shop/category";s:5:"trash";s:4:"shop";s:5:"trash";}'),
(0, '83vkvhdj9b9psrmi5e2fnqv2a4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1500881489', ''),
(0, '99j9baebhdl0g25kbs2m3chfk1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1528274077', ''),
(1, '9f585i339bi210glhj9ueu4na2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1504876779', 'cart_summ|i:0;cart_count|i:0;group_action|a:2:{s:4:"shop";s:5:"trash";s:13:"shop/category";s:5:"trash";}'),
(0, 'bsst4qlldoen7qatlhh5pijic7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1501163414', ''),
(0, 'fqc4ofbcu16vun0ftmf0uoljv0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1501163675', ''),
(0, 'fqrtqrkv8cvjmptciunsu9hvg0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1501162492', ''),
(1, 'h2g2124bunl4ci8a0hh4gm5ra4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1528289966', 'cart_summ|i:0;cart_count|i:0;shop_view|a:2:{i:56;i:1;i:50;i:1;}'),
(0, 'j5dsu4gfd69s1rvlsm25iob484', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1500904088', ''),
(1, 'lvdae3g9sct0msgo5f9grvgvc3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1501162195', 'cart_summ|i:0;cart_count|i:0;group_action|a:5:{s:17:"shop/importexport";s:5:"trash";s:13:"shop/category";s:5:"trash";s:5:"trash";s:6:"delete";s:13:"shop/discount";s:5:"trash";s:10:"shop/param";s:5:"trash";}shop_view|a:3:{i:3;i:1;i:1;i:1;i:4;i:1;}'),
(0, 'ovs13h7v0fb589838h6dg2r7q3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1510833671', ''),
(0, 'pu4r7vd8h84h7d4ct3cerea9b6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1500639219', ''),
(1, 'qiuqnaaelk9d3i0njbnnvjkgf0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '1501163736', 'cart_summ|i:0;cart_count|i:0;');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_sessions_hash`
--

CREATE TABLE IF NOT EXISTS `diafan_sessions_hash` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `hash` char(32) NOT NULL DEFAULT '' COMMENT 'хеш',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания'
) ENGINE=InnoDB AUTO_INCREMENT=1305 DEFAULT CHARSET=utf8 COMMENT='Контрольные хэши авторизованных пользователей';

--
-- Dumping data for table `diafan_sessions_hash`
--

INSERT INTO `diafan_sessions_hash` (`id`, `user_id`, `hash`, `created`) VALUES
(1303, 1, '0223f81d4b1826a9daecc0c04e25c9f5', 1528286208),
(1304, 1, '2299741f2a4db7bd8dda840f0fa0823e', 1528289966);

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop`
--

CREATE TABLE IF NOT EXISTS `diafan_shop` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `article` varchar(30) NOT NULL DEFAULT '' COMMENT 'артикул',
  `measure_unit1` varchar(50) NOT NULL DEFAULT '' COMMENT 'единица измерения',
  `weight` varchar(50) NOT NULL DEFAULT '' COMMENT 'вес',
  `length` varchar(50) NOT NULL DEFAULT '' COMMENT 'длина',
  `width` varchar(50) NOT NULL DEFAULT '' COMMENT 'ширина',
  `height` varchar(50) NOT NULL DEFAULT '' COMMENT 'высота',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор основной категории из таблицы `diafan_shop_category`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `brand_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор производителя из таблицы `diafan_shop_brand`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `yandex` text COMMENT 'данные для выгрузки в Яндекс.Маркет',
  `show_yandex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выгружать в Яндекс.Маркет: 0 - нет, 1 - да (если в настройках выбрана выгрузка только выбранных товаров)',
  `no_buy` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'товар временно отсутствует: 0 - нет, 1 - да',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'товар только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор товара при импорте',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `counter_buy` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество покупок',
  `hit` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'хит: 0 - нет, 1 - да',
  `new` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'новинка: 0 - нет, 1 - да',
  `action` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'акция: 0 - нет, 1 - да',
  `is_file` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'это товар-файл: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший товар в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COMMENT='Товары';

--
-- Dumping data for table `diafan_shop`
--

INSERT INTO `diafan_shop` (`id`, `name1`, `act1`, `date_start`, `date_finish`, `article`, `measure_unit1`, `weight`, `length`, `width`, `height`, `map_no_show`, `changefreq`, `priority`, `noindex`, `cat_id`, `site_id`, `brand_id`, `keywords1`, `descr1`, `canonical1`, `title_meta1`, `anons1`, `anons_plus1`, `text1`, `yandex`, `show_yandex`, `no_buy`, `import`, `import_id`, `sort`, `timeedit`, `counter_buy`, `hit`, `new`, `action`, `is_file`, `access`, `admin_id`, `theme`, `view`, `trash`) VALUES
(50, 'Топас-С 4', '1', 0, 0, '', '', '0', '0', '0', '0', '0', 'always', '0', '0', 9, 18, 0, '', '', '', '', '<p>Топас-С 4 - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.</p>', '0', '', 'typePrefix=\nvendor=\nmodel=\nvendorCode=\nsales_notes=\nmanufacturer_warranty=\ncountry_of_origin=\nbid=\ncbid=', '0', '0', '0', '', 174, 1528274605, 0, '0', '0', '0', '0', '0', 1, '', '', '0'),
(51, 'Топас-С 4 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 9, 18, 0, '', NULL, '', '', 'Топас-С 4 пр - очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 173, 1510841447, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(52, 'ТОПАС-С 5', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 10, 18, 0, '', NULL, '', '', 'Топас-С 5 - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 172, 1510841448, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(53, 'ТОПАС-С 5 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 10, 18, 0, '', NULL, '', '', 'Топас-С 5 long - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Топас-С 5 long имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 171, 1510841449, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(54, 'ТОПАС-С 5 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 10, 18, 0, '', NULL, '', '', 'Топас-С 5 пр - очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 170, 1510841449, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(55, 'ТОПАС-С 5 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 10, 18, 0, '', NULL, '', '', 'Топас-С 5 long пр - локальное очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Топас-С 5 long пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 169, 1510841450, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(56, 'ТОПАС-С 6', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 11, 18, 0, '', NULL, '', '', 'Топас-С 6 - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 168, 1510841451, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(57, 'ТОПАС-С 6 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 11, 18, 0, '', NULL, '', '', 'Топас-С 6 long - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Топас-С 6 long имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 167, 1510841452, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(58, 'ТОПАС-С 6 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 11, 18, 0, '', NULL, '', '', 'Топас-С 6 пр - очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 166, 1510841452, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(59, 'ТОПАС-С 6 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 11, 18, 0, '', NULL, '', '', 'Топас-С 6 long пр - локальное очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Топас-С 6 long пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 165, 1510841453, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(60, 'ТОПАС-С 8', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 33, 18, 0, '', NULL, '', '', 'Топас-С 8 - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 164, 1510841454, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(61, 'ТОПАС-С 8 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 33, 18, 0, '', NULL, '', '', 'Топас-С 8 long - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Топас-С 8 long имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 163, 1510841454, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(62, 'ТОПАС-С 8 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 33, 18, 0, '', NULL, '', '', 'Топас-С 8 пр - очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 162, 1510841455, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(63, 'ТОПАС-С 8 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 33, 18, 0, '', NULL, '', '', 'Топас-С 8 long пр - локальное очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Топас-С 8 long пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 161, 1510841456, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(64, 'ТОПАС-С 8 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 33, 18, 0, '', NULL, '', '', 'Топас-С 8 long УС - локальное очистное сооружение с усиленным корпусом, 1 компрессором и электромагнитным клапаном. Топас-С 8 long УС имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 160, 1510841457, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(65, 'ТОПАС-С 8 LONG УС ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 33, 18, 0, '', NULL, '', '', 'Топас-С 8 long УС пр - локальное очистное сооружение с принудительным выбросом и усиленным корпусом, 1 компрессором и электромагнитным клапаном. Топас-С 8 long УС пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 159, 1510841458, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(66, 'ТОПАС-С 9', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 34, 18, 0, '', NULL, '', '', 'Топас-С 9 - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 158, 1510841459, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(67, 'ТОПАС-С 9 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 34, 18, 0, '', NULL, '', '', 'Топас-С 9 long - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Топас-С 9 long имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 157, 1510841460, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(68, 'ТОПАС-С 9 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 34, 18, 0, '', NULL, '', '', 'Топас-С 9 long УС - локальное очистное сооружение с усиленным корпусом, 1 компрессором и электромагнитным клапаном. Топас-С 9 long УС имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 156, 1510841460, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(69, 'ТОПАС-С 9 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 34, 18, 0, '', NULL, '', '', 'Топас-С 9 пр - очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 155, 1510841461, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(70, 'ТОПАС-С 9 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 34, 18, 0, '', NULL, '', '', 'Топас-С 9 long пр - локальное очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Топас-С 9 long пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 154, 1510841462, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(71, 'ТОПАС-С 9 LONG УС ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 34, 18, 0, '', NULL, '', '', 'Топас-С 9 long УС пр - локальное очистное сооружение с принудительным выбросом и усиленным корпусом, 1 компрессором и электромагнитным клапаном. Топас-С 9 long УС пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 153, 1510841463, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(72, 'ТОПАС-С 10', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 35, 18, 0, '', NULL, '', '', 'Топас-С 10 - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 152, 1510841463, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(73, 'ТОПАС-С 10 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 35, 18, 0, '', NULL, '', '', 'Топас-С 10 long - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Топас-С 10 long имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 151, 1510841464, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(74, 'ТОПАС-С 10 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 35, 18, 0, '', NULL, '', '', 'Топас-С 10 long УС - локальное очистное сооружение с усиленным корпусом, 1 компрессором и электромагнитным клапаном. Топас-С 10 long УС имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 150, 1510841465, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(75, 'ТОПАС-С 10 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 35, 18, 0, '', NULL, '', '', 'Топас-С 10 пр - очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 149, 1510841465, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(76, 'ТОПАС-С 10 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 35, 18, 0, '', NULL, '', '', 'Топас-С 10 long пр - локальное очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Топас-С 10 long пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 148, 1510841466, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(77, 'ТОПАС-С 10 LONG УС ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 35, 18, 0, '', NULL, '', '', 'Топас-С 10 long УС пр - локальное очистное сооружение с принудительным выбросом и усиленным корпусом, 1 компрессором и электромагнитным клапаном. Топас-С 10 long УС пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 147, 1510841467, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(78, 'ТОПАС-С 12', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 36, 18, 0, '', NULL, '', '', 'Топас-С 12 - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 146, 1510841467, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(79, 'ТОПАС-С 12 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 36, 18, 0, '', NULL, '', '', 'Топас-С 12 пр - очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 145, 1510841468, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(80, 'ТОПАС-С 12 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 36, 18, 0, '', NULL, '', '', 'Топас-С 12 long УС - локальное очистное сооружение с усиленным корпусом, 1 компрессором и электромагнитным клапаном. Топас-С 12 long УС имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 144, 1510841469, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(81, 'ТОПАС-С 12 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 36, 18, 0, '', NULL, '', '', 'Топас-С 12 long - локальное очистное сооружение с 1 компрессором и электромагнитным клапаном. Топас-С 12 long имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 143, 1510841469, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(82, 'ТОПАС-С 12 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 36, 18, 0, '', NULL, '', '', 'Топас-С 12 long пр - локальное очистное сооружение с принудительным выбросом с 1 компрессором и электромагнитным клапаном. Топас-С 12 long пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 142, 1510841470, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(83, 'ТОПАС-С 12 LONG ПР УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 36, 18, 0, '', NULL, '', '', 'Топас-С 12 long УС пр - локальное очистное сооружение с принудительным выбросом и усиленным корпусом, 1 компрессором и электромагнитным клапаном. Топас-С 12 long УС пр имеет удлиненную горловину. Гарантия от производителя - 2 года.', '0', NULL, NULL, '0', '0', '0', '', 141, 1510841471, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(84, 'ТОПАС 4', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 13, 18, 0, '', NULL, '', '', 'Топас 4 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 140, 1510841471, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(85, 'ТОПАС 4 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 13, 18, 0, '', NULL, '', '', 'Топас 4 - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 139, 1510841471, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(86, 'ТОПАС 5', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 14, 18, 0, '', NULL, '', '', 'Топас 5 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 138, 1510841472, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(87, 'ТОПАС 5 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 14, 18, 0, '', NULL, '', '', 'Топас 5 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. Топас 5 long имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 137, 1510841473, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(88, 'ТОПАС 5 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 14, 18, 0, '', NULL, '', '', 'Топас 5 - очистное сооружение с принудительным выбросом. Используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 136, 1510841473, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(89, 'ТОПАС 5 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 14, 18, 0, '', NULL, '', '', 'Топас 5 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков. Топас 5 long пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 135, 1510841474, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(90, 'ТОПАС 6', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 21, 18, 0, '', NULL, '', '', 'Топас 6 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 134, 1510841475, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(91, 'ТОПАС 6 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 21, 18, 0, '', NULL, '', '', 'Топас 6 - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 133, 1510841476, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(92, 'ТОПАС 6 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 21, 18, 0, '', NULL, '', '', 'Топас 6 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. Топас 6 long имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 132, 1510841476, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(93, 'ТОПАС 6 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 21, 18, 0, '', NULL, '', '', 'Топас 6 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков. Топас 6 long пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 131, 1510841477, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(94, 'ТОПАС 8', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 22, 18, 0, '', NULL, '', '', 'Топас 8 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 130, 1510841478, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(95, 'ТОПАС 8 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 22, 18, 0, '', NULL, '', '', 'Топас 8 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. Топас 8 long имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 129, 1510841479, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(96, 'ТОПАС 8 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 22, 18, 0, '', NULL, '', '', 'Топас 8 - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 128, 1510841479, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(97, 'ТОПАС 8 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 22, 18, 0, '', NULL, '', '', 'Топас 8 long УС - локальное очистное сооружение с усиленным корпусом. Топас 8 long УС имеет удлиненную горловину и устанавливается при глубоком залегании канализационной трубы. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 127, 1510841480, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(98, 'ТОПАС 8 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 22, 18, 0, '', NULL, '', '', 'Топас 8 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков. Топас 8 long пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 126, 1510841481, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(99, 'ТОПАС 8 LONG УС ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 22, 18, 0, '', NULL, '', '', 'Топас 8 long УС пр - локальное очистное сооружение с принудительным выбросом очищенных стоков и усиленным корпусом. Топас 8 long УС пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 125, 1510841481, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(100, 'ТОПАС 9', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 50, 18, 0, '', NULL, '', '', 'Топас 9 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 124, 1510841482, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(101, 'ТОПАС 9 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 50, 18, 0, '', NULL, '', '', 'Топас 9 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. Топас 9 long имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 123, 1510841483, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(102, 'ТОПАС 9 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 50, 18, 0, '', NULL, '', '', 'Топас 9 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 122, 1510841483, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(103, 'ТОПАС 9 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 50, 18, 0, '', NULL, '', '', 'Топас 9 long УС - локальное очистное сооружение с усиленным корпусом. Топас 9 long УС имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 121, 1510841484, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(104, 'ТОПАС 9 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 50, 18, 0, '', NULL, '', '', 'Топас 9 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков. Топас 9 long пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 120, 1510841485, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(105, 'ТОПАС 9 LONG ПР УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 50, 18, 0, '', NULL, '', '', 'Топас 9 long УС пр - локальное очистное сооружение с принудительным выбросом очищенных стоков и усиленным корпусом. Топас 9 long УС пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 119, 1510841485, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(106, 'ТОПАС 10', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 23, 18, 0, '', NULL, '', '', 'Топас 10 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 118, 1510841486, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(107, 'ТОПАС 10 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 23, 18, 0, '', NULL, '', '', 'Топас 10 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 117, 1510841487, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(108, 'ТОПАС 10 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 23, 18, 0, '', NULL, '', '', 'Топас 10 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. Топас 10 long имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 116, 1510841487, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(109, 'ТОПАС 10 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 23, 18, 0, '', NULL, '', '', 'Топас 10 long УС - локальное очистное сооружение с усиленным корпусом. Топас 10 long УС имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 115, 1510841488, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(110, 'ТОПАС 10 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 23, 18, 0, '', NULL, '', '', 'Топас 10 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков. Топас 10 long пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 114, 1510841489, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(111, 'ТОПАС 10 LONG ПР УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 23, 18, 0, '', NULL, '', '', 'Топас 10 long УС пр - локальное очистное сооружение с принудительным выбросом очищенных стоков и усиленным корпусом. Топас 10 long УС пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 113, 1510841489, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(112, 'ТОПАС 12', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 24, 18, 0, '', NULL, '', '', 'Топас 12 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 112, 1510841490, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(113, 'ТОПАС 12 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 24, 18, 0, '', NULL, '', '', 'Топас 12 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. Топас 12 long имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 111, 1510841491, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(114, 'ТОПАС 12 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 24, 18, 0, '', NULL, '', '', 'Топас 12 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 110, 1510841492, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(115, 'ТОПАС 12 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 24, 18, 0, '', NULL, '', '', 'Топас 12 long УС - локальное очистное сооружение с усиленным корпусом. Топас 12 long УС имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 109, 1510841493, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(116, 'ТОПАС 12 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 24, 18, 0, '', NULL, '', '', 'Топас 12 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков. Топас 12 long пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 108, 1510841493, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(117, 'ТОПАС 12 LONG ПР УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 24, 18, 0, '', NULL, '', '', 'Топас 12 long УС пр - локальное очистное сооружение с принудительным выбросом очищенных стоков и усиленным корпусом. Топас 12 long УС пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 107, 1510841494, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(118, 'ТОПАС 15 LONG ПР УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 25, 18, 0, '', NULL, '', '', 'Топас 15 long УС пр - локальное очистное сооружение с принудительным выбросом очищенных стоков и усиленным корпусом. Топас 15 long УС пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 105, 1510841495, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(119, 'ТОПАС 15 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 25, 18, 0, '', NULL, '', '', 'Топас 15 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 104, 1510841496, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(120, 'ТОПАС 15 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 25, 18, 0, '', NULL, '', '', 'Топас 15 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. Топас 15 long имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 103, 1510841498, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(121, 'ТОПАС 15', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 25, 18, 0, '', NULL, '', '', 'Топас 15 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 106, 1510841499, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(122, 'ТОПАС 15 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 25, 18, 0, '', NULL, '', '', 'Топас 15 long УС - локальное очистное сооружение с усиленным корпусом. Топас 15 long УС имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 102, 1510841500, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(123, 'ТОПАС 15 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 25, 18, 0, '', NULL, '', '', 'Топас 15 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков. Топас 15 long пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 101, 1510841501, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(124, 'ТОПАС 20', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 26, 18, 0, '', NULL, '', '', 'Топас 20 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 100, 1510841503, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(125, 'ТОПАС 20 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 26, 18, 0, '', NULL, '', '', 'Топас 20 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков. Топас 20 long пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 99, 1510841504, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(126, 'ТОПАС 20 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 26, 18, 0, '', NULL, '', '', 'Топас 20 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 98, 1510841505, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(127, 'ТОПАС 20 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 26, 18, 0, '', NULL, '', '', 'Топас 20 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. Топас 20 long имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 97, 1510841506, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(128, 'ТОПАС 30', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 27, 18, 0, '', NULL, '', '', 'Топас 30 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 96, 1510841507, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(129, 'ТОПАС 30 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 27, 18, 0, '', NULL, '', '', 'Топас 30 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков. Топас 30 long пр имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 95, 1510841508, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(130, 'ТОПАС 30 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 27, 18, 0, '', NULL, '', '', 'Топас 30 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. Топас 30 long имеет удлиненную горловину. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 94, 1510841509, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(131, 'ТОПАС 30 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 27, 18, 0, '', NULL, '', '', 'Топас 30 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 93, 1510841510, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(132, 'ТОПАС 40 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 28, 18, 0, '', NULL, '', '', 'Топас 40 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 91, 1510841511, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(133, 'ТОПАС 40', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 28, 18, 0, '', NULL, '', '', 'Топас 40 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 92, 1510841511, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(134, 'ТОПАС 50 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 29, 18, 0, '', NULL, '', '', 'Топас 50 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 89, 1510841512, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(135, 'ТОПАС 50', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 29, 18, 0, '', NULL, '', '', 'Топас 50 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 90, 1510841513, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(136, 'ТОПАС 75 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 30, 18, 0, '', NULL, '', '', 'Топас 75 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 87, 1510841514, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(137, 'ТОПАС 75', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 30, 18, 0, '', NULL, '', '', 'Топас 75 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года', '0', NULL, NULL, '0', '0', '0', '', 88, 1510841515, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(138, 'ТОПАС 100', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 31, 18, 0, '', NULL, '', '', 'Топас 100 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года', '0', NULL, NULL, '0', '0', '0', '', 86, 1510841516, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(139, 'ТОПАС 100 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 31, 18, 0, '', NULL, '', '', 'Топас 100 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 85, 1510841517, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(140, 'ТОПАС 150 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 32, 18, 0, '', NULL, '', '', 'Топас 150 пр - очистное сооружение с принудительным выбросом. Система используется для загородных участков, которые не имеют подключения к центральной канализации. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 84, 1510841518, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(141, 'ТОПАС 150', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 32, 18, 0, '', NULL, '', '', 'Топас 150 - локальное очистное сооружение, которое оптимально подойдёт для загородных домов. Данная система не требует вызова ассенизационной машины. Расширенная гарантия от производителя - 3 года.', '0', NULL, NULL, '0', '0', '0', '', 83, 1510841519, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(142, 'ТОПАЭРО 3', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 37, 18, 0, '', NULL, '', '', 'ТОПАЭРО 3 - локальное очистное сооружение, способное принимать увеличенный объем залпового сброса сточных вод. Данная система не требует вызова ассенизационной машины.', '0', NULL, NULL, '0', '0', '0', '', 82, 1510841520, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(143, 'ТОПАЭРО 3 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 37, 18, 0, '', NULL, '', '', 'ТОПАЭРО 3 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. ТОПАЭРО 3 long имеет удлиненную горловину и устанавливается при глубоком залегании канализационной трубы.', '0', NULL, NULL, '0', '0', '0', '', 81, 1510841522, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(144, 'ТОПАЭРО 3 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 37, 18, 0, '', NULL, '', '', 'ТОПАЭРО 3 пр - очистное сооружение с принудительным выбросом и возможностью приема значительного объема залпового сброса сточных вод. ТОПАЭРО 3 пр рассчитан на очистку стоков в домах, где проживает не более 15 человек.', '0', NULL, NULL, '0', '0', '0', '', 80, 1510841524, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(145, 'ТОПАЭРО 3 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 37, 18, 0, '', NULL, '', '', 'ТОПАЭРО 3 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков и отстойником ила коридорного типа. ТОПАЭРО 3 long пр имеет удлиненную горловину и устанавливается при глубоком залегании канализационной трубы.', '0', NULL, NULL, '0', '0', '0', '', 79, 1510841525, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(146, 'ТОПАЭРО 3 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 37, 18, 0, '', NULL, '', '', 'ТОПАЭРО 3 long УС - локальное очистное сооружение с усиленным корпусом, отстойником ила коридорного типа и возможностью приема увеличенного объема сточных вод. ТОПАЭРО 3 long УС имеет удлиненную горловину и устанавливается при глубоком залегании трубы.', '0', NULL, NULL, '0', '0', '0', '', 78, 1510841526, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(147, 'ТОПАЭРО 3 LONG ПР УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 37, 18, 0, '', NULL, '', '', 'ТОПАЭРО 3 long УС пр - локальное очистное сооружение с принудительным выбросом очищенных стоков, отстойником ила коридорного типа и усиленным корпусом. ТОПАЭРО 3 long УС пр имеет удлиненную горловину и устанавливается при глубоком залегании трубы.', '0', NULL, NULL, '0', '0', '0', '', 77, 1510841528, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(148, 'ТОПАЭРО 4', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 38, 18, 0, '', NULL, '', '', 'ТОПАЭРО 4 - локальное очистное сооружение, способное принимать увеличенный объем залпового сброса сточных вод. Данная система не требует вызова ассенизационной машины.', '0', NULL, NULL, '0', '0', '0', '', 76, 1510841529, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(149, 'ТОПАЭРО 4 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 38, 18, 0, '', NULL, '', '', 'ТОПАЭРО 4 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. ТОПАЭРО 4 long имеет удлиненную горловину и устанавливается при глубоком залегании канализационной трубы.', '0', NULL, NULL, '0', '0', '0', '', 75, 1510841530, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(150, 'ТОПАЭРО 4 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 38, 18, 0, '', NULL, '', '', 'ТОПАЭРО 4 пр - очистное сооружение с принудительным выбросом и возможностью приема значительного объема залпового сброса сточных вод. ТОПАЭРО 4 пр рассчитан на очистку стоков в домах, где проживает не более 20 человек.', '0', NULL, NULL, '0', '0', '0', '', 74, 1510841531, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(151, 'ТОПАЭРО 4 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 38, 18, 0, '', NULL, '', '', 'ТОПАЭРО 4 long УС - локальное очистное сооружение с усиленным корпусом, отстойником ила коридорного типа и возможностью приема увеличенного объема сточных вод. ТОПАЭРО 4 long УС имеет удлиненную горловину и устанавливается при глубоком залегании трубы.', '0', NULL, NULL, '0', '0', '0', '', 73, 1510841531, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(152, 'ТОПАЭРО 4 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 38, 18, 0, '', NULL, '', '', 'ТОПАЭРО 4 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков и отстойником ила коридорного типа. ТОПАЭРО 4 long пр имеет удлиненную горловину и устанавливается при глубоком залегании канализационной трубы.', '0', NULL, NULL, '0', '0', '0', '', 72, 1510841532, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(153, 'ТОПАЭРО 4 LONG ПР УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 38, 18, 0, '', NULL, '', '', 'ТОПАЭРО 4 long УС пр - локальное очистное сооружение с принудительным выбросом очищенных стоков, отстойником ила коридорного типа и усиленным корпусом. ТОПАЭРО 4 long УС пр имеет удлиненную горловину и устанавливается при глубоком залегании трубы.', '0', NULL, NULL, '0', '0', '0', '', 71, 1510841533, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(154, 'ТОПАЭРО 6', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 39, 18, 0, '', NULL, '', '', 'ТОПАЭРО 6 - локальное очистное сооружение, способное принимать увеличенный объем залпового сброса сточных вод. Данная система не требует вызова ассенизационной машины.', '0', NULL, NULL, '0', '0', '0', '', 70, 1510841534, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(155, 'ТОПАЭРО 6 LONG', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 39, 18, 0, '', NULL, '', '', 'ТОПАЭРО 6 long - локальное очистное сооружение, которое оптимально подойдёт для загородных участков без центральной канализации. ТОПАЭРО 6 long имеет удлиненную горловину и устанавливается при глубоком залегании канализационной трубы.', '0', NULL, NULL, '0', '0', '0', '', 69, 1510841535, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(156, 'ТОПАЭРО 6 LONG УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 39, 18, 0, '', NULL, '', '', 'ТОПАЭРО 6 long пр - локальное очистное сооружение с принудительным выбросом очищенных стоков и отстойником ила коридорного типа. ТОПАЭРО 6 long пр имеет удлиненную горловину и устанавливается при глубоком залегании трубы.', '0', NULL, NULL, '0', '0', '0', '', 68, 1510841536, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(157, 'ТОПАЭРО 6 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 39, 18, 0, '', NULL, '', '', 'ТОПАЭРО 6 пр - очистное сооружение с принудительным выбросом и возможностью приема значительного объема залпового сброса сточных вод. ТОПАЭРО 6 пр рассчитан на очистку стоков в домах, где проживает 30 человек.', '0', NULL, NULL, '0', '0', '0', '', 67, 1510841536, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(158, 'ТОПАЭРО 6 LONG ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 39, 18, 0, '', NULL, '', '', 'ТОПАЭРО 6 long УС - локальное очистное сооружение с усиленным корпусом, отстойником ила коридорного типа и возможностью приема увеличенного объема сточных вод. ТОПАЭРО 6 long УС имеет удлиненную горловину и устанавливается при глубоком залегании канализац', '0', NULL, NULL, '0', '0', '0', '', 66, 1510841537, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(159, 'ТОПАЭРО 6 LONG ПР УС', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 39, 18, 0, '', NULL, '', '', 'ТОПАЭРО 6 long УС пр - локальное очистное сооружение с принудительным выбросом очищенных стоков, отстойником ила коридорного типа и усиленным корпусом. ТОПАЭРО 6 long УС пр имеет удлиненную горловину и устанавливается при глубоком залегании трубы.', '0', NULL, NULL, '0', '0', '0', '', 65, 1510841538, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(160, 'ТОПАЭРО 7', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 40, 18, 0, '', NULL, '', '', 'ТОПАЭРО 7 - локальное очистное сооружение, способное принимать увеличенный объем залпового сброса сточных вод. Данная система не требует вызова ассенизационной машины.', '0', NULL, NULL, '0', '0', '0', '', 64, 1510841539, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(161, 'ТОПАЭРО 7 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 40, 18, 0, '', NULL, '', '', 'ТОПАЭРО 7 пр - очистное сооружение с принудительным выбросом и возможностью приема значительного объема залпового сброса сточных вод. ТОПАЭРО 7 пр рассчитан на очистку стоков в домах, где проживает 40 человек.', '0', NULL, NULL, '0', '0', '0', '', 63, 1510841540, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(162, 'ТОПАЭРО 9', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 41, 18, 0, '', NULL, '', '', 'ТОПАЭРО 9 - локальное очистное сооружение, способное принимать увеличенный объем залпового сброса сточных вод. Данная система не требует вызова ассенизационной машины.', '0', NULL, NULL, '0', '0', '0', '', 62, 1510841541, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(163, 'ТОПАЭРО 9 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 41, 18, 0, '', NULL, '', '', 'ТОПАЭРО 9 пр - очистное сооружение с принудительным выбросом и возможностью приема значительного объема залпового сброса сточных вод. ТОПАЭРО 9 пр рассчитан на очистку стоков в домах, где проживает 50 человек.', '0', NULL, NULL, '0', '0', '0', '', 61, 1510841542, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(164, 'ТОПАЭРО 12', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 42, 18, 0, '', NULL, '', '', 'ТОПАЭРО 12 - локальное очистное сооружение, способное принимать увеличенный объем залпового сброса сточных вод. Данная система не требует вызова ассенизационной машины.', '0', NULL, NULL, '0', '0', '0', '', 60, 1510841543, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(165, 'ТОПАЭРО 12 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 42, 18, 0, '', NULL, '', '', 'ТОПАЭРО 12 пр - очистное сооружение с принудительным выбросом и возможностью приема значительного объема залпового сброса сточных вод. ТОПАЭРО 12 пр рассчитан на очистку стоков в домах, где проживает 75 человек.', '0', NULL, NULL, '0', '0', '0', '', 59, 1510841544, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(166, 'ТОПАЭРО 16', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 43, 18, 0, '', NULL, '', '', 'ТОПАЭРО 16 - локальное очистное сооружение, способное принимать увеличенный объем залпового сброса сточных вод. Данная система не требует вызова ассенизационной машины.', '0', NULL, NULL, '0', '0', '0', '', 58, 1510841544, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(167, 'ТОПАЭРО 16 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 43, 18, 0, '', NULL, '', '', 'ТОПАЭРО 16 пр - очистное сооружение с принудительным выбросом и возможностью приема значительного объема залпового сброса сточных вод. ТОПАЭРО 16 пр рассчитан на очистку стоков в домах, где проживает 100 человек.', '0', NULL, NULL, '0', '0', '0', '', 57, 1510841545, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(168, 'ТОПАЭРО 24', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 44, 18, 0, '', NULL, '', '', 'ТОПАЭРО 24 - локальное очистное сооружение, способное принимать увеличенный объем залпового сброса сточных вод. Данная система не требует вызова ассенизационной машины.', '0', NULL, NULL, '0', '0', '0', '', 56, 1510841546, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(169, 'ТОПАЭРО 24 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 44, 18, 0, '', NULL, '', '', 'ТОПАЭРО 24 пр - очистное сооружение с принудительным выбросом и возможностью приема значительного объема залпового сброса сточных вод. ТОПАЭРО 24 пр рассчитан на очистку стоков в домах, где проживает 150 человек.', '0', NULL, NULL, '0', '0', '0', '', 55, 1510841547, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(170, 'ТОПАЭРО 32', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 45, 18, 0, '', NULL, '', '', 'ТОПАЭРО 32 - локальное очистное сооружение, способное принимать увеличенный объем залпового сброса сточных вод. Данная система не требует вызова ассенизационной машины.', '0', NULL, NULL, '0', '0', '0', '', 54, 1510841548, 0, '0', '0', '0', '0', '0', 0, '', '', '0');
INSERT INTO `diafan_shop` (`id`, `name1`, `act1`, `date_start`, `date_finish`, `article`, `measure_unit1`, `weight`, `length`, `width`, `height`, `map_no_show`, `changefreq`, `priority`, `noindex`, `cat_id`, `site_id`, `brand_id`, `keywords1`, `descr1`, `canonical1`, `title_meta1`, `anons1`, `anons_plus1`, `text1`, `yandex`, `show_yandex`, `no_buy`, `import`, `import_id`, `sort`, `timeedit`, `counter_buy`, `hit`, `new`, `action`, `is_file`, `access`, `admin_id`, `theme`, `view`, `trash`) VALUES
(171, 'ТОПАЭРО 32 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 45, 18, 0, '', NULL, '', '', 'ТОПАЭРО 32 пр - очистное сооружение с принудительным выбросом и возможностью приема значительного объема залпового сброса сточных вод. ТОПАЭРО 32 пр рассчитан на очистку стоков в домах, где проживает 200 человек.', '0', NULL, NULL, '0', '0', '0', '', 53, 1510841549, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(172, 'ТОПБИО', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 46, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 52, 1510841550, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(173, 'Евролос Удача', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 12, 18, 0, '', NULL, '', '', 'Универсальный компактный сезонный септик для дачи с различными вариантами монтажа', '0', NULL, NULL, '0', '0', '0', '', 51, 1510841550, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(174, 'Евролос Эко', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 250, 18, 0, '', NULL, '', '', 'Энергонезависимый септик с простым устройством, подходит для песчаных грунтов с низким уровнем грунтовых вод.', '0', NULL, NULL, '0', '0', '0', '', 50, 1510841550, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(175, 'Евролос Эко 0,6', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 251, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 49, 1510841551, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(176, 'Евролос Эко 0,8', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 252, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 48, 1510841551, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(177, 'Евролос Эко 1', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 253, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 47, 1510841551, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(178, 'Евролос Эко 1,5', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 254, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 46, 1510841552, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(179, 'Евролос Эко 2,4', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 255, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 45, 1510841552, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(180, 'Евролос Эко 3', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 256, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 44, 1510841552, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(181, 'Евролос Эко 4', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 257, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 43, 1510841552, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(182, 'Евролос БИО 3', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 258, 18, 0, '', NULL, '', '', 'Насосная автономная станция очистки бытовых стоков для загородного участка с сезонным или постоянным проживанием.', '0', NULL, NULL, '0', '0', '0', '', 42, 1510841553, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(183, 'Евролос БИО 4', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 259, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 41, 1510841553, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(184, 'Евролос БИО 5', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 260, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 40, 1510841553, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(185, 'Евролос БИО 6', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 261, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 39, 1510841553, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(186, 'Евролос БИО 8', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 262, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 38, 1510841553, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(187, 'Евролос БИО 10', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 263, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 37, 1510841554, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(188, 'Евролос БИО 12', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 264, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 36, 1510841554, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(189, 'Евролос БИО 15', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 265, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 35, 1510841554, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(190, 'Евролос БИО 20', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 266, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 34, 1510841554, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(191, 'Евролос ПРО 3', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 267, 18, 0, '', NULL, '', '', 'Компрессорная установка глубокой биологической очистки для автономной канализации в частном доме ПМЖ проживания.', '0', NULL, NULL, '0', '0', '0', '', 24, 1510841556, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(192, 'Евролос ПРО 4', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 268, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 23, 1510841556, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(193, 'Евролос ПРО 5', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 269, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 22, 1510841557, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(194, 'Евролос ПРО 6', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 270, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 21, 1510841557, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(195, 'Евролос ПРО 8', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 271, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 20, 1510841557, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(196, 'Евролос ПРО 10', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 272, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 19, 1510841557, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(197, 'Евролос ПРО 12', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 273, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 18, 1510841557, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(198, 'Евролос ПРО 15', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 274, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 17, 1510841557, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(199, 'Евролос ПРО 20', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 275, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 16, 1510841558, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(200, 'Евролос ПРО 25', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 276, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 15, 1510841558, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(201, 'Евролос ПРО 30', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 277, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 14, 1510841558, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(202, 'Евролос БИО 3 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 258, 18, 0, '', NULL, '', '', 'Насосная автономная станция очистки бытовых стоков для загородного участка с сезонным или постоянным проживанием.', '0', NULL, NULL, '0', '0', '0', '', 33, 1510841555, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(203, 'Евролос БИО 4 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 259, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 32, 1510841555, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(204, 'Евролос БИО 5 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 260, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 31, 1510841555, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(205, 'Евролос БИО 6 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 261, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 30, 1510841555, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(206, 'Евролос БИО 8 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 262, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 29, 1510841555, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(207, 'Евролос БИО 10 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 263, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 28, 1510841556, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(208, 'Евролос БИО 12 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 264, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 27, 1510841556, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(209, 'Евролос БИО 15 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 265, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 26, 1510841556, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(210, 'Евролос БИО 20 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 266, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 25, 1510841556, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(211, 'Евролос ПРО 3 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 267, 18, 0, '', NULL, '', '', 'Компрессорная установка глубокой биологической очистки для автономной канализации в частном доме ПМЖ проживания.', '0', NULL, NULL, '0', '0', '0', '', 13, 1510841558, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(212, 'Евролос ПРО 4 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 268, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 12, 1510841559, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(213, 'Евролос ПРО 5 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 269, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 11, 1510841559, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(214, 'Евролос ПРО 6 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 270, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 10, 1510841559, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(215, 'Евролос ПРО 8 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 271, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 9, 1510841559, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(216, 'Евролос ПРО 10 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 272, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 8, 1510841560, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(217, 'Евролос ПРО 12 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 273, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 7, 1510841560, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(218, 'Евролос ПРО 15 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 274, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 6, 1510841560, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(219, 'Евролос ПРО 20 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 275, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 5, 1510841560, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(220, 'Евролос ПРО 25 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 276, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 4, 1510841560, 0, '0', '0', '0', '0', '0', 0, '', '', '0'),
(221, 'Евролос ПРО 30 ПР', '1', 0, 0, '', '', '', '', '', '', '0', 'always', '', '0', 277, 18, 0, '', NULL, '', '', '', '0', NULL, NULL, '0', '0', '0', '', 3, 1510841561, 0, '0', '0', '0', '0', '0', 0, '', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_additional_cost`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_additional_cost` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text COMMENT 'описание',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `shop_rel` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'связана с товаром: 0 - нет, 1 - да',
  `percent` double NOT NULL DEFAULT '0' COMMENT 'процент от стоимости товаров в корзине',
  `price` double NOT NULL DEFAULT '0' COMMENT 'цена',
  `amount` double NOT NULL DEFAULT '0' COMMENT 'бесплатно от',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'всегда включено в цену: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сопутствующие услуги';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_additional_cost_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_additional_cost_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `element_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор сопутствующей услуги из таблицы `diafan_shop_additional_cost`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связь сопутствующих услуг и категорий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_additional_cost_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_additional_cost_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `additional_cost_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор сопутствующей услуги из таблицы `diafan_shop_additional_cost`',
  `summ` double NOT NULL DEFAULT '0' COMMENT 'сумма',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связь сопутствующих услуг и товаров';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_brand`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_brand` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `text1` text COMMENT 'описание',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'производитель только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор производителя при импорте',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший производителя в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Бренды';

--
-- Dumping data for table `diafan_shop_brand`
--

INSERT INTO `diafan_shop_brand` (`id`, `name1`, `act1`, `map_no_show`, `changefreq`, `priority`, `noindex`, `site_id`, `keywords1`, `descr1`, `canonical1`, `title_meta1`, `text1`, `import`, `import_id`, `sort`, `timeedit`, `admin_id`, `theme`, `view`, `trash`) VALUES
(1, 'Фирма А', '1', '0', 'always', '', '0', 18, '', NULL, '', '', NULL, '0', '', 1, 1500639157, 0, '', '', '0'),
(2, 'Топас', '1', '0', 'monthly', '0', '0', 18, '', '', '', '', '', '0', '', 2, 1500904666, 1, '', '', '0'),
(3, 'Евролос', '1', '0', 'monthly', '0', '0', 18, '', '', '', '', '', '0', '', 3, 1500904673, 1, '', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_brand_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_brand_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор производителя из таблицы `diafan_shop_brand`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan__category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Связи производителей и категорий';

--
-- Dumping data for table `diafan_shop_brand_category_rel`
--

INSERT INTO `diafan_shop_brand_category_rel` (`id`, `element_id`, `cat_id`, `trash`) VALUES
(1, 1, 0, '0'),
(2, 2, 0, '0'),
(3, 3, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_cart`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_cart` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `good_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `price_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор цены товара - поле price_id из таблицы `diafan_shop_price`',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `count` double NOT NULL DEFAULT '0' COMMENT 'количество товара',
  `param` text COMMENT 'серилизованные данные о характеристиках товара (доступных к выбору при заказе)',
  `additional_cost` text COMMENT 'идентификаторы сопутствующих услугах, разделенные запятой',
  `is_file` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'товар-файл: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в корзине';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_category`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_shop_category`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных категорий',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `show_yandex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выгружать в Яндекс.Маркет: 0 - нет, 1 - да (если в настройках выбрана выгрузка только выбранных категорий)',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'категория только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор категории при импорте',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COMMENT='Категории товаров';

--
-- Dumping data for table `diafan_shop_category`
--

INSERT INTO `diafan_shop_category` (`id`, `name1`, `act1`, `map_no_show`, `changefreq`, `priority`, `noindex`, `parent_id`, `count_children`, `site_id`, `keywords1`, `descr1`, `canonical1`, `title_meta1`, `anons1`, `anons_plus1`, `text1`, `show_yandex`, `import`, `import_id`, `sort`, `timeedit`, `access`, `admin_id`, `theme`, `view`, `view_element`, `trash`) VALUES
(6, 'ТОПАС-С', '1', '0', 'always', '', '0', 0, 7, 18, '', NULL, '', '', '', '0', NULL, '0', '1', '', 6, 1510907109, '0', 0, '', '', '', '0'),
(7, 'ТОПАС', '1', '0', 'always', '', '0', 0, 15, 18, '', NULL, '', '', '', '0', NULL, '0', '1', '', 7, 1510907109, '0', 0, '', '', '', '0'),
(9, 'ТОПАС-С 4', '1', '0', 'always', '', '0', 6, 0, 18, '', NULL, '', '', '84 210 РУБ.', '0', NULL, '0', '1', '', 9, 1510907109, '0', 0, '', '', '', '0'),
(10, 'ТОПАС-С 5', '1', '0', 'always', '', '0', 6, 0, 18, '', NULL, '', '', '94 185 РУБ.', '0', NULL, '0', '1', '', 10, 1510907109, '0', 0, '', '', '', '0'),
(11, 'ТОПАС-С 6', '1', '0', 'always', '', '0', 6, 0, 18, '', NULL, '', '', '101 430 РУБ.', '0', NULL, '0', '1', '', 11, 1510907109, '0', 0, '', '', '', '0'),
(12, 'ЕВРОЛОС УДАЧА', '0', '0', 'always', '', '0', 17, 0, 18, '', NULL, '', '', '27 300 РУБ.', '0', NULL, '0', '1', '', 12, 1510907112, '0', 0, '', '', '', '0'),
(13, 'ТОПАС 4', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '95 760 РУБ.', '0', NULL, '0', '1', '', 13, 1510907110, '0', 0, '', '', '', '0'),
(14, 'ТОПАС 5', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '108 045 РУБ.', '0', NULL, '0', '1', '', 14, 1510907110, '0', 0, '', '', '', '0'),
(15, 'ТОПАЭРО', '1', '0', 'always', '', '0', 0, 9, 18, '', NULL, '', '', '', '0', NULL, '0', '1', '', 15, 1510907109, '0', 0, '', '', '', '0'),
(16, 'ТОПБИО', '1', '0', 'always', '', '0', 0, 1, 18, '', NULL, '', '', '', '0', NULL, '0', '1', '', 16, 1510907109, '0', 0, '', '', '', '0'),
(17, 'ЕВРОЛОС УДАЧА', '0', '0', 'always', '', '0', 0, 1, 18, '', NULL, '', '', '', '0', NULL, '0', '1', '', 17, 1510907109, '0', 0, '', '', '', '0'),
(18, 'ЕВРОЛОС ЭКО', '0', '0', 'always', '', '0', 0, 8, 18, '', NULL, '', '', '', '0', NULL, '0', '1', '', 18, 1510907109, '0', 0, '', '', '', '0'),
(19, 'ЕВРОЛОС БИО', '1', '0', 'always', '', '0', 0, 9, 18, '', NULL, '', '', '', '0', NULL, '0', '1', '', 19, 1510907109, '0', 0, '', '', '', '0'),
(20, 'ЕВРОЛОС ПРО', '1', '0', 'always', '', '0', 0, 11, 18, '', NULL, '', '', '', '0', NULL, '0', '1', '', 20, 1510907109, '0', 0, '', '', '', '0'),
(21, 'ТОПАС 6', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '111 930 РУБ.', '0', NULL, '0', '1', '', 21, 1510907110, '0', 0, '', '', '', '0'),
(22, 'ТОПАС 8', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '135 975 РУБ.', '0', NULL, '0', '1', '', 22, 1510907110, '0', 0, '', '', '', '0'),
(23, 'ТОПАС 10', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '177 030 РУБ.', '0', NULL, '0', '1', '', 24, 1510907110, '0', 0, '', '', '', '0'),
(24, 'ТОПАС 12', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '181 020 РУБ.', '0', NULL, '0', '1', '', 25, 1510907110, '0', 0, '', '', '', '0'),
(25, 'ТОПАС 15', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '210 630 РУБ.', '0', NULL, '0', '1', '', 26, 1510907110, '0', 0, '', '', '', '0'),
(26, 'ТОПАС 20', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '280 875 РУБ.', '0', NULL, '0', '1', '', 27, 1510907110, '0', 0, '', '', '', '0'),
(27, 'ТОПАС 30', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '352 590 РУБ.', '0', NULL, '0', '1', '', 28, 1510907111, '0', 0, '', '', '', '0'),
(28, 'ТОПАС 40', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '455 070 РУБ.', '0', NULL, '0', '1', '', 29, 1510907111, '0', 0, '', '', '', '0'),
(29, 'ТОПАС 50', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '502 950 РУБ.', '0', NULL, '0', '1', '', 30, 1510907111, '0', 0, '', '', '', '0'),
(30, 'ТОПАС 75', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '616 140 РУБ.', '0', NULL, '0', '1', '', 31, 1510907111, '0', 0, '', '', '', '0'),
(31, 'ТОПАС 100', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '829 395 РУБ.', '0', NULL, '0', '1', '', 32, 1510907111, '0', 0, '', '', '', '0'),
(32, 'ТОПАС 150', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '1 232 070 РУБ.', '0', NULL, '0', '1', '', 50, 1510907111, '0', 0, '', '', '', '0'),
(33, 'ТОПАС-С 8', '1', '0', 'always', '', '0', 6, 0, 18, '', NULL, '', '', '122 745 РУБ.', '0', NULL, '0', '1', '', 33, 1510907109, '0', 0, '', '', '', '0'),
(34, 'ТОПАС-С 9', '1', '0', 'always', '', '0', 6, 0, 18, '', NULL, '', '', '127 785 РУБ.', '0', NULL, '0', '1', '', 34, 1510907109, '0', 0, '', '', '', '0'),
(35, 'ТОПАС-С 10', '1', '0', 'always', '', '0', 6, 0, 18, '', NULL, '', '', '159 180 РУБ.', '0', NULL, '0', '1', '', 35, 1510907109, '0', 0, '', '', '', '0'),
(36, 'ТОПАС-С 12', '1', '0', 'always', '', '0', 6, 0, 18, '', NULL, '', '', '163 380 РУБ.', '0', NULL, '0', '1', '', 36, 1510907109, '0', 0, '', '', '', '0'),
(37, 'ТОПАЭРО 3', '1', '0', 'always', '', '0', 15, 0, 18, '', NULL, '', '', '235 935 РУБ.', '0', NULL, '0', '1', '', 37, 1510907111, '0', 0, '', '', '', '0'),
(38, 'ТОПАЭРО 4', '1', '0', 'always', '', '0', 15, 0, 18, '', NULL, '', '', '300 510 РУБ.', '0', NULL, '0', '1', '', 38, 1510907111, '0', 0, '', '', '', '0'),
(39, 'ТОПАЭРО 6', '1', '0', 'always', '', '0', 15, 0, 18, '', NULL, '', '', '381 465 РУБ.', '0', NULL, '0', '1', '', 39, 1510907111, '0', 0, '', '', '', '0'),
(40, 'ТОПАЭРО 7', '1', '0', 'always', '', '0', 15, 0, 18, '', NULL, '', '', '459 270 РУБ.', '0', NULL, '0', '1', '', 40, 1510907111, '0', 0, '', '', '', '0'),
(41, 'ТОПАЭРО 9', '1', '0', 'always', '', '0', 15, 0, 18, '', NULL, '', '', '573 405 РУБ.', '0', NULL, '0', '1', '', 41, 1510907111, '0', 0, '', '', '', '0'),
(42, 'ТОПАЭРО 12', '1', '0', 'always', '', '0', 15, 0, 18, '', NULL, '', '', '698 775 РУБ.', '0', NULL, '0', '1', '', 42, 1510907112, '0', 0, '', '', '', '0'),
(43, 'ТОПАЭРО 16', '1', '0', 'always', '', '0', 15, 0, 18, '', NULL, '', '', '997 185 РУБ.', '0', NULL, '0', '1', '', 43, 1510907112, '0', 0, '', '', '', '0'),
(44, 'ТОПАЭРО 24', '1', '0', 'always', '', '0', 15, 0, 18, '', NULL, '', '', '1 397 340 РУБ.', '0', NULL, '0', '1', '', 44, 1510907112, '0', 0, '', '', '', '0'),
(45, 'ТОПАЭРО 32', '1', '0', 'always', '', '0', 15, 0, 18, '', NULL, '', '', '1 989 960 РУБ.', '0', NULL, '0', '1', '', 45, 1510907112, '0', 0, '', '', '', '0'),
(46, 'ТОПБИО', '1', '0', 'always', '', '0', 16, 0, 18, '', NULL, '', '', '129 780 РУБ.', '0', NULL, '0', '1', '', 46, 1510907112, '0', 0, '', '', '', '0'),
(50, 'ТОПАС 9', '1', '0', 'always', '', '0', 7, 0, 18, '', NULL, '', '', '138 285 РУБ.', '0', NULL, '0', '1', '', 23, 1510907110, '0', 0, '', '', '', '0'),
(250, 'Евролос Эко', '0', '0', 'always', '', '0', 18, 0, 18, '', NULL, '', '', '33 600 РУБ.', '0', NULL, '0', '1', '', 250, 1510907112, '0', 0, '', '', '', '0'),
(251, 'Евролос Эко 0,6', '0', '0', 'always', '', '0', 18, 0, 18, '', NULL, '', '', '33 600 РУБ.', '0', NULL, '0', '1', '', 251, 1510907112, '0', 0, '', '', '', '0'),
(252, 'Евролос Эко 0,8', '0', '0', 'always', '', '0', 18, 0, 18, '', NULL, '', '', '38 850 РУБ.', '0', NULL, '0', '1', '', 252, 1510907112, '0', 0, '', '', '', '0'),
(253, 'Евролос Эко 1', '0', '0', 'always', '', '0', 18, 0, 18, '', NULL, '', '', '45 150 РУБ.', '0', NULL, '0', '1', '', 253, 1510907113, '0', 0, '', '', '', '0'),
(254, 'Евролос Эко 1,5', '0', '0', 'always', '', '0', 18, 0, 18, '', NULL, '', '', '55 650 РУБ.', '0', NULL, '0', '1', '', 254, 1510907113, '0', 0, '', '', '', '0'),
(255, 'Евролос Эко 2,4', '0', '0', 'always', '', '0', 18, 0, 18, '', NULL, '', '', '79 800 РУБ.', '0', NULL, '0', '1', '', 255, 1510907113, '0', 0, '', '', '', '0'),
(256, 'Евролос Эко 3', '0', '0', 'always', '', '0', 18, 0, 18, '', NULL, '', '', '101 850 РУБ.', '0', NULL, '0', '1', '', 256, 1510907113, '0', 0, '', '', '', '0'),
(257, 'Евролос Эко 4', '0', '0', 'always', '', '0', 18, 0, 18, '', NULL, '', '', '141 750 РУБ.', '0', NULL, '0', '1', '', 257, 1510907113, '0', 0, '', '', '', '0'),
(258, 'Евролос БИО 3', '1', '0', 'always', '', '0', 19, 0, 18, '', NULL, '', '', '59 850 РУБ.', '0', NULL, '0', '1', '', 258, 1510907113, '0', 0, '', '', '', '0'),
(259, 'Евролос БИО 4', '1', '0', 'always', '', '0', 19, 0, 18, '', NULL, '', '', '65 100 РУБ.', '0', NULL, '0', '1', '', 259, 1510907113, '0', 0, '', '', '', '0'),
(260, 'Евролос БИО 5', '1', '0', 'always', '', '0', 19, 0, 18, '', NULL, '', '', '71 400 РУБ.', '0', NULL, '0', '1', '', 260, 1510907113, '0', 0, '', '', '', '0'),
(261, 'Евролос БИО 6', '1', '0', 'always', '', '0', 19, 0, 18, '', NULL, '', '', '79 800 РУБ.', '0', NULL, '0', '1', '', 261, 1510907113, '0', 0, '', '', '', '0'),
(262, 'Евролос БИО 8', '1', '0', 'always', '', '0', 19, 0, 18, '', NULL, '', '', '98 700 РУБ.', '0', NULL, '0', '1', '', 262, 1510907113, '0', 0, '', '', '', '0'),
(263, 'Евролос БИО 10', '1', '0', 'always', '', '0', 19, 0, 18, '', NULL, '', '', '121 800 РУБ.', '0', NULL, '0', '1', '', 263, 1510907113, '0', 0, '', '', '', '0'),
(264, 'Евролос БИО 12', '1', '0', 'always', '', '0', 19, 0, 18, '', NULL, '', '', '135 450 РУБ.', '0', NULL, '0', '1', '', 264, 1510907113, '0', 0, '', '', '', '0'),
(265, 'Евролос БИО 15', '1', '0', 'always', '', '0', 19, 0, 18, '', NULL, '', '', '153 300 РУБ.', '0', NULL, '0', '1', '', 265, 1510907113, '0', 0, '', '', '', '0'),
(266, 'Евролос БИО 20', '1', '0', 'always', '', '0', 19, 0, 18, '', NULL, '', '', '180 600 РУБ.', '0', NULL, '0', '1', '', 266, 1510907113, '0', 0, '', '', '', '0'),
(267, 'Евролос ПРО 3', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '70 350 РУБ.', '0', NULL, '0', '1', '', 267, 1510907114, '0', 0, '', '', '', '0'),
(268, 'Евролос ПРО 4', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '76 650 РУБ.', '0', NULL, '0', '1', '', 268, 1510907114, '0', 0, '', '', '', '0'),
(269, 'Евролос ПРО 5', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '82 950 РУБ.', '0', NULL, '0', '1', '', 269, 1510907114, '0', 0, '', '', '', '0'),
(270, 'Евролос ПРО 6', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '91 350 РУБ.', '0', NULL, '0', '1', '', 270, 1510907114, '0', 0, '', '', '', '0'),
(271, 'Евролос ПРО 8', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '103 950 РУБ.', '0', NULL, '0', '1', '', 271, 1510907114, '0', 0, '', '', '', '0'),
(272, 'Евролос ПРО 10', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '126 000 РУБ.', '0', NULL, '0', '1', '', 272, 1510907114, '0', 0, '', '', '', '0'),
(273, 'Евролос ПРО 12', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '142 800 РУБ.', '0', NULL, '0', '1', '', 273, 1510907114, '0', 0, '', '', '', '0'),
(274, 'Евролос ПРО 15', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '162 750 РУБ.', '0', NULL, '0', '1', '', 274, 1510907114, '0', 0, '', '', '', '0'),
(275, 'Евролос ПРО 20', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '202 650 РУБ.', '0', NULL, '0', '1', '', 275, 1510907114, '0', 0, '', '', '', '0'),
(276, 'Евролос ПРО 25', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '236 250 РУБ.', '0', NULL, '0', '1', '', 276, 1510907114, '0', 0, '', '', '', '0'),
(277, 'Евролос ПРО 30', '1', '0', 'always', '', '0', 20, 0, 18, '', NULL, '', '', '252 000 РУБ.', '0', NULL, '0', '1', '', 277, 1510907114, '0', 0, '', '', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_category_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_category_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории-родителя из таблицы `diafan_shop_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий товаров';

--
-- Dumping data for table `diafan_shop_category_parents`
--

INSERT INTO `diafan_shop_category_parents` (`id`, `element_id`, `parent_id`, `trash`) VALUES
(352, 9, 6, '0'),
(353, 10, 6, '0'),
(354, 11, 6, '0'),
(355, 12, 17, '0'),
(356, 13, 7, '0'),
(357, 14, 7, '0'),
(358, 21, 7, '0'),
(359, 22, 7, '0'),
(360, 23, 7, '0'),
(361, 24, 7, '0'),
(362, 25, 7, '0'),
(363, 26, 7, '0'),
(364, 27, 7, '0'),
(365, 28, 7, '0'),
(366, 29, 7, '0'),
(367, 30, 7, '0'),
(368, 31, 7, '0'),
(369, 32, 7, '0'),
(370, 33, 6, '0'),
(371, 34, 6, '0'),
(372, 35, 6, '0'),
(373, 36, 6, '0'),
(374, 37, 15, '0'),
(375, 38, 15, '0'),
(376, 39, 15, '0'),
(377, 40, 15, '0'),
(378, 41, 15, '0'),
(379, 42, 15, '0'),
(380, 43, 15, '0'),
(381, 44, 15, '0'),
(382, 45, 15, '0'),
(383, 46, 16, '0'),
(384, 50, 7, '0'),
(385, 250, 18, '0'),
(386, 251, 18, '0'),
(387, 252, 18, '0'),
(388, 253, 18, '0'),
(389, 254, 18, '0'),
(390, 255, 18, '0'),
(391, 256, 18, '0'),
(392, 257, 18, '0'),
(393, 258, 19, '0'),
(394, 259, 19, '0'),
(395, 260, 19, '0'),
(396, 261, 19, '0'),
(397, 262, 19, '0'),
(398, 263, 19, '0'),
(399, 264, 19, '0'),
(400, 265, 19, '0'),
(401, 266, 19, '0'),
(402, 267, 20, '0'),
(403, 268, 20, '0'),
(404, 269, 20, '0'),
(405, 270, 20, '0'),
(406, 271, 20, '0'),
(407, 272, 20, '0'),
(408, 273, 20, '0'),
(409, 274, 20, '0'),
(410, 275, 20, '0'),
(411, 276, 20, '0'),
(412, 277, 20, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=3030 DEFAULT CHARSET=utf8 COMMENT='Связи товаров и категорий';

--
-- Dumping data for table `diafan_shop_category_rel`
--

INSERT INTO `diafan_shop_category_rel` (`id`, `element_id`, `cat_id`, `trash`) VALUES
(2857, 51, 9, '0'),
(2858, 52, 10, '0'),
(2859, 53, 10, '0'),
(2860, 54, 10, '0'),
(2861, 55, 10, '0'),
(2862, 56, 11, '0'),
(2863, 57, 11, '0'),
(2864, 58, 11, '0'),
(2865, 59, 11, '0'),
(2866, 60, 33, '0'),
(2867, 61, 33, '0'),
(2868, 62, 33, '0'),
(2869, 63, 33, '0'),
(2870, 64, 33, '0'),
(2871, 65, 33, '0'),
(2872, 66, 34, '0'),
(2873, 67, 34, '0'),
(2874, 68, 34, '0'),
(2875, 69, 34, '0'),
(2876, 70, 34, '0'),
(2877, 71, 34, '0'),
(2878, 72, 35, '0'),
(2879, 73, 35, '0'),
(2880, 74, 35, '0'),
(2881, 75, 35, '0'),
(2882, 76, 35, '0'),
(2883, 77, 35, '0'),
(2884, 78, 36, '0'),
(2885, 79, 36, '0'),
(2886, 80, 36, '0'),
(2887, 81, 36, '0'),
(2888, 82, 36, '0'),
(2889, 83, 36, '0'),
(2890, 84, 13, '0'),
(2891, 85, 13, '0'),
(2892, 86, 14, '0'),
(2893, 87, 14, '0'),
(2894, 88, 14, '0'),
(2895, 89, 14, '0'),
(2896, 90, 21, '0'),
(2897, 91, 21, '0'),
(2898, 92, 21, '0'),
(2899, 93, 21, '0'),
(2900, 94, 22, '0'),
(2901, 95, 22, '0'),
(2902, 96, 22, '0'),
(2903, 97, 22, '0'),
(2904, 98, 22, '0'),
(2905, 99, 22, '0'),
(2906, 100, 50, '0'),
(2907, 101, 50, '0'),
(2908, 102, 50, '0'),
(2909, 103, 50, '0'),
(2910, 104, 50, '0'),
(2911, 105, 50, '0'),
(2912, 106, 23, '0'),
(2913, 107, 23, '0'),
(2914, 108, 23, '0'),
(2915, 109, 23, '0'),
(2916, 110, 23, '0'),
(2917, 111, 23, '0'),
(2918, 112, 24, '0'),
(2919, 113, 24, '0'),
(2920, 114, 24, '0'),
(2921, 115, 24, '0'),
(2922, 116, 24, '0'),
(2923, 117, 24, '0'),
(2924, 118, 25, '0'),
(2925, 119, 25, '0'),
(2926, 120, 25, '0'),
(2927, 121, 25, '0'),
(2928, 122, 25, '0'),
(2929, 123, 25, '0'),
(2930, 124, 26, '0'),
(2931, 125, 26, '0'),
(2932, 126, 26, '0'),
(2933, 127, 26, '0'),
(2934, 128, 27, '0'),
(2935, 129, 27, '0'),
(2936, 130, 27, '0'),
(2937, 131, 27, '0'),
(2938, 132, 28, '0'),
(2939, 133, 28, '0'),
(2940, 134, 29, '0'),
(2941, 135, 29, '0'),
(2942, 136, 30, '0'),
(2943, 137, 30, '0'),
(2944, 138, 31, '0'),
(2945, 139, 31, '0'),
(2946, 140, 32, '0'),
(2947, 141, 32, '0'),
(2948, 142, 37, '0'),
(2949, 143, 37, '0'),
(2950, 144, 37, '0'),
(2951, 145, 37, '0'),
(2952, 146, 37, '0'),
(2953, 147, 37, '0'),
(2954, 148, 38, '0'),
(2955, 149, 38, '0'),
(2956, 150, 38, '0'),
(2957, 151, 38, '0'),
(2958, 152, 38, '0'),
(2959, 153, 38, '0'),
(2960, 154, 39, '0'),
(2961, 155, 39, '0'),
(2962, 156, 39, '0'),
(2963, 157, 39, '0'),
(2964, 158, 39, '0'),
(2965, 159, 39, '0'),
(2966, 160, 40, '0'),
(2967, 161, 40, '0'),
(2968, 162, 41, '0'),
(2969, 163, 41, '0'),
(2970, 164, 42, '0'),
(2971, 165, 42, '0'),
(2972, 166, 43, '0'),
(2973, 167, 43, '0'),
(2974, 168, 44, '0'),
(2975, 169, 44, '0'),
(2976, 170, 45, '0'),
(2977, 171, 45, '0'),
(2978, 172, 46, '0'),
(2979, 173, 12, '0'),
(2980, 174, 250, '0'),
(2981, 175, 251, '0'),
(2982, 176, 252, '0'),
(2983, 177, 253, '0'),
(2984, 178, 254, '0'),
(2985, 179, 255, '0'),
(2986, 180, 256, '0'),
(2987, 181, 257, '0'),
(2988, 182, 258, '0'),
(2989, 183, 259, '0'),
(2990, 184, 260, '0'),
(2991, 185, 261, '0'),
(2992, 186, 262, '0'),
(2993, 187, 263, '0'),
(2994, 188, 264, '0'),
(2995, 189, 265, '0'),
(2996, 190, 266, '0'),
(2997, 202, 258, '0'),
(2998, 203, 259, '0'),
(2999, 204, 260, '0'),
(3000, 205, 261, '0'),
(3001, 206, 262, '0'),
(3002, 207, 263, '0'),
(3003, 208, 264, '0'),
(3004, 209, 265, '0'),
(3005, 210, 266, '0'),
(3006, 191, 267, '0'),
(3007, 192, 268, '0'),
(3008, 193, 269, '0'),
(3009, 194, 270, '0'),
(3010, 195, 271, '0'),
(3011, 196, 272, '0'),
(3012, 197, 273, '0'),
(3013, 198, 274, '0'),
(3014, 199, 275, '0'),
(3015, 200, 276, '0'),
(3016, 201, 277, '0'),
(3017, 211, 267, '0'),
(3018, 212, 268, '0'),
(3019, 213, 269, '0'),
(3020, 214, 270, '0'),
(3021, 215, 271, '0'),
(3022, 216, 272, '0'),
(3023, 217, 273, '0'),
(3024, 218, 274, '0'),
(3025, 219, 275, '0'),
(3026, 220, 276, '0'),
(3027, 221, 277, '0'),
(3029, 50, 9, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_counter`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_counter` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `count_view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров товаров';

--
-- Dumping data for table `diafan_shop_counter`
--

INSERT INTO `diafan_shop_counter` (`id`, `element_id`, `count_view`, `trash`) VALUES
(3, 4, 1, '0'),
(4, 56, 1, '0'),
(5, 50, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_currency`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_currency` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT 'название',
  `exchange_rate` double NOT NULL DEFAULT '0' COMMENT 'курс к основной валюте',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Дополнительные валюты магазина';

--
-- Dumping data for table `diafan_shop_currency`
--

INSERT INTO `diafan_shop_currency` (`id`, `name`, `exchange_rate`, `trash`) VALUES
(1, 'Euro', 50, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_delivery`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_delivery` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text COMMENT 'описание',
  `service` varchar(50) NOT NULL DEFAULT '' COMMENT 'служба доставки',
  `params` text COMMENT 'серилизованные настройки службы доставки',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Способы доставки';

--
-- Dumping data for table `diafan_shop_delivery`
--

INSERT INTO `diafan_shop_delivery` (`id`, `name1`, `text1`, `service`, `params`, `act1`, `sort`, `trash`) VALUES
(1, 'Курьер', 'Товар доставляется курьером до двери Вашего дома.', '', NULL, '1', 1, '0'),
(2, 'Почта России', 'Доставка по всей России небольших посылок', '', NULL, '1', 2, '0'),
(3, 'EMS-доставка', 'Экспресс-доставка до дверей курьером в любую точку России', '', NULL, '1', 3, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_delivery_thresholds`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_delivery_thresholds` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `delivery_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор способа доставки из таблицы `diafan_shop_delivery`',
  `price` double NOT NULL DEFAULT '0' COMMENT 'стоимость',
  `amount` double NOT NULL DEFAULT '0' COMMENT 'сумма, от которой действует стоимость',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Стоимость способов доставки';

--
-- Dumping data for table `diafan_shop_delivery_thresholds`
--

INSERT INTO `diafan_shop_delivery_thresholds` (`id`, `delivery_id`, `price`, `amount`, `trash`) VALUES
(1, 1, 500, 0, '0'),
(2, 1, 0, 6000, '0'),
(3, 2, 650, 0, '0'),
(4, 3, 1200, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_discount`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_discount` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала действия',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окночания действия',
  `discount` double NOT NULL DEFAULT '0' COMMENT 'процент скидки',
  `amount` double NOT NULL DEFAULT '0' COMMENT 'действует от цены товара',
  `deduction` double NOT NULL DEFAULT '0' COMMENT 'фиксированная сумма скидки',
  `threshold` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'действует от общей суммы заказа',
  `threshold_cumulative` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'действует от общей оплаченных заказов',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '  тип пользователя из таблицы `diafan_users_role`, для которого установлена скидка',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `person` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'скидка действует только для определенных пользователей: 0 - нет, 1 - да',
  `text` text COMMENT 'описание скидки для администратора',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Скидки';

--
-- Dumping data for table `diafan_shop_discount`
--

INSERT INTO `diafan_shop_discount` (`id`, `date_start`, `date_finish`, `discount`, `amount`, `deduction`, `threshold`, `threshold_cumulative`, `role_id`, `act`, `person`, `text`, `trash`) VALUES
(1, 0, 0, 10, 0, 0, 0, 0, 0, '1', '0', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_discount_coupon`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_discount_coupon` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `discount_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `coupon` varchar(10) NOT NULL DEFAULT '' COMMENT 'код купона',
  `count_use` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'cколько раз можно использовать купон',
  `used` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'сколько раз купон использован при оформлении заказа',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Купоны на скидку';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_discount_object`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_discount_object` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `discount_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `good_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Товары и категории, на которые действуют скидки';

--
-- Dumping data for table `diafan_shop_discount_object`
--

INSERT INTO `diafan_shop_discount_object` (`id`, `discount_id`, `cat_id`, `good_id`, `trash`) VALUES
(2, 1, 0, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_discount_person`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_discount_person` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `discount_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'номер сессии пользователя из таблицы `diafan_sessions`',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор купона из таблицы `diafan_shop_discount_coupon`',
  `used` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'скидка уже использована: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи, для которых действуют скидки';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_files_codes`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_files_codes` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT 'код для скачивания товара-файла',
  `date_finish` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'дата и время окончания действия кода'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Коды для скачивания товаров-нематериальных активов';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_import`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_import` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор описания файла из таблицы `diafan_shop_import`',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `params` text COMMENT 'серилизованные данные о поле',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'серилизованные данные о поле',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'выдавать ошибку, если поле не заполнено: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='Описание полей файлов импорта';

--
-- Dumping data for table `diafan_shop_import`
--

INSERT INTO `diafan_shop_import` (`id`, `name`, `cat_id`, `type`, `params`, `required`, `sort`, `trash`) VALUES
(1, 'Идентификатор', 1, 'id', 'a:1:{s:4:"type";s:4:"site";}', '0', 1, '0'),
(3, 'Название товара', 1, 'name', NULL, '0', 3, '0'),
(4, 'Краткое описание', 1, 'anons', NULL, '0', 29, '0'),
(6, 'Цена', 1, 'price', 'a:5:{s:9:"delimitor";s:1:"&";s:11:"select_type";s:3:"key";s:5:"count";i:0;s:8:"currency";i:0;s:15:"select_currency";s:3:"key";}', '0', 6, '0'),
(11, 'Идентификатор', 2, 'id', 'a:1:{s:4:"type";s:4:"site";}', '0', 11, '0'),
(12, 'Название категории', 2, 'name', NULL, '0', 12, '0'),
(13, 'Краткое описание категории', 2, 'anons', NULL, '0', 13, '0'),
(15, 'Идентификатор', 3, 'id', 'a:1:{s:4:"type";s:4:"site";}', '0', 15, '0'),
(16, 'Название производителя', 3, 'name', NULL, '0', 16, '0'),
(17, 'Описание категории', 3, 'text', NULL, '0', 17, '0'),
(22, 'Изображения', 1, 'images', 'a:2:{s:9:"directory";s:16:"/images/products";s:16:"second_delimitor";s:0:"";}', '0', 30, '0'),
(23, 'Производительность', 1, 'param', 'a:3:{s:2:"id";i:2;s:11:"select_type";s:3:"key";s:9:"directory";s:0:"";}', '0', 22, '0'),
(24, 'Количество пользователей', 1, 'param', 'a:3:{s:2:"id";i:3;s:11:"select_type";s:3:"key";s:9:"directory";s:0:"";}', '0', 23, '0'),
(25, 'Глубина залегания трубы', 1, 'param', 'a:3:{s:2:"id";i:4;s:11:"select_type";s:3:"key";s:9:"directory";s:0:"";}', '0', 24, '0'),
(26, 'Объем залпового сброса', 1, 'param', 'a:3:{s:2:"id";i:5;s:11:"select_type";s:3:"key";s:9:"directory";s:0:"";}', '0', 25, '0'),
(27, 'Потребляемая электроэнергия', 1, 'param', 'a:3:{s:2:"id";i:6;s:11:"select_type";s:3:"key";s:9:"directory";s:0:"";}', '0', 26, '0'),
(28, 'Вес', 1, 'param', 'a:3:{s:2:"id";i:7;s:11:"select_type";s:3:"key";s:9:"directory";s:0:"";}', '0', 27, '0'),
(29, 'Габариты установки д/ш/в', 1, 'param', 'a:3:{s:2:"id";i:8;s:11:"select_type";s:3:"key";s:9:"directory";s:0:"";}', '0', 28, '0'),
(30, 'Категория', 1, 'cats', 'a:1:{s:4:"type";s:4:"site";}', '0', 19, '0'),
(31, 'Опубликовать на сайте', 1, 'act', '', '0', 31, '0'),
(32, 'Родительская категория', 2, 'parent', 'a:1:{s:4:"type";s:4:"site";}', '0', 32, '0'),
(33, 'Изображение категории', 2, 'images', 'a:2:{s:9:"directory";s:18:"/images/categories";s:16:"second_delimitor";s:0:"";}', '0', 33, '0'),
(34, 'Опубликовать на сайте', 2, 'act', '', '0', 34, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_import_category`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_import_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `format` enum('csv','xls') NOT NULL DEFAULT 'csv' COMMENT 'формат файла',
  `type` enum('good','category','brand') NOT NULL DEFAULT 'good' COMMENT 'тип данных: good - товары, category - категории товаров',
  `delete_items` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'удалять не описанные в файле данные: 0 - нет, 1 - да',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `count_part` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество строк, выгружаемых за один проход скрипта',
  `delimiter` varchar(20) NOT NULL DEFAULT '' COMMENT 'разделитель данных в строке',
  `end_string` varchar(20) NOT NULL DEFAULT '' COMMENT 'обозначать конец строки символом',
  `encoding` varchar(20) NOT NULL DEFAULT '' COMMENT 'кодировка',
  `sub_delimiter` varchar(20) NOT NULL DEFAULT '' COMMENT 'разделитель данных внутри поля',
  `header` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'первая строка - названия столбцов: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Описание файлов импорта';

--
-- Dumping data for table `diafan_shop_import_category`
--

INSERT INTO `diafan_shop_import_category` (`id`, `name`, `format`, `type`, `delete_items`, `site_id`, `cat_id`, `count_part`, `delimiter`, `end_string`, `encoding`, `sub_delimiter`, `header`, `sort`, `trash`) VALUES
(1, 'Импорт товаров', 'csv', 'good', '0', 18, 0, 20, ';', '', 'cp1251', '|', '0', 1, '0'),
(2, 'Импорт категорий', 'csv', 'category', '0', 18, 0, 20, ';', '', 'cp1251', '|', '0', 2, '0'),
(3, 'Импорт производителей', 'csv', 'brand', '0', 18, 0, 20, ';', '', 'cp1251', '|', '0', 3, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_order`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_order` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT 'действие статуса заказа',
  `status_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'идентификатор статуса заказа из таблицы `diafan_shop_order_status`',
  `lang_id` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор языковой версии сайта, с которой был сделан заказ, из таблицы `diafan_languages`',
  `summ` double NOT NULL DEFAULT '0' COMMENT 'общая сумма заказа',
  `delivery_id` varchar(10) NOT NULL DEFAULT '0' COMMENT 'способ доставки из таблицы `diafan_shop_delivery`',
  `delivery_summ` double NOT NULL DEFAULT '0' COMMENT 'стоимость доставки',
  `delivery_info` text COMMENT 'данные службы доставки',
  `discount_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `discount_summ` double NOT NULL DEFAULT '0' COMMENT 'сумма скидки',
  `count_minus` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'товары списаны: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Заказы';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_order_additional_cost`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_order_additional_cost` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор заказа из таблицы `diafan_shop_order`',
  `order_goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор записи о купленном товаре из таблицы `diafan_shop_order_goods`',
  `additional_cost_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор сопутствующей услуги из таблицы `diafan_shop_additional_cost`',
  `summ` double NOT NULL DEFAULT '0' COMMENT 'сумма'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сопутствующие услуги, включенные в заказ';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_order_goods`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_order_goods` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор заказа из таблицы `diafan_shop_order`',
  `good_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `discount_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `count_goods` double NOT NULL DEFAULT '0' COMMENT 'количество товаров',
  `price` double NOT NULL DEFAULT '0' COMMENT 'цена',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в заказе';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_order_goods_param`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_order_goods_param` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `value` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'значение характеристики',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `order_goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор записи о купленном товаре из таблицы `diafan_shop_order_goods`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительных характеристики товаров в заказе';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_order_param`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_order_param` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text COMMENT 'описание',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `info` varchar(30) NOT NULL DEFAULT '' COMMENT 'смысловая нагрузка',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `show_in_form` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'использовать в стандатной форме оформления заказа: 0 - нет, 1 - да',
  `show_in_form_register` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'позволять редактировать из личного кабинета: 0 - нет, 1 - да',
  `show_in_form_one_click` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'использовать в форме быстрого заказа: 0 - нет, 1 - да',
  `config` text COMMENT 'дополнительные настройки поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Поля конструктора формы оформления заказа';

--
-- Dumping data for table `diafan_shop_order_param`
--

INSERT INTO `diafan_shop_order_param` (`id`, `name1`, `text1`, `type`, `info`, `sort`, `required`, `show_in_form`, `show_in_form_register`, `show_in_form_one_click`, `config`, `trash`) VALUES
(1, 'ФИО или название компании', NULL, 'text', 'name', 1, '1', '1', '0', '1', NULL, '0'),
(2, 'E-mail', NULL, 'email', 'email', 2, '1', '1', '0', '0', NULL, '0'),
(3, 'Контактные телефоны (с кодом города)', NULL, 'phone', 'phone', 3, '1', '1', '0', '1', NULL, '0'),
(4, 'Индекс', NULL, 'text', 'zip', 4, '0', '1', '0', '0', NULL, '0'),
(5, 'Город', NULL, 'text', 'city', 5, '0', '1', '0', '0', NULL, '0'),
(6, 'Улица, проспект и пр.', NULL, 'text', 'street', 6, '0', '1', '0', '0', NULL, '0'),
(7, 'Номер дома', NULL, 'text', 'building', 7, '0', '1', '0', '0', NULL, '0'),
(8, 'Корпус', NULL, 'text', 'suite', 8, '0', '1', '0', '0', NULL, '0'),
(9, 'Квартира, офис', NULL, 'text', 'flat', 9, '0', '1', '0', '0', NULL, '0'),
(10, 'Комментарии', NULL, 'textarea', 'comment', 10, '0', '1', '0', '0', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_order_param_element`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_order_param_element` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `value` text COMMENT 'значение',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор поля из таблицы `diafan_shop_order_param`',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор заказа из таблицы `diafan_shop_order`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения полей конструктора оформления заказа';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_order_param_select`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_order_param_select` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор поля из таблицы `diafan_shop_order_param`',
  `value` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значений полей конструктора оформления заказа типа список';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_order_param_user`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_order_param_user` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `value` text COMMENT 'значение',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор поля из таблицы `diafan_shop_order_param`',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения полей конструктора оформления заказа, предзаполненные пользователями';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_order_status`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_order_status` (
  `id` tinyint(3) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `color` varchar(20) NOT NULL DEFAULT '' COMMENT 'цвет',
  `status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT 'действие статуса заказа',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `count_minus` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'списывать товары: 0 - нет, 1 - да',
  `send_mail` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'отправлять уведомление пользователю о смене статуса: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Статусы заказов';

--
-- Dumping data for table `diafan_shop_order_status`
--

INSERT INTO `diafan_shop_order_status` (`id`, `name1`, `color`, `status`, `sort`, `count_minus`, `send_mail`, `trash`) VALUES
(1, 'Новый', '#D54640', '0', 1, '0', '0', '0'),
(2, 'В обработке', '#F49D10', '1', 2, '1', '1', '0'),
(3, 'Отменен', '#A6AEB0', '2', 3, '0', '1', '0'),
(4, 'Выполнен', '#8AC73C', '3', 4, '1', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_param`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_param` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `search` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в форме поиска: 0 - нет, 1 - да',
  `list` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в списке товаров: 0 - нет, 1 - да',
  `block` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в блоке товаров: 0 - нет, 1 - да',
  `id_page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится на странице товара: 0 - нет, 1 - да',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступен к выбору при заказе: 0 - нет, 1 - да',
  `page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'отдельная страница для значений: 0 - нет, 1 - да',
  `text1` text COMMENT 'описание',
  `config` text COMMENT 'дополнительные настройки поля',
  `display_in_sort` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводится в блоке для сортировки: 0 - нет, 1 - да',
  `yandex_use` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выгружается в файл YML: 0 - нет, 1 - да',
  `yandex_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название в файле YML',
  `yandex_unit` varchar(50) NOT NULL DEFAULT '' COMMENT 'единица измерения в файле YML',
  `measure_unit1` varchar(50) NOT NULL DEFAULT '' COMMENT 'единица измерения',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Дополнительные характеристики товаров';

--
-- Dumping data for table `diafan_shop_param`
--

INSERT INTO `diafan_shop_param` (`id`, `name1`, `type`, `sort`, `search`, `list`, `block`, `id_page`, `required`, `page`, `text1`, `config`, `display_in_sort`, `yandex_use`, `yandex_name`, `yandex_unit`, `measure_unit1`, `trash`) VALUES
(2, 'Производительность', 'text', 2, '0', '1', '1', '1', '0', '0', '', NULL, '0', '0', '', '', '', '0'),
(3, 'Количество пользователей', 'text', 3, '0', '0', '0', '1', '0', '0', '', NULL, '0', '0', '', '', '', '0'),
(4, 'Глубина залегания трубы', 'text', 4, '0', '0', '0', '1', '0', '0', '', NULL, '0', '0', '', '', '', '0'),
(5, 'Объем залпового сброса', 'text', 5, '0', '0', '0', '1', '0', '0', '', NULL, '0', '0', '', '', '', '0'),
(6, 'Потребляемая электроэнергия', 'text', 6, '0', '0', '0', '1', '0', '0', '', NULL, '0', '0', '', '', '', '0'),
(7, 'Вес', 'text', 7, '0', '0', '0', '1', '0', '0', '', NULL, '0', '0', '', '', '', '0'),
(8, 'Габариты установки д/ш/в', 'text', 8, '0', '0', '0', '1', '0', '0', '', NULL, '0', '0', '', '', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_param_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_param_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan__category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Связи дополнительных харакеристик товаров и категорий';

--
-- Dumping data for table `diafan_shop_param_category_rel`
--

INSERT INTO `diafan_shop_param_category_rel` (`id`, `element_id`, `cat_id`, `trash`) VALUES
(2, 2, 0, '0'),
(3, 3, 0, '0'),
(4, 4, 0, '0'),
(5, 5, 0, '0'),
(6, 6, 0, '0'),
(7, 7, 0, '0'),
(8, 8, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_param_element`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_param_element` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `value1` text COMMENT 'значение',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=19721 DEFAULT CHARSET=utf8 COMMENT='Значения дополнительных характеристик товаров';

--
-- Dumping data for table `diafan_shop_param_element`
--

INSERT INTO `diafan_shop_param_element` (`id`, `value1`, `param_id`, `element_id`, `trash`) VALUES
(196, '0.8', 2, 4, '0'),
(197, '4', 3, 4, '0'),
(198, '40-80', 4, 4, '0'),
(199, '175', 5, 4, '0'),
(200, '1.5', 6, 4, '0'),
(201, '215', 7, 4, '0'),
(202, '0,95 / 0,97 / 2,5', 8, 4, '0'),
(203, '88777.00', 2, 5, '0'),
(204, '8_topas-s-4-pr.jpg', 3, 5, '0'),
(205, '0.8', 4, 5, '0'),
(206, '4', 5, 5, '0'),
(207, '40-80', 6, 5, '0'),
(208, '175', 7, 5, '0'),
(209, '42856', 8, 5, '0'),
(210, '1', 2, 7, '0'),
(211, '42858', 3, 7, '0'),
(212, '40-80', 4, 7, '0'),
(213, '42858', 5, 7, '0'),
(214, '40-80', 6, 7, '0'),
(215, '220', 7, 7, '0'),
(216, '1,15 / 1,17 / 2,5', 8, 7, '0'),
(217, '1', 2, 9, '0'),
(218, '3-5', 3, 9, '0'),
(219, '80-140', 4, 9, '0'),
(220, '220', 5, 9, '0'),
(221, '1.5', 6, 9, '0'),
(222, '340', 7, 9, '0'),
(223, '1,18 / 1 / 3,1', 8, 9, '0'),
(224, '102000.00', 2, 10, '0'),
(225, 'topas-s-5-pr.jpg', 3, 10, '0'),
(226, '1', 4, 10, '0'),
(227, '42858', 5, 10, '0'),
(228, '40-80', 6, 10, '0'),
(229, '220', 7, 10, '0'),
(18670, '0,8', 2, 50, '0'),
(18671, '4', 3, 50, '0'),
(18672, '40-80', 4, 50, '0'),
(18673, '175', 5, 50, '0'),
(18674, '1,5', 6, 50, '0'),
(18675, '215', 7, 50, '0'),
(18676, '0,95 / 0,97 / 2,5', 8, 50, '0'),
(18677, '0,8', 2, 51, '0'),
(18678, '4', 3, 51, '0'),
(18679, '40-80', 4, 51, '0'),
(18680, '175', 5, 51, '0'),
(18681, '1,5', 6, 51, '0'),
(18682, '215', 7, 51, '0'),
(18683, '0,88 / 0,97 / 2,6', 8, 51, '0'),
(18684, '1', 2, 52, '0'),
(18685, '3-5', 3, 52, '0'),
(18686, '40-80', 4, 52, '0'),
(18687, '220', 5, 52, '0'),
(18688, '1,5', 6, 52, '0'),
(18689, '280', 7, 52, '0'),
(18690, '1,15 / 1,17 / 2,5', 8, 52, '0'),
(18691, '1', 2, 53, '0'),
(18692, '3-5', 3, 53, '0'),
(18693, '80-140', 4, 53, '0'),
(18694, '220', 5, 53, '0'),
(18695, '1,5', 6, 53, '0'),
(18696, '340', 7, 53, '0'),
(18697, '1,18 / 1 / 3,1', 8, 53, '0'),
(18698, '1', 2, 54, '0'),
(18699, '3-5', 3, 54, '0'),
(18700, '40-80', 4, 54, '0'),
(18701, '220', 5, 54, '0'),
(18702, '1,5', 6, 54, '0'),
(18703, '295', 7, 54, '0'),
(18704, '1,08 / 1,17 / 2,6', 8, 54, '0'),
(18705, '1', 2, 55, '0'),
(18706, '3-5', 3, 55, '0'),
(18707, '80-140', 4, 55, '0'),
(18708, '220', 5, 55, '0'),
(18709, '1,6', 6, 55, '0'),
(18710, '350', 7, 55, '0'),
(18711, '1,16 / 1 / 3,1', 8, 55, '0'),
(18712, '1,15', 2, 56, '0'),
(18713, '6', 3, 56, '0'),
(18714, '40-80', 4, 56, '0'),
(18715, '250', 5, 56, '0'),
(18716, '1,5', 6, 56, '0'),
(18717, '280', 7, 56, '0'),
(18718, '1,15 / 1,17 / 2,55', 8, 56, '0'),
(18719, '1,15', 2, 57, '0'),
(18720, '6', 3, 57, '0'),
(18721, '80-140', 4, 57, '0'),
(18722, '250', 5, 57, '0'),
(18723, '1,5', 6, 57, '0'),
(18724, '345', 7, 57, '0'),
(18725, '1,18 / 1 / 3,1', 8, 57, '0'),
(18726, '1,15', 2, 58, '0'),
(18727, '6', 3, 58, '0'),
(18728, '40-80', 4, 58, '0'),
(18729, '250', 5, 58, '0'),
(18730, '1,5', 6, 58, '0'),
(18731, '295', 7, 58, '0'),
(18732, '1,08 / 1,17 / 2,6', 8, 58, '0'),
(18733, '1,15', 2, 59, '0'),
(18734, '6', 3, 59, '0'),
(18735, '80-140', 4, 59, '0'),
(18736, '250', 5, 59, '0'),
(18737, '1,6', 6, 59, '0'),
(18738, '355', 7, 59, '0'),
(18739, '1,16 / 1 / 3,1', 8, 59, '0'),
(18740, '1,5', 2, 60, '0'),
(18741, '5-8', 3, 60, '0'),
(18742, '40-80', 4, 60, '0'),
(18743, '440', 5, 60, '0'),
(18744, '1,5', 6, 60, '0'),
(18745, '350', 7, 60, '0'),
(18746, '1,63 / 1,17 / 2,5', 8, 60, '0'),
(18747, '1,5', 2, 61, '0'),
(18748, '5-8', 3, 61, '0'),
(18749, '80-140', 4, 61, '0'),
(18750, '440', 5, 61, '0'),
(18751, '1,5', 6, 61, '0'),
(18752, '425', 7, 61, '0'),
(18753, '1,52 / 1,16 / 3,1', 8, 61, '0'),
(18754, '1,5', 2, 62, '0'),
(18755, '5-8', 3, 62, '0'),
(18756, '40-80', 4, 62, '0'),
(18757, '440', 5, 62, '0'),
(18758, '1,5', 6, 62, '0'),
(18759, '365', 7, 62, '0'),
(18760, '1,56 / 1,17 /2,6', 8, 62, '0'),
(18761, '1,5', 2, 63, '0'),
(18762, '5-8', 3, 63, '0'),
(18763, '80-140', 4, 63, '0'),
(18764, '440', 5, 63, '0'),
(18765, '1,6', 6, 63, '0'),
(18766, '435', 7, 63, '0'),
(18767, '1,5 / 1,16 / 3,1', 8, 63, '0'),
(18768, '1,5', 2, 64, '0'),
(18769, '5-8', 3, 64, '0'),
(18770, '80-140', 4, 64, '0'),
(18771, '440', 5, 64, '0'),
(18772, '1,6', 6, 64, '0'),
(18773, '490', 7, 64, '0'),
(18774, '1,69 / 1,36 / 3,1', 8, 64, '0'),
(18775, '1,5', 2, 65, '0'),
(18776, '5-8', 3, 65, '0'),
(18777, '80-140', 4, 65, '0'),
(18778, '440', 5, 65, '0'),
(18779, '1,6', 6, 65, '0'),
(18780, '495', 7, 65, '0'),
(18781, '1,66 / 1,36 / 3,1', 8, 65, '0'),
(18782, '1,7', 2, 66, '0'),
(18783, '9', 3, 66, '0'),
(18784, '40-80', 4, 66, '0'),
(18785, '510', 5, 66, '0'),
(18786, '1,5', 6, 66, '0'),
(18787, '355', 7, 66, '0'),
(18788, '1,63 / 1,17 / 2,55', 8, 66, '0'),
(18789, '1,7', 2, 67, '0'),
(18790, '9', 3, 67, '0'),
(18791, '80-140', 4, 67, '0'),
(18792, '510', 5, 67, '0'),
(18793, '1,5', 6, 67, '0'),
(18794, '420', 7, 67, '0'),
(18795, '1,52 / 1,16 / 3,1', 8, 67, '0'),
(18796, '1,7', 2, 68, '0'),
(18797, '9', 3, 68, '0'),
(18798, '80-140', 4, 68, '0'),
(18799, '510', 5, 68, '0'),
(18800, '1,6', 6, 68, '0'),
(18801, '460', 7, 68, '0'),
(18802, '1,69 / 1,36 / 3,1', 8, 68, '0'),
(18803, '1,7', 2, 69, '0'),
(18804, '9', 3, 69, '0'),
(18805, '40-80', 4, 69, '0'),
(18806, '510', 5, 69, '0'),
(18807, '1,5', 6, 69, '0'),
(18808, '370', 7, 69, '0'),
(18809, '1,56 / 1,17 / 2,6', 8, 69, '0'),
(18810, '1,7', 2, 70, '0'),
(18811, '9', 3, 70, '0'),
(18812, '80-140', 4, 70, '0'),
(18813, '510', 5, 70, '0'),
(18814, '1,6', 6, 70, '0'),
(18815, '430', 7, 70, '0'),
(18816, '1,5 / 1,16 / 3,1', 8, 70, '0'),
(18817, '1,7', 2, 71, '0'),
(18818, '9', 3, 71, '0'),
(18819, '80-140', 4, 71, '0'),
(18820, '510', 5, 71, '0'),
(18821, '1,6', 6, 71, '0'),
(18822, '470', 7, 71, '0'),
(18823, '1,66 / 1,36 / 3,1', 8, 71, '0'),
(18824, '2', 2, 72, '0'),
(18825, '8-10', 3, 72, '0'),
(18826, '40-80', 4, 72, '0'),
(18827, '760', 5, 72, '0'),
(18828, '2', 6, 72, '0'),
(18829, '485', 7, 72, '0'),
(18830, '2,1 / 1,18 / 2,5', 8, 72, '0'),
(18831, '2', 2, 73, '0'),
(18832, '8-10', 3, 73, '0'),
(18833, '80-140', 4, 73, '0'),
(18834, '760', 5, 73, '0'),
(18835, '2', 6, 73, '0'),
(18836, '555', 7, 73, '0'),
(18837, '2,02 / 1,16 / 3,1', 8, 73, '0'),
(18838, '2', 2, 74, '0'),
(18839, '8-10', 3, 74, '0'),
(18840, '80-140', 4, 74, '0'),
(18841, '760', 5, 74, '0'),
(18842, '2,1', 6, 74, '0'),
(18843, '595', 7, 74, '0'),
(18844, '2,11 / 1,36 / 3,1', 8, 74, '0'),
(18845, '2', 2, 75, '0'),
(18846, '8-10', 3, 75, '0'),
(18847, '40-80', 4, 75, '0'),
(18848, '760', 5, 75, '0'),
(18849, '2', 6, 75, '0'),
(18850, '505', 7, 75, '0'),
(18851, '2,03 / 1,18 / 2,6', 8, 75, '0'),
(18852, '2', 2, 76, '0'),
(18853, '8-10', 3, 76, '0'),
(18854, '80-140', 4, 76, '0'),
(18855, '760', 5, 76, '0'),
(18856, '2,1', 6, 76, '0'),
(18857, '565', 7, 76, '0'),
(18858, '2,0 / 1,16 / 3,1', 8, 76, '0'),
(18859, '2', 2, 77, '0'),
(18860, '8-10', 3, 77, '0'),
(18861, '80-140', 4, 77, '0'),
(18862, '760', 5, 77, '0'),
(18863, '2,1', 6, 77, '0'),
(18864, '605', 7, 77, '0'),
(18865, '2,0 / 1,36 / 3,1', 8, 77, '0'),
(18866, '2,2', 2, 78, '0'),
(18867, '12', 3, 78, '0'),
(18868, '40-80', 4, 78, '0'),
(18869, '830', 5, 78, '0'),
(18870, '2', 6, 78, '0'),
(18871, '490', 7, 78, '0'),
(18872, '2,1 / 1,18 / 2,55', 8, 78, '0'),
(18873, '2,2', 2, 79, '0'),
(18874, '12', 3, 79, '0'),
(18875, '40-80', 4, 79, '0'),
(18876, '830', 5, 79, '0'),
(18877, '2', 6, 79, '0'),
(18878, '505', 7, 79, '0'),
(18879, '2,03 / 1,18 / 2,6', 8, 79, '0'),
(18880, '2,2', 2, 80, '0'),
(18881, '12', 3, 80, '0'),
(18882, '40-80', 4, 80, '0'),
(18883, '830', 5, 80, '0'),
(18884, '2', 6, 80, '0'),
(18885, '600', 7, 80, '0'),
(18886, '2,11 / 1,36 / 3,1', 8, 80, '0'),
(18887, '2,2', 2, 81, '0'),
(18888, '12', 3, 81, '0'),
(18889, '40-80', 4, 81, '0'),
(18890, '830', 5, 81, '0'),
(18891, '2', 6, 81, '0'),
(18892, '560', 7, 81, '0'),
(18893, '2,02 / 1,16 / 3,1', 8, 81, '0'),
(18894, '2,2', 2, 82, '0'),
(18895, '12', 3, 82, '0'),
(18896, '80-140', 4, 82, '0'),
(18897, '830', 5, 82, '0'),
(18898, '2,1', 6, 82, '0'),
(18899, '570', 7, 82, '0'),
(18900, '2,0 / 1,16 / 3,1', 8, 82, '0'),
(18901, '2,2', 2, 83, '0'),
(18902, '12', 3, 83, '0'),
(18903, '80-140', 4, 83, '0'),
(18904, '830', 5, 83, '0'),
(18905, '2,1', 6, 83, '0'),
(18906, '610', 7, 83, '0'),
(18907, '2,0 / 1,36 / 3,1', 8, 83, '0'),
(18908, '0,8', 2, 84, '0'),
(18909, '4', 3, 84, '0'),
(18910, '40-80', 4, 84, '0'),
(18911, '175', 5, 84, '0'),
(18912, '1,6', 6, 84, '0'),
(18913, '225', 7, 84, '0'),
(18914, '0,88 / 0,97 / 2,6', 8, 84, '0'),
(18915, '0,8', 2, 85, '0'),
(18916, '4', 3, 85, '0'),
(18917, '40-80', 4, 85, '0'),
(18918, '175', 5, 85, '0'),
(18919, '1,6', 6, 85, '0'),
(18920, '225', 7, 85, '0'),
(18921, '0,88 / 0,97 / 2,6', 8, 85, '0'),
(18922, '1', 2, 86, '0'),
(18923, '3-5', 3, 86, '0'),
(18924, '40-80', 4, 86, '0'),
(18925, '220', 5, 86, '0'),
(18926, '1,5', 6, 86, '0'),
(18927, '280', 7, 86, '0'),
(18928, '1,15 / 1,17 / 2,5', 8, 86, '0'),
(18929, '1', 2, 87, '0'),
(18930, '3-5', 3, 87, '0'),
(18931, '80-140', 4, 87, '0'),
(18932, '220', 5, 87, '0'),
(18933, '1,6', 6, 87, '0'),
(18934, '340', 7, 87, '0'),
(18935, '1,18 / 1,0 / 3,1', 8, 87, '0'),
(18936, '1', 2, 88, '0'),
(18937, '3-5', 3, 88, '0'),
(18938, '40-80', 4, 88, '0'),
(18939, '220', 5, 88, '0'),
(18940, '1,5', 6, 88, '0'),
(18941, '295', 7, 88, '0'),
(18942, '1,08 / 1,17 / 2,6', 8, 88, '0'),
(18943, '1', 2, 89, '0'),
(18944, '3-5', 3, 89, '0'),
(18945, '80-140', 4, 89, '0'),
(18946, '220', 5, 89, '0'),
(18947, '1,6', 6, 89, '0'),
(18948, '350', 7, 89, '0'),
(18949, '1,16 / 1,0 / 3,1', 8, 89, '0'),
(18950, '1,15', 2, 90, '0'),
(18951, '6', 3, 90, '0'),
(18952, '40-80', 4, 90, '0'),
(18953, '250', 5, 90, '0'),
(18954, '1,5', 6, 90, '0'),
(18955, '280', 7, 90, '0'),
(18956, '1,15 / 1,17 / 2,55', 8, 90, '0'),
(18957, '1,15', 2, 91, '0'),
(18958, '6', 3, 91, '0'),
(18959, '40-80', 4, 91, '0'),
(18960, '250', 5, 91, '0'),
(18961, '1,5', 6, 91, '0'),
(18962, '295', 7, 91, '0'),
(18963, '1,08 / 1,17 / 2,6', 8, 91, '0'),
(18964, '1,15', 2, 92, '0'),
(18965, '6', 3, 92, '0'),
(18966, '80-140', 4, 92, '0'),
(18967, '250', 5, 92, '0'),
(18968, '1,6', 6, 92, '0'),
(18969, '250', 7, 92, '0'),
(18970, '1,18 / 1,0 / 3,1', 8, 92, '0'),
(18971, '1,15', 2, 93, '0'),
(18972, '6', 3, 93, '0'),
(18973, '80-140', 4, 93, '0'),
(18974, '250', 5, 93, '0'),
(18975, '1,6', 6, 93, '0'),
(18976, '355', 7, 93, '0'),
(18977, '1,16 / 1,0 / 3,1', 8, 93, '0'),
(18978, '1,5', 2, 94, '0'),
(18979, '5-8', 3, 94, '0'),
(18980, '40-80', 4, 94, '0'),
(18981, '440', 5, 94, '0'),
(18982, '1,5', 6, 94, '0'),
(18983, '350', 7, 94, '0'),
(18984, '1,63 / 1,17 / 2,5', 8, 94, '0'),
(18985, '1,5', 2, 95, '0'),
(18986, '5-8', 3, 95, '0'),
(18987, '80-140', 4, 95, '0'),
(18988, '440', 5, 95, '0'),
(18989, '1,5', 6, 95, '0'),
(18990, '425', 7, 95, '0'),
(18991, '1,52 / 1,16 / 3,1', 8, 95, '0'),
(18992, '1,5', 2, 96, '0'),
(18993, '5-8', 3, 96, '0'),
(18994, '40-80', 4, 96, '0'),
(18995, '440', 5, 96, '0'),
(18996, '1,5', 6, 96, '0'),
(18997, '365', 7, 96, '0'),
(18998, '1,56 / 1,17 / 2,6', 8, 96, '0'),
(18999, '1,5', 2, 97, '0'),
(19000, '5-8', 3, 97, '0'),
(19001, '80-140', 4, 97, '0'),
(19002, '440', 5, 97, '0'),
(19003, '1,6', 6, 97, '0'),
(19004, '490', 7, 97, '0'),
(19005, '1,69 / 1,36 / 3,1', 8, 97, '0'),
(19006, '1,5', 2, 98, '0'),
(19007, '5-8', 3, 98, '0'),
(19008, '80-140', 4, 98, '0'),
(19009, '440', 5, 98, '0'),
(19010, '1,6', 6, 98, '0'),
(19011, '435', 7, 98, '0'),
(19012, '1,5 / 1,16 / 3,1', 8, 98, '0'),
(19013, '1,5', 2, 99, '0'),
(19014, '5-8', 3, 99, '0'),
(19015, '80-140', 4, 99, '0'),
(19016, '440', 5, 99, '0'),
(19017, '1,6', 6, 99, '0'),
(19018, '495', 7, 99, '0'),
(19019, '1,66 / 1,36 / 3,1', 8, 99, '0'),
(19020, '1,7', 2, 100, '0'),
(19021, '9', 3, 100, '0'),
(19022, '40-80', 4, 100, '0'),
(19023, '510', 5, 100, '0'),
(19024, '1,5', 6, 100, '0'),
(19025, '355', 7, 100, '0'),
(19026, '1,63 / 1,17 / 2,55', 8, 100, '0'),
(19027, '1,7', 2, 101, '0'),
(19028, '9', 3, 101, '0'),
(19029, '80-140', 4, 101, '0'),
(19030, '510', 5, 101, '0'),
(19031, '1,5', 6, 101, '0'),
(19032, '420', 7, 101, '0'),
(19033, '1,52 / 1,16 / 3,1', 8, 101, '0'),
(19034, '1,7', 2, 102, '0'),
(19035, '9', 3, 102, '0'),
(19036, '40-80', 4, 102, '0'),
(19037, '510', 5, 102, '0'),
(19038, '1,5', 6, 102, '0'),
(19039, '370', 7, 102, '0'),
(19040, '1,56 / 1,17 / 2,6', 8, 102, '0'),
(19041, '1,7', 2, 103, '0'),
(19042, '9', 3, 103, '0'),
(19043, '80-140', 4, 103, '0'),
(19044, '510', 5, 103, '0'),
(19045, '1,6', 6, 103, '0'),
(19046, '460', 7, 103, '0'),
(19047, '1,69 / 1,36 / 3,1', 8, 103, '0'),
(19048, '1,7', 2, 104, '0'),
(19049, '9', 3, 104, '0'),
(19050, '80-140', 4, 104, '0'),
(19051, '510', 5, 104, '0'),
(19052, '1,6', 6, 104, '0'),
(19053, '430', 7, 104, '0'),
(19054, '1,5 / 1,16 / 3,1', 8, 104, '0'),
(19055, '1,7', 2, 105, '0'),
(19056, '9', 3, 105, '0'),
(19057, '80-140', 4, 105, '0'),
(19058, '510', 5, 105, '0'),
(19059, '1,6', 6, 105, '0'),
(19060, '470', 7, 105, '0'),
(19061, '1,66 / 1,36 / 3,1', 8, 105, '0'),
(19062, '2', 2, 106, '0'),
(19063, '8-10', 3, 106, '0'),
(19064, '40-80', 4, 106, '0'),
(19065, '760', 5, 106, '0'),
(19066, '2', 6, 106, '0'),
(19067, '485', 7, 106, '0'),
(19068, '2,1 / 1,18 / 2,5', 8, 106, '0'),
(19069, '2', 2, 107, '0'),
(19070, '8-10', 3, 107, '0'),
(19071, '40-80', 4, 107, '0'),
(19072, '760', 5, 107, '0'),
(19073, '2', 6, 107, '0'),
(19074, '505', 7, 107, '0'),
(19075, '2,03 / 1,18 / 2,6', 8, 107, '0'),
(19076, '2', 2, 108, '0'),
(19077, '8-10', 3, 108, '0'),
(19078, '80-140', 4, 108, '0'),
(19079, '760', 5, 108, '0'),
(19080, '2', 6, 108, '0'),
(19081, '555', 7, 108, '0'),
(19082, '2,02 / 1,16 / 3,1', 8, 108, '0'),
(19083, '2', 2, 109, '0'),
(19084, '8-10', 3, 109, '0'),
(19085, '80-140', 4, 109, '0'),
(19086, '760', 5, 109, '0'),
(19087, '2,1', 6, 109, '0'),
(19088, '595', 7, 109, '0'),
(19089, '2,0 / 1,36 / 3,1', 8, 109, '0'),
(19090, '2', 2, 110, '0'),
(19091, '8-10', 3, 110, '0'),
(19092, '80-140', 4, 110, '0'),
(19093, '760', 5, 110, '0'),
(19094, '2,1', 6, 110, '0'),
(19095, '565', 7, 110, '0'),
(19096, '2,0 / 1,16 / 3,1', 8, 110, '0'),
(19097, '2', 2, 111, '0'),
(19098, '8-10', 3, 111, '0'),
(19099, '80-140', 4, 111, '0'),
(19100, '760', 5, 111, '0'),
(19101, '2,1', 6, 111, '0'),
(19102, '605', 7, 111, '0'),
(19103, '2,0 / 1,36 / 3,1', 8, 111, '0'),
(19104, '2,2', 2, 112, '0'),
(19105, '12', 3, 112, '0'),
(19106, '40-80', 4, 112, '0'),
(19107, '830', 5, 112, '0'),
(19108, '2', 6, 112, '0'),
(19109, '490', 7, 112, '0'),
(19110, '2,1 / 1,18 / 2,55', 8, 112, '0'),
(19111, '2,2', 2, 113, '0'),
(19112, '12', 3, 113, '0'),
(19113, '80-140', 4, 113, '0'),
(19114, '830', 5, 113, '0'),
(19115, '2', 6, 113, '0'),
(19116, '560', 7, 113, '0'),
(19117, '2,02 / 1,16 / 3,1', 8, 113, '0'),
(19118, '2,2', 2, 114, '0'),
(19119, '12', 3, 114, '0'),
(19120, '40-80', 4, 114, '0'),
(19121, '830', 5, 114, '0'),
(19122, '2', 6, 114, '0'),
(19123, '505', 7, 114, '0'),
(19124, '2,03 / 1,18 / 2,6', 8, 114, '0'),
(19125, '2,2', 2, 115, '0'),
(19126, '12', 3, 115, '0'),
(19127, '80-140', 4, 115, '0'),
(19128, '830', 5, 115, '0'),
(19129, '2,1', 6, 115, '0'),
(19130, '600', 7, 115, '0'),
(19131, '2,11 / 1,36 / 3,1', 8, 115, '0'),
(19132, '2,2', 2, 116, '0'),
(19133, '12', 3, 116, '0'),
(19134, '80-140', 4, 116, '0'),
(19135, '830', 5, 116, '0'),
(19136, '2', 6, 116, '0'),
(19137, '560', 7, 116, '0'),
(19138, '2,02 / 1,16 / 3,1', 8, 116, '0'),
(19139, '2,2', 2, 117, '0'),
(19140, '12', 3, 117, '0'),
(19141, '80-140', 4, 117, '0'),
(19142, '830', 5, 117, '0'),
(19143, '2,1', 6, 117, '0'),
(19144, '610', 7, 117, '0'),
(19145, '2,0 /1,36 / 3,1', 8, 117, '0'),
(19146, '3', 2, 118, '0'),
(19147, '15', 3, 118, '0'),
(19148, '80-140', 4, 118, '0'),
(19149, '850', 5, 118, '0'),
(19150, '2,9', 6, 118, '0'),
(19151, '665', 7, 118, '0'),
(19152, '2,03 / 1,36 / 3,1', 8, 118, '0'),
(19153, '3', 2, 119, '0'),
(19154, '15', 3, 119, '0'),
(19155, '40-80', 4, 119, '0'),
(19156, '850', 5, 119, '0'),
(19157, '2,9', 6, 119, '0'),
(19158, '565', 7, 119, '0'),
(19159, '2,03 / 1,18 / 2,6', 8, 119, '0'),
(19160, '3', 2, 120, '0'),
(19161, '15', 3, 120, '0'),
(19162, '80-140', 4, 120, '0'),
(19163, '850', 5, 120, '0'),
(19164, '2,9', 6, 120, '0'),
(19165, '615', 7, 120, '0'),
(19166, '2,02 / 1,16 / 3,1', 8, 120, '0'),
(19167, '3', 2, 121, '0'),
(19168, '15', 3, 121, '0'),
(19169, '40-80', 4, 121, '0'),
(19170, '850', 5, 121, '0'),
(19171, '2,9', 6, 121, '0'),
(19172, '550', 7, 121, '0'),
(19173, '2,1 / 1,18 / 2,5', 8, 121, '0'),
(19174, '3', 2, 122, '0'),
(19175, '15', 3, 122, '0'),
(19176, '80-140', 4, 122, '0'),
(19177, '850', 5, 122, '0'),
(19178, '3,2', 6, 122, '0'),
(19179, '655', 7, 122, '0'),
(19180, '2,11 / 1,36 / 3,1', 8, 122, '0'),
(19181, '3', 2, 123, '0'),
(19182, '15', 3, 123, '0'),
(19183, '80-140', 4, 123, '0'),
(19184, '850', 5, 123, '0'),
(19185, '3,2', 6, 123, '0'),
(19186, '625', 7, 123, '0'),
(19187, '2,0 / 1,16 / 3,1', 8, 123, '0'),
(19188, '4', 2, 124, '0'),
(19189, '15-20', 3, 124, '0'),
(19190, '40-80', 4, 124, '0'),
(19191, '1000', 5, 124, '0'),
(19192, '2,9', 6, 124, '0'),
(19193, '695', 7, 124, '0'),
(19194, '2,3 /1,7 / 2,6', 8, 124, '0'),
(19195, '4', 2, 125, '0'),
(19196, '15-20', 3, 125, '0'),
(19197, '80-140', 4, 125, '0'),
(19198, '1000', 5, 125, '0'),
(19199, '3,2', 6, 125, '0'),
(19200, '785', 7, 125, '0'),
(19201, '2,3 /1,7 /3,0', 8, 125, '0'),
(19202, '4', 2, 126, '0'),
(19203, '15-20', 3, 126, '0'),
(19204, '40-80', 4, 126, '0'),
(19205, '1000', 5, 126, '0'),
(19206, '2,9', 6, 126, '0'),
(19207, '775', 7, 126, '0'),
(19208, '2,2 / 1,7 / 2,6', 8, 126, '0'),
(19209, '4', 2, 127, '0'),
(19210, '15-20', 3, 127, '0'),
(19211, '80-140', 4, 127, '0'),
(19212, '1000', 5, 127, '0'),
(19213, '3,2', 6, 127, '0'),
(19214, '775', 7, 127, '0'),
(19215, '2,3 /1,7 /3,0', 8, 127, '0'),
(19216, '6', 2, 128, '0'),
(19217, '30', 3, 128, '0'),
(19218, '40-80', 4, 128, '0'),
(19219, '1200', 5, 128, '0'),
(19220, '3,6', 6, 128, '0'),
(19221, '830', 7, 128, '0'),
(19222, '2,3 / 2,2 / 2,6', 8, 128, '0'),
(19223, '6', 2, 129, '0'),
(19224, '30', 3, 129, '0'),
(19225, '80-125', 4, 129, '0'),
(19226, '1200', 5, 129, '0'),
(19227, '4,1', 6, 129, '0'),
(19228, '890', 7, 129, '0'),
(19229, '2,2 / 2,2 / 3,0', 8, 129, '0'),
(19230, '6', 2, 130, '0'),
(19231, '30', 3, 130, '0'),
(19232, '80-125', 4, 130, '0'),
(19233, '1200', 5, 130, '0'),
(19234, '4,1', 6, 130, '0'),
(19235, '890', 7, 130, '0'),
(19236, '2,3 / 2,2 / 3,0', 8, 130, '0'),
(19237, '6', 2, 131, '0'),
(19238, '30', 3, 131, '0'),
(19239, '40-80', 4, 131, '0'),
(19240, '1200', 5, 131, '0'),
(19241, '3,6', 6, 131, '0'),
(19242, '840', 7, 131, '0'),
(19243, '2,2 / 2,2 / 2,6', 8, 131, '0'),
(19244, '7', 2, 132, '0'),
(19245, '40', 3, 132, '0'),
(19246, '40-80', 4, 132, '0'),
(19247, '1300', 5, 132, '0'),
(19248, '6,3', 6, 132, '0'),
(19249, '970', 7, 132, '0'),
(19250, '2,2 / 2,2 / 3,1', 8, 132, '0'),
(19251, '7', 2, 133, '0'),
(19252, '40', 3, 133, '0'),
(19253, '75-125', 4, 133, '0'),
(19254, '1300', 5, 133, '0'),
(19255, '5,8', 6, 133, '0'),
(19256, '960', 7, 133, '0'),
(19257, '2,3 x 2,2 x 3,0', 8, 133, '0'),
(19258, '9', 2, 134, '0'),
(19259, '50', 3, 134, '0'),
(19260, '40-80', 4, 134, '0'),
(19261, '1500', 5, 134, '0'),
(19262, '8', 6, 134, '0'),
(19263, '1225', 7, 134, '0'),
(19264, '3,3 / 2,2 /3,0', 8, 134, '0'),
(19265, '9', 2, 135, '0'),
(19266, '50', 3, 135, '0'),
(19267, '40-80', 4, 135, '0'),
(19268, '1500', 5, 135, '0'),
(19269, '7,2', 6, 135, '0'),
(19270, '1225', 7, 135, '0'),
(19271, '3,3 / 2,2 / 3,0', 8, 135, '0'),
(19272, '12', 2, 136, '0'),
(19273, '75', 3, 136, '0'),
(19274, '40-80', 4, 136, '0'),
(19275, '2250', 5, 136, '0'),
(19276, '11,8', 6, 136, '0'),
(19277, '1620', 7, 136, '0'),
(19278, '4,2 / 2,2 / 3,0', 8, 136, '0'),
(19279, '12', 2, 137, '0'),
(19280, '75', 3, 137, '0'),
(19281, '40-80', 4, 137, '0'),
(19282, '2250', 5, 137, '0'),
(19283, '10,8', 6, 137, '0'),
(19284, '1545', 7, 137, '0'),
(19285, '4,3 / 2,2 / 3,0', 8, 137, '0'),
(19286, '16', 2, 138, '0'),
(19287, '100', 3, 138, '0'),
(19288, '40-80', 4, 138, '0'),
(19289, '3000', 5, 138, '0'),
(19290, '14,4', 6, 138, '0'),
(19291, '1970', 7, 138, '0'),
(19292, '3,3 / 4,7 / 3,0', 8, 138, '0'),
(19293, '16', 2, 139, '0'),
(19294, '100', 3, 139, '0'),
(19295, '40-80', 4, 139, '0'),
(19296, '3000', 5, 139, '0'),
(19297, '15,7', 6, 139, '0'),
(19298, '2045', 7, 139, '0'),
(19299, '3,2 / 4,7 / 3,0', 8, 139, '0'),
(19300, '24', 2, 140, '0'),
(19301, '150', 3, 140, '0'),
(19302, '40-80', 4, 140, '0'),
(19303, '4500', 5, 140, '0'),
(19304, '23,6', 6, 140, '0'),
(19305, '3330', 7, 140, '0'),
(19306, '4,2 / 4,6 /3,0', 8, 140, '0'),
(19307, '24', 2, 141, '0'),
(19308, '150', 3, 141, '0'),
(19309, '40-80', 4, 141, '0'),
(19310, '4500', 5, 141, '0'),
(19311, '21,6', 6, 141, '0'),
(19312, '3290', 7, 141, '0'),
(19313, '4,3 / 4,6 /3,0', 8, 141, '0'),
(19314, '3', 2, 142, '0'),
(19315, '10-15', 3, 142, '0'),
(19316, '45-85', 4, 142, '0'),
(19317, '1025', 5, 142, '0'),
(19318, '5', 6, 142, '0'),
(19319, '605', 7, 142, '0'),
(19320, '2,4 / 1,2 /2,5', 8, 142, '0'),
(19321, '3', 2, 143, '0'),
(19322, '10-15', 3, 143, '0'),
(19323, '105-145', 4, 143, '0'),
(19324, '1025', 5, 143, '0'),
(19325, '5', 6, 143, '0'),
(19326, '685', 7, 143, '0'),
(19327, '2,35 / 1,2 / 3,1', 8, 143, '0'),
(19328, '3', 2, 144, '0'),
(19329, '10-15', 3, 144, '0'),
(19330, '55-95', 4, 144, '0'),
(19331, '1025', 5, 144, '0'),
(19332, '5,2', 6, 144, '0'),
(19333, '655', 7, 144, '0'),
(19334, '2,3 / 1,2 / 2,6', 8, 144, '0'),
(19335, '3', 2, 145, '0'),
(19336, '10-15', 3, 145, '0'),
(19337, '105-145', 4, 145, '0'),
(19338, '1025', 5, 145, '0'),
(19339, '5,2', 6, 145, '0'),
(19340, '715', 7, 145, '0'),
(19341, '2,3 / 1,2 /3,1', 8, 145, '0'),
(19342, '3', 2, 146, '0'),
(19343, '10-15', 3, 146, '0'),
(19344, '105-145', 4, 146, '0'),
(19345, '1025', 5, 146, '0'),
(19346, '5', 6, 146, '0'),
(19347, '740', 7, 146, '0'),
(19348, '2,45 / 1,40 / 3,1', 8, 146, '0'),
(19349, '3', 2, 147, '0'),
(19350, '10-15', 3, 147, '0'),
(19351, '80-140', 4, 147, '0'),
(19352, '1025', 5, 147, '0'),
(19353, '5,2', 6, 147, '0'),
(19354, '745', 7, 147, '0'),
(19355, '2,35 / 1,4 / 3,1', 8, 147, '0'),
(19356, '4', 2, 148, '0'),
(19357, '15-20', 3, 148, '0'),
(19358, '40-80', 4, 148, '0'),
(19359, '1200', 5, 148, '0'),
(19360, '5,8', 6, 148, '0'),
(19361, '670', 7, 148, '0'),
(19362, '2,2 / 1,65 / 2,6', 8, 148, '0'),
(19363, '4', 2, 149, '0'),
(19364, '15-20', 3, 149, '0'),
(19365, '80-140', 4, 149, '0'),
(19366, '1200', 5, 149, '0'),
(19367, '5,8', 6, 149, '0'),
(19368, '785', 7, 149, '0'),
(19369, '2,1 /1,9 / 3,0', 8, 149, '0'),
(19370, '4', 2, 150, '0'),
(19371, '15-20', 3, 150, '0'),
(19372, '40-80', 4, 150, '0'),
(19373, '1200', 5, 150, '0'),
(19374, '6,3', 6, 150, '0'),
(19375, '665', 7, 150, '0'),
(19376, '2,1 / 1,65 / 2,6', 8, 150, '0'),
(19377, '4', 2, 151, '0'),
(19378, '15-20', 3, 151, '0'),
(19379, '80-140', 4, 151, '0'),
(19380, '1200', 5, 151, '0'),
(19381, '5,8', 6, 151, '0'),
(19382, '780', 7, 151, '0'),
(19383, '2,15 / 1,9 /3,0', 8, 151, '0'),
(19384, '4', 2, 152, '0'),
(19385, '15-20', 3, 152, '0'),
(19386, '80-140', 4, 152, '0'),
(19387, '1200', 5, 152, '0'),
(19388, '6,3', 6, 152, '0'),
(19389, '785', 7, 152, '0'),
(19390, '2,05 / 1,9 / 3,0', 8, 152, '0'),
(19391, '4', 2, 153, '0'),
(19392, '15-20', 3, 153, '0'),
(19393, '80-140', 4, 153, '0'),
(19394, '1200', 5, 153, '0'),
(19395, '6,3', 6, 153, '0'),
(19396, '790', 7, 153, '0'),
(19397, '2,05 / 1,9 / 3,0', 8, 153, '0'),
(19398, '6', 2, 154, '0'),
(19399, '20-30', 3, 154, '0'),
(19400, '55-95', 4, 154, '0'),
(19401, '1300', 5, 154, '0'),
(19402, '6,5', 6, 154, '0'),
(19403, '705', 7, 154, '0'),
(19404, '2,2 / 2,15 / 2,6', 8, 154, '0'),
(19405, '6', 2, 155, '0'),
(19406, '20-30', 3, 155, '0'),
(19407, '95-125', 4, 155, '0'),
(19408, '1300', 5, 155, '0'),
(19409, '5,8', 6, 155, '0'),
(19410, '960', 7, 155, '0'),
(19411, '2,3 / 2,2 / 3,0', 8, 155, '0'),
(19412, '6', 2, 156, '0'),
(19413, '20-30', 3, 156, '0'),
(19414, '90-125', 4, 156, '0'),
(19415, '1300', 5, 156, '0'),
(19416, '6,5', 6, 156, '0'),
(19417, '915', 7, 156, '0'),
(19418, '2,3 / 2,2 / 3,0', 8, 156, '0'),
(19419, '6', 2, 157, '0'),
(19420, '20-30', 3, 157, '0'),
(19421, '55-95', 4, 157, '0'),
(19422, '1300', 5, 157, '0'),
(19423, '7', 6, 157, '0'),
(19424, '775', 7, 157, '0'),
(19425, '2,1 / 2,15 / 2,6', 8, 157, '0'),
(19426, '6', 2, 158, '0'),
(19427, '20-30', 3, 158, '0'),
(19428, '90-125', 4, 158, '0'),
(19429, '1300', 5, 158, '0'),
(19430, '7', 6, 158, '0'),
(19431, '930', 7, 158, '0'),
(19432, '2,2 / 2,2 / 3,0', 8, 158, '0'),
(19433, '6', 2, 159, '0'),
(19434, '20-30', 3, 159, '0'),
(19435, '90-125', 4, 159, '0'),
(19436, '1300', 5, 159, '0'),
(19437, '7', 6, 159, '0'),
(19438, '1110', 7, 159, '0'),
(19439, '2,2 / 2,2 / 3,0', 8, 159, '0'),
(19440, '7', 2, 160, '0'),
(19441, '30-40', 3, 160, '0'),
(19442, '40-80', 4, 160, '0'),
(19443, '1500', 5, 160, '0'),
(19444, '7', 6, 160, '0'),
(19445, '920', 7, 160, '0'),
(19446, '2,2 / 2,2 / 3,0', 8, 160, '0'),
(19447, '7', 2, 161, '0'),
(19448, '30-40', 3, 161, '0'),
(19449, '40-80', 4, 161, '0'),
(19450, '1500', 5, 161, '0'),
(19451, '7,6', 6, 161, '0'),
(19452, '955', 7, 161, '0'),
(19453, '2,2 / 2,2 / 3,0', 8, 161, '0'),
(19454, '9', 2, 162, '0'),
(19455, '40-50', 3, 162, '0'),
(19456, '40-80', 4, 162, '0'),
(19457, '2250', 5, 162, '0'),
(19458, '10,1', 6, 162, '0'),
(19459, '1305', 7, 162, '0'),
(19460, '3,2 / 2,2 / 3,0', 8, 162, '0'),
(19461, '9', 2, 163, '0'),
(19462, '40-50', 3, 163, '0'),
(19463, '40-80', 4, 163, '0'),
(19464, '2250', 5, 163, '0'),
(19465, '10,9', 6, 163, '0'),
(19466, '1330', 7, 163, '0'),
(19467, '3,2 / 2,2 / 3,0', 8, 163, '0'),
(19468, '12', 2, 164, '0'),
(19469, '50-75', 3, 164, '0'),
(19470, '40-80', 4, 164, '0'),
(19471, '3000', 5, 164, '0'),
(19472, '12,8', 6, 164, '0'),
(19473, '1605', 7, 164, '0'),
(19474, '4,2 / 2,2/ 3,0', 8, 164, '0'),
(19475, '12', 2, 165, '0'),
(19476, '50-75', 3, 165, '0'),
(19477, '40-80', 4, 165, '0'),
(19478, '3000', 5, 165, '0'),
(19479, '13,8', 6, 165, '0'),
(19480, '1620', 7, 165, '0'),
(19481, '4,2 / 2,2 /3,0', 8, 165, '0'),
(19482, '16', 2, 166, '0'),
(19483, '75-100', 3, 166, '0'),
(19484, '40-80', 4, 166, '0'),
(19485, '4500', 5, 166, '0'),
(19486, '16,4', 6, 166, '0'),
(19487, '1940', 7, 166, '0'),
(19488, '5,3 / 2,2 / 3,0', 8, 166, '0'),
(19489, '16', 2, 167, '0'),
(19490, '75-100', 3, 167, '0'),
(19491, '40-80', 4, 167, '0'),
(19492, '4500', 5, 167, '0'),
(19493, '17,6', 6, 167, '0'),
(19494, '2000', 7, 167, '0'),
(19495, '5,2 / 2,2 / 3,0', 8, 167, '0'),
(19496, '24', 2, 168, '0'),
(19497, '100-150', 3, 168, '0'),
(19498, '40-80', 4, 168, '0'),
(19499, '6000', 5, 168, '0'),
(19500, '25,6', 6, 168, '0'),
(19501, '3300', 7, 168, '0'),
(19502, '4,2 / 4,6 / 3,0', 8, 168, '0'),
(19503, '24', 2, 169, '0'),
(19504, '100-150', 3, 169, '0'),
(19505, '40-80', 4, 169, '0'),
(19506, '6000', 5, 169, '0'),
(19507, '27,6', 6, 169, '0'),
(19508, '3300', 7, 169, '0'),
(19509, '4,2 / 4,6 / 3,0', 8, 169, '0'),
(19510, '32', 2, 170, '0'),
(19511, '150-200', 3, 170, '0'),
(19512, '40-80', 4, 170, '0'),
(19513, '9000', 5, 170, '0'),
(19514, '32,8', 6, 170, '0'),
(19515, '3965', 7, 170, '0'),
(19516, '5,3 / 4,6 / 3,0', 8, 170, '0'),
(19517, '32', 2, 171, '0'),
(19518, '150-200', 3, 171, '0'),
(19519, '40-80', 4, 171, '0'),
(19520, '9000', 5, 171, '0'),
(19521, '35,2', 6, 171, '0'),
(19522, '4080', 7, 171, '0'),
(19523, '5,2 / 4,6 / 3,0', 8, 171, '0'),
(19524, '1,5', 2, 172, '0'),
(19525, '3-6', 3, 172, '0'),
(19526, '1,6 / 1,2 / 3,0', 8, 172, '0'),
(19527, '0,8', 2, 173, '0'),
(19528, '3', 3, 173, '0'),
(19529, '69', 7, 173, '0'),
(19530, '1,5 / 1,5', 8, 173, '0'),
(19531, '0,6', 2, 174, '0'),
(19532, '3', 3, 174, '0'),
(19533, '0,6', 2, 175, '0'),
(19534, '3', 3, 175, '0'),
(19535, '72', 7, 175, '0'),
(19536, '1,5 / 1', 8, 175, '0'),
(19537, '0,8', 2, 176, '0'),
(19538, '4', 3, 176, '0'),
(19539, '78', 7, 176, '0'),
(19540, '1,8 / 1', 8, 176, '0'),
(19541, '1', 2, 177, '0'),
(19542, '5', 3, 177, '0'),
(19543, '84', 7, 177, '0'),
(19544, '02.янв', 8, 177, '0'),
(19545, '1,5', 2, 178, '0'),
(19546, '8', 3, 178, '0'),
(19547, '147', 7, 178, '0'),
(19548, '03.янв', 8, 178, '0'),
(19549, '2,4', 2, 179, '0'),
(19550, '12', 3, 179, '0'),
(19551, '281', 7, 179, '0'),
(19552, '3 / 1,45', 8, 179, '0'),
(19553, '3', 2, 180, '0'),
(19554, '15', 3, 180, '0'),
(19555, '314', 7, 180, '0'),
(19556, '4 / 1,45', 8, 180, '0'),
(19557, '4', 2, 181, '0'),
(19558, '20', 3, 181, '0'),
(19559, '455', 7, 181, '0'),
(19560, '4,5 / 2', 8, 181, '0'),
(19561, '0,6', 2, 182, '0'),
(19562, '3', 3, 182, '0'),
(19563, '135', 7, 182, '0'),
(19564, '1,4', 8, 182, '0'),
(19565, '0,8', 2, 183, '0'),
(19566, '4', 3, 183, '0'),
(19567, '148', 7, 183, '0'),
(19568, '1,4', 8, 183, '0'),
(19569, '1', 2, 184, '0'),
(19570, '5', 3, 184, '0'),
(19571, '165', 7, 184, '0'),
(19572, '1,4', 8, 184, '0'),
(19573, '1,3', 2, 185, '0'),
(19574, '6', 3, 185, '0'),
(19575, '185', 7, 185, '0'),
(19576, '1,6', 8, 185, '0'),
(19577, '1,6', 2, 186, '0'),
(19578, '8', 3, 186, '0'),
(19579, '206', 7, 186, '0'),
(19580, '1,8', 8, 186, '0'),
(19581, '2', 2, 187, '0'),
(19582, '10', 3, 187, '0'),
(19583, '216', 7, 187, '0'),
(19584, '2', 8, 187, '0'),
(19585, '2,4', 2, 188, '0'),
(19586, '12', 3, 188, '0'),
(19587, '235', 7, 188, '0'),
(19588, '2', 8, 188, '0'),
(19589, '3', 2, 189, '0'),
(19590, '15', 3, 189, '0'),
(19591, '285', 7, 189, '0'),
(19592, '2', 8, 189, '0'),
(19593, '4', 2, 190, '0'),
(19594, '20', 3, 190, '0'),
(19595, '302', 7, 190, '0'),
(19596, '2,3', 8, 190, '0'),
(19597, '3', 2, 202, '0'),
(19598, '2', 3, 202, '0'),
(19599, '140', 7, 202, '0'),
(19600, '1,4', 8, 202, '0'),
(19601, '4', 2, 203, '0'),
(19602, '2', 3, 203, '0'),
(19603, '153', 7, 203, '0'),
(19604, '1,4', 8, 203, '0'),
(19605, '5', 2, 204, '0'),
(19606, '2', 3, 204, '0'),
(19607, '170', 7, 204, '0'),
(19608, '1,4', 8, 204, '0'),
(19609, '6', 2, 205, '0'),
(19610, '3', 3, 205, '0'),
(19611, '190', 7, 205, '0'),
(19612, '1,3', 8, 205, '0'),
(19613, '8', 2, 206, '0'),
(19614, '4', 3, 206, '0'),
(19615, '211', 7, 206, '0'),
(19616, '1,8', 8, 206, '0'),
(19617, '10', 2, 207, '0'),
(19618, '5', 3, 207, '0'),
(19619, '221', 7, 207, '0'),
(19620, '2', 8, 207, '0'),
(19621, '12', 2, 208, '0'),
(19622, '6', 3, 208, '0'),
(19623, '240', 7, 208, '0'),
(19624, '2', 8, 208, '0'),
(19625, '15', 2, 209, '0'),
(19626, '7', 3, 209, '0'),
(19627, '290', 7, 209, '0'),
(19628, '2', 8, 209, '0'),
(19629, '20', 2, 210, '0'),
(19630, '10', 3, 210, '0'),
(19631, '307', 7, 210, '0'),
(19632, '2,3', 8, 210, '0'),
(19633, '0,6', 2, 191, '0'),
(19634, '3', 3, 191, '0'),
(19635, '155', 7, 191, '0'),
(19636, '2,1', 8, 191, '0'),
(19637, '0,8', 2, 192, '0'),
(19638, '4', 3, 192, '0'),
(19639, '155', 7, 192, '0'),
(19640, '1,3', 8, 192, '0'),
(19641, '1', 2, 193, '0'),
(19642, '5', 3, 193, '0'),
(19643, '176', 7, 193, '0'),
(19644, '1,3', 8, 193, '0'),
(19645, '1,3', 2, 194, '0'),
(19646, '6', 3, 194, '0'),
(19647, '182', 7, 194, '0'),
(19648, '1,4', 8, 194, '0'),
(19649, '1,6', 2, 195, '0'),
(19650, '8', 3, 195, '0'),
(19651, '192', 7, 195, '0'),
(19652, '1,5', 8, 195, '0'),
(19653, '2', 2, 196, '0'),
(19654, '10', 3, 196, '0'),
(19655, '225', 7, 196, '0'),
(19656, '1,7', 8, 196, '0'),
(19657, '2,4', 2, 197, '0'),
(19658, '12', 3, 197, '0'),
(19659, '225', 7, 197, '0'),
(19660, '1,8', 8, 197, '0'),
(19661, '3', 2, 198, '0'),
(19662, '15', 3, 198, '0'),
(19663, '261', 7, 198, '0'),
(19664, '2', 8, 198, '0'),
(19665, '4', 2, 199, '0'),
(19666, '20', 3, 199, '0'),
(19667, '277', 7, 199, '0'),
(19668, '2', 8, 199, '0'),
(19669, '5', 2, 200, '0'),
(19670, '25', 3, 200, '0'),
(19671, '327', 7, 200, '0'),
(19672, '2', 8, 200, '0'),
(19673, '6', 2, 201, '0'),
(19674, '30', 3, 201, '0'),
(19675, '360', 7, 201, '0'),
(19676, '2,1', 8, 201, '0'),
(19677, '3', 2, 211, '0'),
(19678, '2', 3, 211, '0'),
(19679, '165', 7, 211, '0'),
(19680, '2,1', 8, 211, '0'),
(19681, '4', 2, 212, '0'),
(19682, '2', 3, 212, '0'),
(19683, '162', 7, 212, '0'),
(19684, '1,3', 8, 212, '0'),
(19685, '5', 2, 213, '0'),
(19686, '2', 3, 213, '0'),
(19687, '183', 7, 213, '0'),
(19688, '1,3', 8, 213, '0'),
(19689, '6', 2, 214, '0'),
(19690, '3', 3, 214, '0'),
(19691, '189', 7, 214, '0'),
(19692, '1,4', 8, 214, '0'),
(19693, '8', 2, 215, '0'),
(19694, '4', 3, 215, '0'),
(19695, '199', 7, 215, '0'),
(19696, '1,5', 8, 215, '0'),
(19697, '10', 2, 216, '0'),
(19698, '5', 3, 216, '0'),
(19699, '232', 7, 216, '0'),
(19700, '1,7', 8, 216, '0'),
(19701, '12', 2, 217, '0'),
(19702, '6', 3, 217, '0'),
(19703, '232', 7, 217, '0'),
(19704, '1,8', 8, 217, '0'),
(19705, '15', 2, 218, '0'),
(19706, '7', 3, 218, '0'),
(19707, '268', 7, 218, '0'),
(19708, '2', 8, 218, '0'),
(19709, '20', 2, 219, '0'),
(19710, '10', 3, 219, '0'),
(19711, '284', 7, 219, '0'),
(19712, '2', 8, 219, '0'),
(19713, '25', 2, 220, '0'),
(19714, '12', 3, 220, '0'),
(19715, '334', 7, 220, '0'),
(19716, '2', 8, 220, '0'),
(19717, '30', 2, 221, '0'),
(19718, '15', 3, 221, '0'),
(19719, '367', 7, 221, '0'),
(19720, '2,1', 8, 221, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_param_select`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_param_select` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `value` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значений дополнительных характеристик товаров типа список';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_price`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_price` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `good_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `price` double unsigned NOT NULL DEFAULT '0' COMMENT 'цена',
  `old_price` double unsigned NOT NULL DEFAULT '0' COMMENT 'исходная цена',
  `count_goods` double NOT NULL DEFAULT '0' COMMENT 'количество товара',
  `price_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор исходной цены из таблицы `diafan_shop_price`',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала действия',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания действия',
  `discount` double NOT NULL DEFAULT '0' COMMENT 'скидка',
  `discount_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `person` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'цена действует только для определенных пользователей: 0 - нет, 1 - да',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`, для которого действует скидка',
  `currency_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор валюты из таблицы `diafan_shop_currency`',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор при импорте',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=3279 DEFAULT CHARSET=utf8 COMMENT='Цены товаров';

--
-- Dumping data for table `diafan_shop_price`
--

INSERT INTO `diafan_shop_price` (`id`, `good_id`, `price`, `old_price`, `count_goods`, `price_id`, `date_start`, `date_finish`, `discount`, `discount_id`, `person`, `role_id`, `currency_id`, `import_id`, `trash`) VALUES
(24, 4, 78900, 0, 0, 24, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(25, 7, 89700, 0, 0, 25, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(26, 9, 113900, 0, 0, 26, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2590, 51, 94500, 0, 0, 2590, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2591, 52, 94185, 0, 0, 2591, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2592, 53, 119595, 0, 0, 2592, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2593, 54, 107100, 0, 0, 2593, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2594, 55, 134295, 0, 0, 2594, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2595, 56, 101430, 0, 0, 2595, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2596, 57, 123270, 0, 0, 2596, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2597, 58, 112560, 0, 0, 2597, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2598, 59, 137760, 0, 0, 2598, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2599, 60, 122745, 0, 0, 2599, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2600, 61, 139755, 0, 0, 2600, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2601, 62, 135555, 0, 0, 2601, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2602, 63, 154245, 0, 0, 2602, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2603, 64, 154875, 0, 0, 2603, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2604, 65, 169365, 0, 0, 2604, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2605, 66, 127785, 0, 0, 2605, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2606, 67, 145425, 0, 0, 2606, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2607, 68, 167475, 0, 0, 2607, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2608, 69, 138495, 0, 0, 2608, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2609, 70, 158550, 0, 0, 2609, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2610, 71, 179445, 0, 0, 2610, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2611, 72, 159180, 0, 0, 2611, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2612, 73, 180495, 0, 0, 2612, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2613, 74, 210315, 0, 0, 2613, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2614, 75, 171885, 0, 0, 2614, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2615, 76, 203175, 0, 0, 2615, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2616, 77, 221655, 0, 0, 2616, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2617, 78, 163380, 0, 0, 2617, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2618, 79, 176505, 0, 0, 2618, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2619, 80, 211365, 0, 0, 2619, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2620, 81, 183645, 0, 0, 2620, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2621, 82, 205275, 0, 0, 2621, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2622, 83, 222390, 0, 0, 2622, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2623, 84, 95760, 0, 0, 2623, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2624, 85, 105840, 0, 0, 2624, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2625, 86, 108045, 0, 0, 2625, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2626, 87, 133665, 0, 0, 2626, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2627, 88, 118965, 0, 0, 2627, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2628, 89, 148575, 0, 0, 2628, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2629, 90, 111930, 0, 0, 2629, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2630, 91, 123480, 0, 0, 2630, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2631, 92, 137760, 0, 0, 2631, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2632, 93, 154770, 0, 0, 2632, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2633, 94, 135975, 0, 0, 2633, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2634, 95, 153405, 0, 0, 2634, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2635, 96, 147735, 0, 0, 2635, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2636, 97, 168735, 0, 0, 2636, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2637, 98, 168735, 0, 0, 2637, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2638, 99, 184485, 0, 0, 2638, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2639, 100, 138285, 0, 0, 2639, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2640, 101, 158235, 0, 0, 2640, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2641, 102, 149205, 0, 0, 2641, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2642, 103, 180705, 0, 0, 2642, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2643, 104, 171465, 0, 0, 2643, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2644, 105, 193095, 0, 0, 2644, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2645, 106, 177030, 0, 0, 2645, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2646, 107, 188475, 0, 0, 2646, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2647, 108, 199185, 0, 0, 2647, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2648, 109, 229635, 0, 0, 2648, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2649, 110, 221445, 0, 0, 2649, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2650, 111, 241605, 0, 0, 2650, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2651, 112, 181020, 0, 0, 2651, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2652, 113, 203175, 0, 0, 2652, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2653, 114, 194355, 0, 0, 2653, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2654, 115, 230685, 0, 0, 2654, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2655, 116, 223125, 0, 0, 2655, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2656, 117, 243285, 0, 0, 2656, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2657, 118, 281085, 0, 0, 2657, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2658, 119, 236880, 0, 0, 2658, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2659, 120, 241500, 0, 0, 2659, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2660, 121, 210630, 0, 0, 2660, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2661, 122, 261765, 0, 0, 2661, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2662, 123, 259980, 0, 0, 2662, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2663, 124, 280875, 0, 0, 2663, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2664, 125, 330645, 0, 0, 2664, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2665, 126, 298515, 0, 0, 2665, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2666, 127, 311535, 0, 0, 2666, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2667, 128, 352590, 0, 0, 2667, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2668, 129, 387450, 0, 0, 2668, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2669, 130, 367605, 0, 0, 2669, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2670, 131, 368760, 0, 0, 2670, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2671, 132, 469770, 0, 0, 2671, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2672, 133, 455070, 0, 0, 2672, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2673, 134, 520170, 0, 0, 2673, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2674, 135, 502950, 0, 0, 2674, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2675, 136, 636720, 0, 0, 2675, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2676, 137, 616140, 0, 0, 2676, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2677, 138, 829395, 0, 0, 2677, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2678, 139, 860895, 0, 0, 2678, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2679, 140, 1273230, 0, 0, 2679, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2680, 141, 1232070, 0, 0, 2680, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2681, 142, 235935, 0, 0, 2681, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2682, 143, 261555, 0, 0, 2682, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2683, 144, 257985, 0, 0, 2683, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2684, 145, 280875, 0, 0, 2684, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2685, 146, 287280, 0, 0, 2685, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2686, 147, 304080, 0, 0, 2686, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2687, 148, 300510, 0, 0, 2687, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2688, 149, 336210, 0, 0, 2688, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2689, 150, 318360, 0, 0, 2689, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2690, 151, 367815, 0, 0, 2690, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2691, 152, 356790, 0, 0, 2691, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2692, 153, 382725, 0, 0, 2692, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2693, 154, 381465, 0, 0, 2693, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2694, 155, 403515, 0, 0, 2694, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2695, 156, 443730, 0, 0, 2695, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2696, 157, 397845, 0, 0, 2696, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2697, 158, 424830, 0, 0, 2697, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2698, 159, 480795, 0, 0, 2698, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2699, 160, 459270, 0, 0, 2699, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2700, 161, 474810, 0, 0, 2700, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2701, 162, 573405, 0, 0, 2701, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2702, 163, 601755, 0, 0, 2702, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2703, 164, 698775, 0, 0, 2703, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2704, 165, 719355, 0, 0, 2704, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2705, 166, 997185, 0, 0, 2705, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2706, 167, 1009785, 0, 0, 2706, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2707, 168, 1397340, 0, 0, 2707, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2708, 169, 1438710, 0, 0, 2708, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2709, 170, 1989960, 0, 0, 2709, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2710, 171, 2016315, 0, 0, 2710, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2711, 172, 129780, 0, 0, 2711, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2712, 173, 27300, 0, 0, 2712, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2713, 174, 33600, 0, 0, 2713, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2714, 175, 33600, 0, 0, 2714, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2715, 176, 38850, 0, 0, 2715, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2716, 177, 45150, 0, 0, 2716, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2717, 178, 55650, 0, 0, 2717, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2718, 179, 79800, 0, 0, 2718, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2719, 180, 101850, 0, 0, 2719, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2720, 181, 141750, 0, 0, 2720, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2721, 182, 59850, 0, 0, 2721, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2722, 183, 65100, 0, 0, 2722, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2723, 184, 71400, 0, 0, 2723, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2724, 185, 79800, 0, 0, 2724, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2725, 186, 98700, 0, 0, 2725, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2726, 187, 121800, 0, 0, 2726, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2727, 188, 135450, 0, 0, 2727, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2728, 189, 153300, 0, 0, 2728, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2729, 190, 180600, 0, 0, 2729, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2730, 202, 67200, 0, 0, 2730, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2731, 203, 72450, 0, 0, 2731, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2732, 204, 77700, 0, 0, 2732, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2733, 205, 86100, 0, 0, 2733, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2734, 206, 72450, 0, 0, 2734, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2735, 207, 130200, 0, 0, 2735, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2736, 208, 142800, 0, 0, 2736, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2737, 209, 162750, 0, 0, 2737, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2738, 210, 130200, 0, 0, 2738, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2739, 191, 70350, 0, 0, 2739, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2740, 192, 76650, 0, 0, 2740, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2741, 193, 82950, 0, 0, 2741, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2742, 194, 91350, 0, 0, 2742, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2743, 195, 103950, 0, 0, 2743, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2744, 196, 126000, 0, 0, 2744, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2745, 197, 142800, 0, 0, 2745, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2746, 198, 162750, 0, 0, 2746, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2747, 199, 202650, 0, 0, 2747, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2748, 200, 236250, 0, 0, 2748, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2749, 201, 252000, 0, 0, 2749, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2750, 211, 76650, 0, 0, 2750, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2751, 212, 82950, 0, 0, 2751, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2752, 213, 89250, 0, 0, 2752, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2753, 214, 97650, 0, 0, 2753, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2754, 215, 110250, 0, 0, 2754, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2755, 216, 133350, 0, 0, 2755, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2756, 217, 150150, 0, 0, 2756, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2757, 218, 170100, 0, 0, 2757, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2758, 219, 215250, 0, 0, 2758, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2759, 220, 252000, 0, 0, 2759, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2760, 221, 236250, 0, 0, 2760, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(2762, 50, 84210, 0, 0, 2762, 0, 0, 0, 0, '0', 0, 0, '', '0'),
(3107, 50, 75789, 84210, 0, 2762, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3108, 51, 85050, 94500, 0, 2590, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3109, 52, 84766.5, 94185, 0, 2591, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3110, 53, 107635.5, 119595, 0, 2592, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3111, 54, 96390, 107100, 0, 2593, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3112, 55, 120865.5, 134295, 0, 2594, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3113, 56, 91287, 101430, 0, 2595, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3114, 57, 110943, 123270, 0, 2596, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3115, 58, 101304, 112560, 0, 2597, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3116, 59, 123984, 137760, 0, 2598, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3117, 60, 110470.5, 122745, 0, 2599, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3118, 61, 125779.5, 139755, 0, 2600, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3119, 62, 121999.5, 135555, 0, 2601, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3120, 63, 138820.5, 154245, 0, 2602, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3121, 64, 139387.5, 154875, 0, 2603, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3122, 65, 152428.5, 169365, 0, 2604, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3123, 66, 115006.5, 127785, 0, 2605, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3124, 67, 130882.5, 145425, 0, 2606, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3125, 68, 150727.5, 167475, 0, 2607, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3126, 69, 124645.5, 138495, 0, 2608, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3127, 70, 142695, 158550, 0, 2609, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3128, 71, 161500.5, 179445, 0, 2610, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3129, 72, 143262, 159180, 0, 2611, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3130, 73, 162445.5, 180495, 0, 2612, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3131, 74, 189283.5, 210315, 0, 2613, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3132, 75, 154696.5, 171885, 0, 2614, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3133, 76, 182857.5, 203175, 0, 2615, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3134, 77, 199489.5, 221655, 0, 2616, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3135, 78, 147042, 163380, 0, 2617, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3136, 79, 158854.5, 176505, 0, 2618, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3137, 80, 190228.5, 211365, 0, 2619, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3138, 81, 165280.5, 183645, 0, 2620, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3139, 82, 184747.5, 205275, 0, 2621, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3140, 83, 200151, 222390, 0, 2622, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3141, 84, 86184, 95760, 0, 2623, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3142, 85, 95256, 105840, 0, 2624, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3143, 86, 97240.5, 108045, 0, 2625, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3144, 87, 120298.5, 133665, 0, 2626, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3145, 88, 107068.5, 118965, 0, 2627, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3146, 89, 133717.5, 148575, 0, 2628, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3147, 90, 100737, 111930, 0, 2629, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3148, 91, 111132, 123480, 0, 2630, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3149, 92, 123984, 137760, 0, 2631, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3150, 93, 139293, 154770, 0, 2632, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3151, 94, 122377.5, 135975, 0, 2633, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3152, 95, 138064.5, 153405, 0, 2634, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3153, 96, 132961.5, 147735, 0, 2635, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3154, 97, 151861.5, 168735, 0, 2636, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3155, 98, 151861.5, 168735, 0, 2637, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3156, 99, 166036.5, 184485, 0, 2638, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3157, 100, 124456.5, 138285, 0, 2639, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3158, 101, 142411.5, 158235, 0, 2640, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3159, 102, 134284.5, 149205, 0, 2641, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3160, 103, 162634.5, 180705, 0, 2642, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3161, 104, 154318.5, 171465, 0, 2643, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3162, 105, 173785.5, 193095, 0, 2644, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3163, 106, 159327, 177030, 0, 2645, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3164, 107, 169627.5, 188475, 0, 2646, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3165, 108, 179266.5, 199185, 0, 2647, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3166, 109, 206671.5, 229635, 0, 2648, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3167, 110, 199300.5, 221445, 0, 2649, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3168, 111, 217444.5, 241605, 0, 2650, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3169, 112, 162918, 181020, 0, 2651, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3170, 113, 182857.5, 203175, 0, 2652, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3171, 114, 174919.5, 194355, 0, 2653, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3172, 115, 207616.5, 230685, 0, 2654, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3173, 116, 200812.5, 223125, 0, 2655, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3174, 117, 218956.5, 243285, 0, 2656, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3175, 118, 252976.5, 281085, 0, 2657, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3176, 119, 213192, 236880, 0, 2658, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3177, 120, 217350, 241500, 0, 2659, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3178, 121, 189567, 210630, 0, 2660, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3179, 122, 235588.5, 261765, 0, 2661, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3180, 123, 233982, 259980, 0, 2662, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3181, 124, 252787.5, 280875, 0, 2663, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3182, 125, 297580.5, 330645, 0, 2664, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3183, 126, 268663.5, 298515, 0, 2665, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3184, 127, 280381.5, 311535, 0, 2666, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3185, 128, 317331, 352590, 0, 2667, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3186, 129, 348705, 387450, 0, 2668, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3187, 130, 330844.5, 367605, 0, 2669, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3188, 131, 331884, 368760, 0, 2670, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3189, 132, 422793, 469770, 0, 2671, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3190, 133, 409563, 455070, 0, 2672, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3191, 134, 468153, 520170, 0, 2673, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3192, 135, 452655, 502950, 0, 2674, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3193, 136, 573048, 636720, 0, 2675, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3194, 137, 554526, 616140, 0, 2676, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3195, 138, 746455.5, 829395, 0, 2677, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3196, 139, 774805.5, 860895, 0, 2678, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3197, 140, 1145907, 1273230, 0, 2679, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3198, 141, 1108863, 1232070, 0, 2680, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3199, 142, 212341.5, 235935, 0, 2681, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3200, 143, 235399.5, 261555, 0, 2682, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3201, 144, 232186.5, 257985, 0, 2683, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3202, 145, 252787.5, 280875, 0, 2684, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3203, 146, 258552, 287280, 0, 2685, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3204, 147, 273672, 304080, 0, 2686, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3205, 148, 270459, 300510, 0, 2687, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3206, 149, 302589, 336210, 0, 2688, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3207, 150, 286524, 318360, 0, 2689, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3208, 151, 331033.5, 367815, 0, 2690, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3209, 152, 321111, 356790, 0, 2691, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3210, 153, 344452.5, 382725, 0, 2692, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3211, 154, 343318.5, 381465, 0, 2693, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3212, 155, 363163.5, 403515, 0, 2694, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3213, 156, 399357, 443730, 0, 2695, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3214, 157, 358060.5, 397845, 0, 2696, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3215, 158, 382347, 424830, 0, 2697, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3216, 159, 432715.5, 480795, 0, 2698, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3217, 160, 413343, 459270, 0, 2699, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3218, 161, 427329, 474810, 0, 2700, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3219, 162, 516064.5, 573405, 0, 2701, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3220, 163, 541579.5, 601755, 0, 2702, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3221, 164, 628897.5, 698775, 0, 2703, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3222, 165, 647419.5, 719355, 0, 2704, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3223, 166, 897466.5, 997185, 0, 2705, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3224, 167, 908806.5, 1009785, 0, 2706, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3225, 168, 1257606, 1397340, 0, 2707, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3226, 169, 1294839, 1438710, 0, 2708, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3227, 170, 1790964, 1989960, 0, 2709, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3228, 171, 1814683.5, 2016315, 0, 2710, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3229, 172, 116802, 129780, 0, 2711, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3230, 173, 24570, 27300, 0, 2712, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3231, 174, 30240, 33600, 0, 2713, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3232, 175, 30240, 33600, 0, 2714, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3233, 176, 34965, 38850, 0, 2715, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3234, 177, 40635, 45150, 0, 2716, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3235, 178, 50085, 55650, 0, 2717, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3236, 179, 71820, 79800, 0, 2718, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3237, 180, 91665, 101850, 0, 2719, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3238, 181, 127575, 141750, 0, 2720, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3239, 182, 53865, 59850, 0, 2721, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3240, 183, 58590, 65100, 0, 2722, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3241, 184, 64260, 71400, 0, 2723, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3242, 185, 71820, 79800, 0, 2724, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3243, 186, 88830, 98700, 0, 2725, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3244, 187, 109620, 121800, 0, 2726, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3245, 188, 121905, 135450, 0, 2727, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3246, 189, 137970, 153300, 0, 2728, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3247, 190, 162540, 180600, 0, 2729, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3248, 191, 63315, 70350, 0, 2739, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3249, 192, 68985, 76650, 0, 2740, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3250, 193, 74655, 82950, 0, 2741, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3251, 194, 82215, 91350, 0, 2742, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3252, 195, 93555, 103950, 0, 2743, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3253, 196, 113400, 126000, 0, 2744, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3254, 197, 128520, 142800, 0, 2745, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3255, 198, 146475, 162750, 0, 2746, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3256, 199, 182385, 202650, 0, 2747, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3257, 200, 212625, 236250, 0, 2748, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3258, 201, 226800, 252000, 0, 2749, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3259, 202, 60480, 67200, 0, 2730, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3260, 203, 65205, 72450, 0, 2731, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3261, 204, 69930, 77700, 0, 2732, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3262, 205, 77490, 86100, 0, 2733, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3263, 206, 65205, 72450, 0, 2734, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3264, 207, 117180, 130200, 0, 2735, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3265, 208, 128520, 142800, 0, 2736, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3266, 209, 146475, 162750, 0, 2737, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3267, 210, 117180, 130200, 0, 2738, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3268, 211, 68985, 76650, 0, 2750, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3269, 212, 74655, 82950, 0, 2751, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3270, 213, 80325, 89250, 0, 2752, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3271, 214, 87885, 97650, 0, 2753, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3272, 215, 99225, 110250, 0, 2754, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3273, 216, 120015, 133350, 0, 2755, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3274, 217, 135135, 150150, 0, 2756, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3275, 218, 153090, 170100, 0, 2757, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3276, 219, 193725, 215250, 0, 2758, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3277, 220, 226800, 252000, 0, 2759, 0, 0, 10, 1, '0', 0, 0, '', '0'),
(3278, 221, 212625, 236250, 0, 2760, 0, 0, 10, 1, '0', 0, 0, '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_price_image_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_price_image_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `price_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор исходной цены из таблицы `diafan_shop_price`',
  `image_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор изображения из таблицы `diafan_images`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Изображения товаров, прикрепленные к цене';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_price_param`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_price_param` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `price_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор исходной цены из таблицы `diafan_shop_price`',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `param_value` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'значение характеристики - идентификатор из таблицы `diafan_shop_param_select`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительные характеристики, учитываемые в цене';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `rel_element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор похожего товара из таблицы `diafan_shop`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Связи похожих товаров';

--
-- Dumping data for table `diafan_shop_rel`
--

INSERT INTO `diafan_shop_rel` (`id`, `element_id`, `rel_element_id`, `trash`) VALUES
(1, 1, 2, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_waitlist`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_waitlist` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `good_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `lang_id` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'e-mail пользователя',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `param` text COMMENT 'серилизованные данные о характеристиках товара (доступных к выбору при заказе)',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в списке ожидания';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_shop_wishlist`
--

CREATE TABLE IF NOT EXISTS `diafan_shop_wishlist` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `good_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'номер сессии пользователя из таблицы `diafan_sessions`',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `count` double unsigned NOT NULL DEFAULT '0' COMMENT 'количество товара',
  `param` text COMMENT 'серилизованные данные о характеристиках товара (доступных к выбору при заказе)',
  `additional_cost` text COMMENT 'идентификаторы сопутствующих услугах, разделенные запятой',
  `is_file` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'товар-файл: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в списке пожеланий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_site`
--

CREATE TABLE IF NOT EXISTS `diafan_site` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_site`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных страниц',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `text1` longtext COMMENT 'контент',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший страницу в административной части',
  `title_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не копировать заголовок в H1: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `search_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не участвует в поисковой выдаче: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'прикрепленный модуль',
  `js` text COMMENT 'JS-код',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='Страницы сайта';

--
-- Dumping data for table `diafan_site`
--

INSERT INTO `diafan_site` (`id`, `parent_id`, `count_children`, `name1`, `title_meta1`, `keywords1`, `descr1`, `canonical1`, `text1`, `act1`, `access`, `date_start`, `date_finish`, `admin_id`, `title_no_show`, `map_no_show`, `changefreq`, `priority`, `noindex`, `search_no_show`, `sort`, `timeedit`, `theme`, `module_name`, `js`, `trash`) VALUES
(1, 0, 0, 'Главная страница', '', '', NULL, '', '<p><strong>Добро пожаловать на наш новый сайт!</strong></p>\n				<p>Здесь можно найти много чего интересного:</p>\n				<ul>\n				<li>каталог товаров (интернет-магазин)</li>\n				<li>вопрос-ответ</li>\n				<li>новости</li>\n				<li>файловый архив</li>\n				<li>фотогалерея</li>\n				</ul>\n				<p>и много-многое другое!</p>', '1', '0', 0, 0, 0, '1', '0', 'always', '', '0', '0', 1, 1500639156, 'site_start.php', '', NULL, '0'),
(2, 0, 6, 'Полезное', '', '', NULL, '', '<insert name="show_links" module="site">', '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 2, 1500639156, '', '', NULL, '0'),
(3, 0, 6, 'Страница пользователя', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 5, 1500639157, '', 'userpage', NULL, '0'),
(4, 0, 3, 'О компании', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 1, 1500639156, '', '', NULL, '0'),
(5, 2, 0, 'Объявления', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 5, 1500639156, '', 'ab', NULL, '0'),
(6, 3, 0, 'Баланс', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 6, 1500639156, '', 'balance', NULL, '0'),
(7, 2, 0, 'Статьи', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 7, 1500639156, '', 'clauses', NULL, '0'),
(8, 4, 0, 'Вопрос-Ответ', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 8, 1500639156, '', 'faq', NULL, '0'),
(9, 4, 0, 'Обратная связь', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 9, 1500639156, '', 'feedback', NULL, '0'),
(10, 2, 0, 'Файловый архив', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 10, 1500639156, '', 'files', NULL, '0'),
(11, 2, 0, 'Форум', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 11, 1500639156, '', 'forum', NULL, '0'),
(12, 0, 0, 'Карта сайта', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 12, 1500639156, '', 'map', NULL, '0'),
(13, 3, 0, 'Сообщения', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 13, 1500639156, '', 'messages', NULL, '0'),
(14, 2, 0, 'Новости', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 14, 1500639156, '', 'news', NULL, '0'),
(15, 2, 0, 'Фотогалерея', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 15, 1500639156, '', 'photo', NULL, '0'),
(16, 4, 0, 'Отзывы', '', '', NULL, '', '<insert name="show" module="reviews">', '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 16, 1500639157, '', 'reviews', NULL, '0'),
(17, 0, 0, 'Поиск', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 17, 1500639157, '', 'search', NULL, '0'),
(18, 0, 6, 'Интернет-магазин', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 4, 1500639157, '', 'shop', NULL, '0'),
(19, 18, 0, 'Корзина', '', '', NULL, '', '<insert name="show_add_coupon" module="shop">', '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 19, 1500639157, '', 'cart', NULL, '0'),
(20, 18, 0, 'Заказ оформлен', '', '', NULL, '', '<p>Спасибо за Ваш заказ! В ближайшее время мы свяжемся с Вами!</p><insert name="show_last_order" module="cart">', '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 20, 1500639157, '', '', NULL, '0'),
(21, 18, 0, 'Отложенные', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 21, 1500639157, '', 'wishlist', NULL, '0'),
(22, 0, 0, 'Рассылки', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 22, 1500639157, '', 'subscribtion', NULL, '0'),
(23, 0, 0, 'Теги', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 23, 1500639157, '', 'tags', NULL, '0'),
(24, 3, 0, 'Регистрация', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 24, 1500639157, '', 'registration', NULL, '0'),
(25, 3, 0, 'Восстановление доступа', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 25, 1500639157, '', 'reminding', NULL, '0'),
(26, 3, 0, 'Настройки аккаунта', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 26, 1500639157, '', 'usersettings', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_site_blocks`
--

CREATE TABLE IF NOT EXISTS `diafan_site_blocks` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text COMMENT 'описание',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `title_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать заголовок: 0 - нет, 1 - да',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший блок в административной части',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Блоки на сайте';

--
-- Dumping data for table `diafan_site_blocks`
--

INSERT INTO `diafan_site_blocks` (`id`, `name1`, `text1`, `act1`, `access`, `title_no_show`, `date_start`, `date_finish`, `admin_id`, `sort`, `timeedit`, `trash`) VALUES
(1, 'Телефон в шапке сайта', '495 567-09-12', '1', '0', '1', 0, 0, 0, 1, 1500639156, '0'),
(2, 'Контакты в футере', 'г. Москва, ул. Людвига Великого,<br>д. 12, стр. 1, офис 12<br>Тел.: 8 495  121-21-12<br>E-mail: info@demosite.ru', '1', '0', '1', 0, 0, 0, 2, 1500639156, '0'),
(3, 'Блок о доставке в карточке товара', '<p>Доставка бесплатная*<br>*до 3000 - 300 рублей</p>', '1', '0', '1', 0, 0, 0, 3, 1500639156, '0'),
(4, 'Блок о возврате в карточке товара', '<p>14 дней возврат/обмен<br> 2 года гарантия</p>', '1', '0', '1', 0, 0, 0, 4, 1500639156, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_site_blocks_site_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_site_blocks_site_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор блока из таблицы `diafan_site_blocks`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Данные о том, на каких страницах выводятся блоки на сайте';

--
-- Dumping data for table `diafan_site_blocks_site_rel`
--

INSERT INTO `diafan_site_blocks_site_rel` (`id`, `element_id`, `site_id`, `trash`) VALUES
(1, 1, 0, '0'),
(2, 2, 0, '0'),
(3, 3, 0, '0'),
(4, 4, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_site_dynamic`
--

CREATE TABLE IF NOT EXISTS `diafan_site_dynamic` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `text` text COMMENT 'описание',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `title_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать заголовок: 0 - нет, 1 - да',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший блок в административной части',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Динамические блоки';

--
-- Dumping data for table `diafan_site_dynamic`
--

INSERT INTO `diafan_site_dynamic` (`id`, `name1`, `text`, `act1`, `type`, `access`, `title_no_show`, `date_start`, `date_finish`, `admin_id`, `sort`, `timeedit`, `trash`) VALUES
(1, 'Источник новости и автор текста', NULL, '1', 'editor', '0', '0', 0, 0, 0, 1, 1500639156, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_site_dynamic_element`
--

CREATE TABLE IF NOT EXISTS `diafan_site_dynamic_element` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `dynamic_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор динамического блока из таблицы `diafan_site_dynamic`',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `element_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип элемента',
  `value1` text COMMENT 'значение',
  `parent` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'применить к элементам категории: 0 - нет, 1 - да',
  `category` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'применить к вложенным элементам: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Контент динамических блоков, заполенный в элементах модулей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_site_dynamic_module`
--

CREATE TABLE IF NOT EXISTS `diafan_site_dynamic_module` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `dynamic_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор динамического блока из таблицы `diafan_site_dynamic`',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип элемента',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Данные о том, в каких модулях заполняются динамические блоки';

--
-- Dumping data for table `diafan_site_dynamic_module`
--

INSERT INTO `diafan_site_dynamic_module` (`id`, `dynamic_id`, `module_name`, `element_type`, `trash`) VALUES
(1, 1, 'news', 'element', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_site_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_site_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы из таблицы `diafan_site`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы-родителя из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Родительские связи страниц сайта';

--
-- Dumping data for table `diafan_site_parents`
--

INSERT INTO `diafan_site_parents` (`id`, `element_id`, `parent_id`, `trash`) VALUES
(1, 5, 2, '0'),
(2, 6, 3, '0'),
(3, 7, 2, '0'),
(4, 8, 4, '0'),
(5, 9, 4, '0'),
(6, 10, 2, '0'),
(7, 11, 2, '0'),
(8, 13, 3, '0'),
(9, 14, 2, '0'),
(10, 15, 2, '0'),
(11, 16, 4, '0'),
(12, 19, 18, '0'),
(13, 20, 18, '0'),
(14, 21, 18, '0'),
(15, 24, 3, '0'),
(16, 25, 3, '0'),
(17, 26, 3, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_subscribtion`
--

CREATE TABLE IF NOT EXISTS `diafan_subscribtion` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `send` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'рассылка отправлена: 0 - нет, 1 - да',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_subscribtion_category`',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text` text COMMENT 'текст рассылки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Рассылки';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_subscribtion_category`
--

CREATE TABLE IF NOT EXISTS `diafan_subscribtion_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `text1` text COMMENT 'описание',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_subscribtion_category`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество вложенных категорий',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории рассылок';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_subscribtion_category_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_subscribtion_category_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_subscribtion_category`',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя категории из таблицы `diafan_subscribtion_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий рассылок';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_subscribtion_category_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_subscribtion_category_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор рассылки из таблицы `diafan_subscribtion`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_subscribtion_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи рассылок и категорий';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_subscribtion_emails`
--

CREATE TABLE IF NOT EXISTS `diafan_subscribtion_emails` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата добавления',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'имя',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'e-mail',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT 'код доступа к управлению подпиской',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'получает рассылку: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подписчики на рассылку';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_subscribtion_emails_cat_unrel`
--

CREATE TABLE IF NOT EXISTS `diafan_subscribtion_emails_cat_unrel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор подписчика из таблицы `diafan_subscribtion_emails`',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор категории из таблицы `diafan_subscribtion_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Отключенные категории рассылок у подписчиков';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_subscribtion_phones`
--

CREATE TABLE IF NOT EXISTS `diafan_subscribtion_phones` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата добавления',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'имя',
  `phone` varchar(64) NOT NULL DEFAULT '' COMMENT 'телефон',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'получает рассылку: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Телефоны для рассылок';

--
-- Dumping data for table `diafan_subscribtion_phones`
--

INSERT INTO `diafan_subscribtion_phones` (`id`, `created`, `name`, `phone`, `act`, `trash`) VALUES
(1, 0, '1500641647', '', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_subscribtion_sms`
--

CREATE TABLE IF NOT EXISTS `diafan_subscribtion_sms` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `send` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'рассылка отправлена: 0 - нет, 1 - да',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text` text COMMENT 'текст',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SMS-рассылки';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_tags`
--

CREATE TABLE IF NOT EXISTS `diafan_tags` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `tags_name_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор тега из таблицы `diafan_tags_name`',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ к элементу ограничен',
  `date_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата начала показа',
  `date_finish` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата окончания показа',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи тегов и элементов модулей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_tags_name`
--

CREATE TABLE IF NOT EXISTS `diafan_tags_name` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(70) NOT NULL DEFAULT '' COMMENT 'тег',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Теги';

--
-- Dumping data for table `diafan_tags_name`
--

INSERT INTO `diafan_tags_name` (`id`, `name1`, `map_no_show`, `sort`, `changefreq`, `priority`, `noindex`, `trash`) VALUES
(1, 'Топас-с', '0', 1, 'always', '', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_trash`
--

CREATE TABLE IF NOT EXISTS `diafan_trash` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `table_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название таблицы удаленного элемента',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля удаленного элемента',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор удаленного элемента',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата удаления',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор родителя из таблицы `diafan_trash`',
  `count_children` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество удаленных вместе с текущей записей',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Корзина с удаленными элементами';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_trash_parents`
--

CREATE TABLE IF NOT EXISTS `diafan_trash_parents` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор записи из таблицы `diafan_trash` об удалении элемента',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор записи-родителя из таблицы `diafan_trash` об удалении элемента'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи в корзине (какое удаление влечет за собой другое)';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_update_return`
--

CREATE TABLE IF NOT EXISTS `diafan_update_return` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `current` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'текущая точка: 0 - нет, 1 - да',
  `hash` varchar(100) NOT NULL DEFAULT '' COMMENT 'уникальный хэш',
  `text` text COMMENT 'описание'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Точки возврата';

--
-- Dumping data for table `diafan_update_return`
--

INSERT INTO `diafan_update_return` (`id`, `name`, `created`, `current`, `hash`, `text`) VALUES
(1, 'Установка', 1500639157, '1', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `diafan_users`
--

CREATE TABLE IF NOT EXISTS `diafan_users` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT 'логин',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT 'пароль в зашифрованном виде',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'e-mail',
  `phone` varchar(64) NOT NULL DEFAULT '' COMMENT 'телефон',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата регистрации',
  `fio` varchar(255) NOT NULL DEFAULT '' COMMENT 'ФИО',
  `role_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'активен на сайте: 0 - нет, 1 - да',
  `htmleditor` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'использовать визуальный редактор: 0 - нет, 1 - да',
  `copy_files` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'cохранять картинки с внешних сайтов, при вставке контента в визуальный редактор: 0 - нет, 1 - да',
  `useradmin` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT 'панель быстрого редактирования: 0 - отключена, 1 - включена, 2 - только панель без режима редактирования',
  `start_admin` varchar(30) NOT NULL DEFAULT '' COMMENT 'стартовая страница административной части',
  `lang_id` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `admin_nastr` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'колечество элементов на странице в административной части',
  `identity` varchar(255) NOT NULL DEFAULT '' COMMENT 'URL на страницу в соц. сети',
  `config` text COMMENT 'Настройки пользователя',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Dumping data for table `diafan_users`
--

INSERT INTO `diafan_users` (`id`, `name`, `password`, `mail`, `phone`, `created`, `fio`, `role_id`, `act`, `htmleditor`, `copy_files`, `useradmin`, `start_admin`, `lang_id`, `admin_nastr`, `identity`, `config`, `trash`) VALUES
(1, 'admin-septik', 'dc14473db251f0116bd2a423fc945b37', 'testservices92@gmail.com', '', 1497960720, 'Иванов Иван', 3, '1', '1', '1', '0', '', 0, 500, '', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_users_actlink`
--

CREATE TABLE IF NOT EXISTS `diafan_users_actlink` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT 'код активации',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'дата создания',
  `count` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'количество неудачных попыток'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Код активации аккаунта';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_users_param`
--

CREATE TABLE IF NOT EXISTS `diafan_users_param` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text COMMENT 'описание',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `show_in_page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводить на странице пользователя: 0 - нет, 1 - да',
  `show_in_form_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводить в форме редактирования данных для авторизованных пользователей: 0 - нет, 1 - да',
  `show_in_form_no_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводить в форме регистрации: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `config` text COMMENT 'серилизованные данные о настройках поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительные поля с данными о пользователях';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_users_param_element`
--

CREATE TABLE IF NOT EXISTS `diafan_users_param_element` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `value` text COMMENT 'значение',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор поля из таблицы `diafan_users_param`',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения дополнительных полей с данными о пользователях';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_users_param_role_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_users_param_role_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор поля из таблицы `diafan_users_param`',
  `role_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи дополнительных полей с данными о пользователях и типов пользователей';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_users_param_select`
--

CREATE TABLE IF NOT EXISTS `diafan_users_param_select` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор поля из таблицы `diafan_users_param`',
  `value` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значений дополнительных полей с данными о пользователях для типа список';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_users_role`
--

CREATE TABLE IF NOT EXISTS `diafan_users_role` (
  `id` tinyint(3) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` varchar(64) NOT NULL DEFAULT '' COMMENT 'название',
  `registration` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'задавать при регистрации: 0 - нет, 1 - да',
  `only_self` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'видеть только свои материалы: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Типы пользователей';

--
-- Dumping data for table `diafan_users_role`
--

INSERT INTO `diafan_users_role` (`id`, `name1`, `registration`, `only_self`, `sort`, `trash`) VALUES
(1, 'Пользователь', '1', '0', 1, '0'),
(2, 'Модератор', '0', '0', 2, '0'),
(3, 'Администратор', '0', '0', 3, '0');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_users_role_perm`
--

CREATE TABLE IF NOT EXISTS `diafan_users_role_perm` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `role_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`',
  `perm` text COMMENT 'права на действия: all, init, edit, del',
  `rewrite` text COMMENT 'тег доступа (например, название модуля)',
  `type` enum('site','admin') NOT NULL DEFAULT 'admin' COMMENT 'часть сайта: site - пользовательская, admin - административная'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Права типов пользователей';

--
-- Dumping data for table `diafan_users_role_perm`
--

INSERT INTO `diafan_users_role_perm` (`id`, `role_id`, `perm`, `rewrite`, `type`) VALUES
(1, 3, 'all', 'all', 'admin'),
(2, 3, 'edit', 'useradmin', 'site'),
(3, 3, 'moderator', 'forum', 'site');

-- --------------------------------------------------------

--
-- Table structure for table `diafan_votes`
--

CREATE TABLE IF NOT EXISTS `diafan_votes` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `name1` text COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `no_result` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать результаты: 0 - нет, 1 - да',
  `userversion` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'пользователи могут дать свой вариант ответа: 0 - нет, 1 - да',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Опросы';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_votes_answers`
--

CREATE TABLE IF NOT EXISTS `diafan_votes_answers` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `text1` text COMMENT 'описание',
  `votes_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор вопроса из таблицы `diafan_votes`',
  `count_votes` int(5) unsigned NOT NULL DEFAULT '0' COMMENT 'количество ответов',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты ответов на опросы';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_votes_site_rel`
--

CREATE TABLE IF NOT EXISTS `diafan_votes_site_rel` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор вопроса из таблицы `diafan_votes`',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные о том, на каких страницах сайта выводятся опросы';

-- --------------------------------------------------------

--
-- Table structure for table `diafan_votes_userversion`
--

CREATE TABLE IF NOT EXISTS `diafan_votes_userversion` (
  `id` int(11) unsigned NOT NULL COMMENT 'идентификатор',
  `votes_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'идентификатор вопроса из таблицы `diafan_votes`',
  `text` varchar(250) NOT NULL DEFAULT '' COMMENT 'текст',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты ответов пользователей';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diafan_ab`
--
ALTER TABLE `diafan_ab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `diafan_ab_category`
--
ALTER TABLE `diafan_ab_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_ab_category_parents`
--
ALTER TABLE `diafan_ab_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_ab_category_rel`
--
ALTER TABLE `diafan_ab_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_ab_counter`
--
ALTER TABLE `diafan_ab_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_ab_param`
--
ALTER TABLE `diafan_ab_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_ab_param_category_rel`
--
ALTER TABLE `diafan_ab_param_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_ab_param_element`
--
ALTER TABLE `diafan_ab_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`);

--
-- Indexes for table `diafan_ab_param_select`
--
ALTER TABLE `diafan_ab_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Indexes for table `diafan_ab_rel`
--
ALTER TABLE `diafan_ab_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_access`
--
ALTER TABLE `diafan_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `element_type` (`element_type`);

--
-- Indexes for table `diafan_admin`
--
ALTER TABLE `diafan_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `diafan_admin_parents`
--
ALTER TABLE `diafan_admin_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_attachments`
--
ALTER TABLE `diafan_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Indexes for table `diafan_balance`
--
ALTER TABLE `diafan_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_bs`
--
ALTER TABLE `diafan_bs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_bs_category`
--
ALTER TABLE `diafan_bs_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_bs_site_rel`
--
ALTER TABLE `diafan_bs_site_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_captcha`
--
ALTER TABLE `diafan_captcha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_captcha_answers`
--
ALTER TABLE `diafan_captcha_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `captcha_id` (`captcha_id`);

--
-- Indexes for table `diafan_clauses`
--
ALTER TABLE `diafan_clauses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_clauses_category`
--
ALTER TABLE `diafan_clauses_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_clauses_category_parents`
--
ALTER TABLE `diafan_clauses_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_clauses_category_rel`
--
ALTER TABLE `diafan_clauses_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_clauses_counter`
--
ALTER TABLE `diafan_clauses_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_clauses_rel`
--
ALTER TABLE `diafan_clauses_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_comments`
--
ALTER TABLE `diafan_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Indexes for table `diafan_comments_mail`
--
ALTER TABLE `diafan_comments_mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Indexes for table `diafan_comments_param`
--
ALTER TABLE `diafan_comments_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_comments_param_element`
--
ALTER TABLE `diafan_comments_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`),
  ADD KEY `value` (`value`(5));

--
-- Indexes for table `diafan_comments_param_select`
--
ALTER TABLE `diafan_comments_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Indexes for table `diafan_comments_parents`
--
ALTER TABLE `diafan_comments_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_config`
--
ALTER TABLE `diafan_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_custom`
--
ALTER TABLE `diafan_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_faq`
--
ALTER TABLE `diafan_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_faq_category`
--
ALTER TABLE `diafan_faq_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_faq_category_parents`
--
ALTER TABLE `diafan_faq_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_faq_category_rel`
--
ALTER TABLE `diafan_faq_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_faq_counter`
--
ALTER TABLE `diafan_faq_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_faq_rel`
--
ALTER TABLE `diafan_faq_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_feedback`
--
ALTER TABLE `diafan_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_feedback_param`
--
ALTER TABLE `diafan_feedback_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_feedback_param_element`
--
ALTER TABLE `diafan_feedback_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`),
  ADD KEY `value` (`value`(5));

--
-- Indexes for table `diafan_feedback_param_select`
--
ALTER TABLE `diafan_feedback_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Indexes for table `diafan_files`
--
ALTER TABLE `diafan_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_files_category`
--
ALTER TABLE `diafan_files_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_files_category_parents`
--
ALTER TABLE `diafan_files_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_files_category_rel`
--
ALTER TABLE `diafan_files_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_files_counter`
--
ALTER TABLE `diafan_files_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_files_links`
--
ALTER TABLE `diafan_files_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_files_rel`
--
ALTER TABLE `diafan_files_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_forum`
--
ALTER TABLE `diafan_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `diafan_forum_blocks`
--
ALTER TABLE `diafan_forum_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_forum_category`
--
ALTER TABLE `diafan_forum_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_forum_messages`
--
ALTER TABLE `diafan_forum_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `diafan_forum_messages_parents`
--
ALTER TABLE `diafan_forum_messages_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_forum_show`
--
ALTER TABLE `diafan_forum_show`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `diafan_geomap`
--
ALTER TABLE `diafan_geomap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Indexes for table `diafan_images`
--
ALTER TABLE `diafan_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `element_type` (`element_type`);

--
-- Indexes for table `diafan_images_editor_folders`
--
ALTER TABLE `diafan_images_editor_folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_images_variations`
--
ALTER TABLE `diafan_images_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_keywords`
--
ALTER TABLE `diafan_keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_languages`
--
ALTER TABLE `diafan_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_languages_translate`
--
ALTER TABLE `diafan_languages_translate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_log`
--
ALTER TABLE `diafan_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`(4));

--
-- Indexes for table `diafan_log_note`
--
ALTER TABLE `diafan_log_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `session_id` (`session_id`(2)),
  ADD KEY `include_name` (`include_name`(2)),
  ADD KEY `module_name` (`module_name`(2));

--
-- Indexes for table `diafan_map_index`
--
ALTER TABLE `diafan_map_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_menu`
--
ALTER TABLE `diafan_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `diafan_menu_category`
--
ALTER TABLE `diafan_menu_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_menu_category_site_rel`
--
ALTER TABLE `diafan_menu_category_site_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_menu_parents`
--
ALTER TABLE `diafan_menu_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_messages`
--
ALTER TABLE `diafan_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_messages_user`
--
ALTER TABLE `diafan_messages_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_mistakes`
--
ALTER TABLE `diafan_mistakes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_modules`
--
ALTER TABLE `diafan_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_news`
--
ALTER TABLE `diafan_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_news_category`
--
ALTER TABLE `diafan_news_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_news_category_parents`
--
ALTER TABLE `diafan_news_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_news_category_rel`
--
ALTER TABLE `diafan_news_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_news_counter`
--
ALTER TABLE `diafan_news_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_news_rel`
--
ALTER TABLE `diafan_news_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_payment`
--
ALTER TABLE `diafan_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_payment_history`
--
ALTER TABLE `diafan_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_photo`
--
ALTER TABLE `diafan_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_photo_category`
--
ALTER TABLE `diafan_photo_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_photo_category_parents`
--
ALTER TABLE `diafan_photo_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_photo_category_rel`
--
ALTER TABLE `diafan_photo_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_photo_counter`
--
ALTER TABLE `diafan_photo_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_photo_rel`
--
ALTER TABLE `diafan_photo_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_rating`
--
ALTER TABLE `diafan_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Indexes for table `diafan_redirect`
--
ALTER TABLE `diafan_redirect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `element_type` (`element_type`);

--
-- Indexes for table `diafan_reviews`
--
ALTER TABLE `diafan_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Indexes for table `diafan_reviews_param`
--
ALTER TABLE `diafan_reviews_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_reviews_param_element`
--
ALTER TABLE `diafan_reviews_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`),
  ADD KEY `value` (`value`(5));

--
-- Indexes for table `diafan_reviews_param_select`
--
ALTER TABLE `diafan_reviews_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Indexes for table `diafan_rewrite`
--
ALTER TABLE `diafan_rewrite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_search_history`
--
ALTER TABLE `diafan_search_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_search_index`
--
ALTER TABLE `diafan_search_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keyword_id` (`keyword_id`);

--
-- Indexes for table `diafan_search_keywords`
--
ALTER TABLE `diafan_search_keywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keyword` (`keyword`(3));

--
-- Indexes for table `diafan_search_results`
--
ALTER TABLE `diafan_search_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_sessions`
--
ALTER TABLE `diafan_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `diafan_sessions_hash`
--
ALTER TABLE `diafan_sessions_hash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop`
--
ALTER TABLE `diafan_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `diafan_shop_additional_cost`
--
ALTER TABLE `diafan_shop_additional_cost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_additional_cost_category_rel`
--
ALTER TABLE `diafan_shop_additional_cost_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_shop_additional_cost_rel`
--
ALTER TABLE `diafan_shop_additional_cost_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_shop_brand`
--
ALTER TABLE `diafan_shop_brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_shop_brand_category_rel`
--
ALTER TABLE `diafan_shop_brand_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_shop_cart`
--
ALTER TABLE `diafan_shop_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `diafan_shop_category`
--
ALTER TABLE `diafan_shop_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_shop_category_parents`
--
ALTER TABLE `diafan_shop_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_category_rel`
--
ALTER TABLE `diafan_shop_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_shop_counter`
--
ALTER TABLE `diafan_shop_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_shop_currency`
--
ALTER TABLE `diafan_shop_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_delivery`
--
ALTER TABLE `diafan_shop_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_delivery_thresholds`
--
ALTER TABLE `diafan_shop_delivery_thresholds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_discount`
--
ALTER TABLE `diafan_shop_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_discount_coupon`
--
ALTER TABLE `diafan_shop_discount_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Indexes for table `diafan_shop_discount_object`
--
ALTER TABLE `diafan_shop_discount_object`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Indexes for table `diafan_shop_discount_person`
--
ALTER TABLE `diafan_shop_discount_person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Indexes for table `diafan_shop_files_codes`
--
ALTER TABLE `diafan_shop_files_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_import`
--
ALTER TABLE `diafan_shop_import`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_import_category`
--
ALTER TABLE `diafan_shop_import_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_order`
--
ALTER TABLE `diafan_shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_order_additional_cost`
--
ALTER TABLE `diafan_shop_order_additional_cost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_order_goods`
--
ALTER TABLE `diafan_shop_order_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_order_goods_param`
--
ALTER TABLE `diafan_shop_order_goods_param`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_goods_id` (`order_goods_id`);

--
-- Indexes for table `diafan_shop_order_param`
--
ALTER TABLE `diafan_shop_order_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_order_param_element`
--
ALTER TABLE `diafan_shop_order_param_element`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_order_param_select`
--
ALTER TABLE `diafan_shop_order_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Indexes for table `diafan_shop_order_param_user`
--
ALTER TABLE `diafan_shop_order_param_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_order_status`
--
ALTER TABLE `diafan_shop_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_param`
--
ALTER TABLE `diafan_shop_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_param_category_rel`
--
ALTER TABLE `diafan_shop_param_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_shop_param_element`
--
ALTER TABLE `diafan_shop_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`);

--
-- Indexes for table `diafan_shop_param_select`
--
ALTER TABLE `diafan_shop_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Indexes for table `diafan_shop_price`
--
ALTER TABLE `diafan_shop_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `good_id` (`good_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `diafan_shop_price_image_rel`
--
ALTER TABLE `diafan_shop_price_image_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `diafan_shop_price_param`
--
ALTER TABLE `diafan_shop_price_param`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price_id` (`price_id`),
  ADD KEY `param_id` (`param_id`),
  ADD KEY `param_value` (`param_value`);

--
-- Indexes for table `diafan_shop_rel`
--
ALTER TABLE `diafan_shop_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_waitlist`
--
ALTER TABLE `diafan_shop_waitlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_shop_wishlist`
--
ALTER TABLE `diafan_shop_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `diafan_site`
--
ALTER TABLE `diafan_site`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `diafan_site_blocks`
--
ALTER TABLE `diafan_site_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_site_blocks_site_rel`
--
ALTER TABLE `diafan_site_blocks_site_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `diafan_site_dynamic`
--
ALTER TABLE `diafan_site_dynamic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_site_dynamic_element`
--
ALTER TABLE `diafan_site_dynamic_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dynamic_id` (`dynamic_id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `element_type` (`element_type`);

--
-- Indexes for table `diafan_site_dynamic_module`
--
ALTER TABLE `diafan_site_dynamic_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dynamic_id` (`dynamic_id`);

--
-- Indexes for table `diafan_site_parents`
--
ALTER TABLE `diafan_site_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_subscribtion`
--
ALTER TABLE `diafan_subscribtion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_subscribtion_category`
--
ALTER TABLE `diafan_subscribtion_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `diafan_subscribtion_category_parents`
--
ALTER TABLE `diafan_subscribtion_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_subscribtion_category_rel`
--
ALTER TABLE `diafan_subscribtion_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `diafan_subscribtion_emails`
--
ALTER TABLE `diafan_subscribtion_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_subscribtion_emails_cat_unrel`
--
ALTER TABLE `diafan_subscribtion_emails_cat_unrel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_subscribtion_phones`
--
ALTER TABLE `diafan_subscribtion_phones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_subscribtion_sms`
--
ALTER TABLE `diafan_subscribtion_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_tags`
--
ALTER TABLE `diafan_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `tags_name_id` (`tags_name_id`);

--
-- Indexes for table `diafan_tags_name`
--
ALTER TABLE `diafan_tags_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_trash`
--
ALTER TABLE `diafan_trash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `table_name` (`table_name`(2)),
  ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `diafan_trash_parents`
--
ALTER TABLE `diafan_trash_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_update_return`
--
ALTER TABLE `diafan_update_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_users`
--
ALTER TABLE `diafan_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(1));

--
-- Indexes for table `diafan_users_actlink`
--
ALTER TABLE `diafan_users_actlink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_users_param`
--
ALTER TABLE `diafan_users_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_users_param_element`
--
ALTER TABLE `diafan_users_param_element`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_users_param_role_rel`
--
ALTER TABLE `diafan_users_param_role_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_users_param_select`
--
ALTER TABLE `diafan_users_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Indexes for table `diafan_users_role`
--
ALTER TABLE `diafan_users_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_users_role_perm`
--
ALTER TABLE `diafan_users_role_perm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_votes`
--
ALTER TABLE `diafan_votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_votes_answers`
--
ALTER TABLE `diafan_votes_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_id` (`votes_id`);

--
-- Indexes for table `diafan_votes_site_rel`
--
ALTER TABLE `diafan_votes_site_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diafan_votes_userversion`
--
ALTER TABLE `diafan_votes_userversion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_id` (`votes_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diafan_ab`
--
ALTER TABLE `diafan_ab`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_ab_category`
--
ALTER TABLE `diafan_ab_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_ab_category_parents`
--
ALTER TABLE `diafan_ab_category_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_ab_category_rel`
--
ALTER TABLE `diafan_ab_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_ab_counter`
--
ALTER TABLE `diafan_ab_counter`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_ab_param`
--
ALTER TABLE `diafan_ab_param`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_ab_param_category_rel`
--
ALTER TABLE `diafan_ab_param_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_ab_param_element`
--
ALTER TABLE `diafan_ab_param_element`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_ab_param_select`
--
ALTER TABLE `diafan_ab_param_select`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_ab_rel`
--
ALTER TABLE `diafan_ab_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_access`
--
ALTER TABLE `diafan_access`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_admin`
--
ALTER TABLE `diafan_admin`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `diafan_admin_parents`
--
ALTER TABLE `diafan_admin_parents`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `diafan_attachments`
--
ALTER TABLE `diafan_attachments`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_balance`
--
ALTER TABLE `diafan_balance`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_bs`
--
ALTER TABLE `diafan_bs`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_bs_category`
--
ALTER TABLE `diafan_bs_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_bs_site_rel`
--
ALTER TABLE `diafan_bs_site_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_captcha`
--
ALTER TABLE `diafan_captcha`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_captcha_answers`
--
ALTER TABLE `diafan_captcha_answers`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_clauses`
--
ALTER TABLE `diafan_clauses`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_clauses_category`
--
ALTER TABLE `diafan_clauses_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_clauses_category_parents`
--
ALTER TABLE `diafan_clauses_category_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_clauses_category_rel`
--
ALTER TABLE `diafan_clauses_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_clauses_counter`
--
ALTER TABLE `diafan_clauses_counter`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_clauses_rel`
--
ALTER TABLE `diafan_clauses_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_comments`
--
ALTER TABLE `diafan_comments`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_comments_mail`
--
ALTER TABLE `diafan_comments_mail`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_comments_param`
--
ALTER TABLE `diafan_comments_param`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_comments_param_element`
--
ALTER TABLE `diafan_comments_param_element`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_comments_param_select`
--
ALTER TABLE `diafan_comments_param_select`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_comments_parents`
--
ALTER TABLE `diafan_comments_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_config`
--
ALTER TABLE `diafan_config`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=554;
--
-- AUTO_INCREMENT for table `diafan_custom`
--
ALTER TABLE `diafan_custom`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_faq`
--
ALTER TABLE `diafan_faq`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_faq_category`
--
ALTER TABLE `diafan_faq_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_faq_category_parents`
--
ALTER TABLE `diafan_faq_category_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_faq_category_rel`
--
ALTER TABLE `diafan_faq_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_faq_counter`
--
ALTER TABLE `diafan_faq_counter`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_faq_rel`
--
ALTER TABLE `diafan_faq_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_feedback`
--
ALTER TABLE `diafan_feedback`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_feedback_param`
--
ALTER TABLE `diafan_feedback_param`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `diafan_feedback_param_element`
--
ALTER TABLE `diafan_feedback_param_element`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_feedback_param_select`
--
ALTER TABLE `diafan_feedback_param_select`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `diafan_files`
--
ALTER TABLE `diafan_files`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_files_category`
--
ALTER TABLE `diafan_files_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_files_category_parents`
--
ALTER TABLE `diafan_files_category_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_files_category_rel`
--
ALTER TABLE `diafan_files_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_files_counter`
--
ALTER TABLE `diafan_files_counter`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_files_links`
--
ALTER TABLE `diafan_files_links`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_files_rel`
--
ALTER TABLE `diafan_files_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_forum`
--
ALTER TABLE `diafan_forum`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_forum_blocks`
--
ALTER TABLE `diafan_forum_blocks`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_forum_category`
--
ALTER TABLE `diafan_forum_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_forum_messages`
--
ALTER TABLE `diafan_forum_messages`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_forum_messages_parents`
--
ALTER TABLE `diafan_forum_messages_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_forum_show`
--
ALTER TABLE `diafan_forum_show`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_geomap`
--
ALTER TABLE `diafan_geomap`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_images`
--
ALTER TABLE `diafan_images`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=3511;
--
-- AUTO_INCREMENT for table `diafan_images_editor_folders`
--
ALTER TABLE `diafan_images_editor_folders`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_images_variations`
--
ALTER TABLE `diafan_images_variations`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `diafan_keywords`
--
ALTER TABLE `diafan_keywords`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_languages`
--
ALTER TABLE `diafan_languages`
  MODIFY `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_languages_translate`
--
ALTER TABLE `diafan_languages_translate`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_log`
--
ALTER TABLE `diafan_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_log_note`
--
ALTER TABLE `diafan_log_note`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_map_index`
--
ALTER TABLE `diafan_map_index`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=3936;
--
-- AUTO_INCREMENT for table `diafan_menu`
--
ALTER TABLE `diafan_menu`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `diafan_menu_category`
--
ALTER TABLE `diafan_menu_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `diafan_menu_category_site_rel`
--
ALTER TABLE `diafan_menu_category_site_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `diafan_menu_parents`
--
ALTER TABLE `diafan_menu_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `diafan_messages`
--
ALTER TABLE `diafan_messages`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_messages_user`
--
ALTER TABLE `diafan_messages_user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_mistakes`
--
ALTER TABLE `diafan_mistakes`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_modules`
--
ALTER TABLE `diafan_modules`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `diafan_news`
--
ALTER TABLE `diafan_news`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_news_category`
--
ALTER TABLE `diafan_news_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_news_category_parents`
--
ALTER TABLE `diafan_news_category_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_news_category_rel`
--
ALTER TABLE `diafan_news_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_news_counter`
--
ALTER TABLE `diafan_news_counter`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_news_rel`
--
ALTER TABLE `diafan_news_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_payment`
--
ALTER TABLE `diafan_payment`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `diafan_payment_history`
--
ALTER TABLE `diafan_payment_history`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_photo`
--
ALTER TABLE `diafan_photo`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_photo_category`
--
ALTER TABLE `diafan_photo_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_photo_category_parents`
--
ALTER TABLE `diafan_photo_category_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_photo_category_rel`
--
ALTER TABLE `diafan_photo_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_photo_counter`
--
ALTER TABLE `diafan_photo_counter`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_photo_rel`
--
ALTER TABLE `diafan_photo_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_rating`
--
ALTER TABLE `diafan_rating`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_redirect`
--
ALTER TABLE `diafan_redirect`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_reviews`
--
ALTER TABLE `diafan_reviews`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_reviews_param`
--
ALTER TABLE `diafan_reviews_param`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `diafan_reviews_param_element`
--
ALTER TABLE `diafan_reviews_param_element`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_reviews_param_select`
--
ALTER TABLE `diafan_reviews_param_select`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `diafan_rewrite`
--
ALTER TABLE `diafan_rewrite`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2113;
--
-- AUTO_INCREMENT for table `diafan_search_history`
--
ALTER TABLE `diafan_search_history`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_search_index`
--
ALTER TABLE `diafan_search_index`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=648;
--
-- AUTO_INCREMENT for table `diafan_search_keywords`
--
ALTER TABLE `diafan_search_keywords`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=334;
--
-- AUTO_INCREMENT for table `diafan_search_results`
--
ALTER TABLE `diafan_search_results`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=185;
--
-- AUTO_INCREMENT for table `diafan_sessions_hash`
--
ALTER TABLE `diafan_sessions_hash`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=1305;
--
-- AUTO_INCREMENT for table `diafan_shop`
--
ALTER TABLE `diafan_shop`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=222;
--
-- AUTO_INCREMENT for table `diafan_shop_additional_cost`
--
ALTER TABLE `diafan_shop_additional_cost`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_additional_cost_category_rel`
--
ALTER TABLE `diafan_shop_additional_cost_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_additional_cost_rel`
--
ALTER TABLE `diafan_shop_additional_cost_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_brand`
--
ALTER TABLE `diafan_shop_brand`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `diafan_shop_brand_category_rel`
--
ALTER TABLE `diafan_shop_brand_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `diafan_shop_cart`
--
ALTER TABLE `diafan_shop_cart`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_category`
--
ALTER TABLE `diafan_shop_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=278;
--
-- AUTO_INCREMENT for table `diafan_shop_category_parents`
--
ALTER TABLE `diafan_shop_category_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=413;
--
-- AUTO_INCREMENT for table `diafan_shop_category_rel`
--
ALTER TABLE `diafan_shop_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=3030;
--
-- AUTO_INCREMENT for table `diafan_shop_counter`
--
ALTER TABLE `diafan_shop_counter`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `diafan_shop_currency`
--
ALTER TABLE `diafan_shop_currency`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_shop_delivery`
--
ALTER TABLE `diafan_shop_delivery`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `diafan_shop_delivery_thresholds`
--
ALTER TABLE `diafan_shop_delivery_thresholds`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `diafan_shop_discount`
--
ALTER TABLE `diafan_shop_discount`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_shop_discount_coupon`
--
ALTER TABLE `diafan_shop_discount_coupon`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_discount_object`
--
ALTER TABLE `diafan_shop_discount_object`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `diafan_shop_discount_person`
--
ALTER TABLE `diafan_shop_discount_person`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_files_codes`
--
ALTER TABLE `diafan_shop_files_codes`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_import`
--
ALTER TABLE `diafan_shop_import`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `diafan_shop_import_category`
--
ALTER TABLE `diafan_shop_import_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `diafan_shop_order`
--
ALTER TABLE `diafan_shop_order`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_order_additional_cost`
--
ALTER TABLE `diafan_shop_order_additional_cost`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_order_goods`
--
ALTER TABLE `diafan_shop_order_goods`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_order_goods_param`
--
ALTER TABLE `diafan_shop_order_goods_param`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_order_param`
--
ALTER TABLE `diafan_shop_order_param`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `diafan_shop_order_param_element`
--
ALTER TABLE `diafan_shop_order_param_element`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_order_param_select`
--
ALTER TABLE `diafan_shop_order_param_select`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_order_param_user`
--
ALTER TABLE `diafan_shop_order_param_user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_order_status`
--
ALTER TABLE `diafan_shop_order_status`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `diafan_shop_param`
--
ALTER TABLE `diafan_shop_param`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `diafan_shop_param_category_rel`
--
ALTER TABLE `diafan_shop_param_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `diafan_shop_param_element`
--
ALTER TABLE `diafan_shop_param_element`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=19721;
--
-- AUTO_INCREMENT for table `diafan_shop_param_select`
--
ALTER TABLE `diafan_shop_param_select`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_price`
--
ALTER TABLE `diafan_shop_price`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=3279;
--
-- AUTO_INCREMENT for table `diafan_shop_price_image_rel`
--
ALTER TABLE `diafan_shop_price_image_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_price_param`
--
ALTER TABLE `diafan_shop_price_param`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_rel`
--
ALTER TABLE `diafan_shop_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_shop_waitlist`
--
ALTER TABLE `diafan_shop_waitlist`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_shop_wishlist`
--
ALTER TABLE `diafan_shop_wishlist`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_site`
--
ALTER TABLE `diafan_site`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `diafan_site_blocks`
--
ALTER TABLE `diafan_site_blocks`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `diafan_site_blocks_site_rel`
--
ALTER TABLE `diafan_site_blocks_site_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `diafan_site_dynamic`
--
ALTER TABLE `diafan_site_dynamic`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_site_dynamic_element`
--
ALTER TABLE `diafan_site_dynamic_element`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_site_dynamic_module`
--
ALTER TABLE `diafan_site_dynamic_module`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_site_parents`
--
ALTER TABLE `diafan_site_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `diafan_subscribtion`
--
ALTER TABLE `diafan_subscribtion`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_subscribtion_category`
--
ALTER TABLE `diafan_subscribtion_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_subscribtion_category_parents`
--
ALTER TABLE `diafan_subscribtion_category_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_subscribtion_category_rel`
--
ALTER TABLE `diafan_subscribtion_category_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_subscribtion_emails`
--
ALTER TABLE `diafan_subscribtion_emails`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_subscribtion_emails_cat_unrel`
--
ALTER TABLE `diafan_subscribtion_emails_cat_unrel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_subscribtion_phones`
--
ALTER TABLE `diafan_subscribtion_phones`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_subscribtion_sms`
--
ALTER TABLE `diafan_subscribtion_sms`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_tags`
--
ALTER TABLE `diafan_tags`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_tags_name`
--
ALTER TABLE `diafan_tags_name`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_trash`
--
ALTER TABLE `diafan_trash`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_trash_parents`
--
ALTER TABLE `diafan_trash_parents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_update_return`
--
ALTER TABLE `diafan_update_return`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_users`
--
ALTER TABLE `diafan_users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diafan_users_actlink`
--
ALTER TABLE `diafan_users_actlink`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_users_param`
--
ALTER TABLE `diafan_users_param`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_users_param_element`
--
ALTER TABLE `diafan_users_param_element`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_users_param_role_rel`
--
ALTER TABLE `diafan_users_param_role_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_users_param_select`
--
ALTER TABLE `diafan_users_param_select`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_users_role`
--
ALTER TABLE `diafan_users_role`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `diafan_users_role_perm`
--
ALTER TABLE `diafan_users_role_perm`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `diafan_votes`
--
ALTER TABLE `diafan_votes`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_votes_answers`
--
ALTER TABLE `diafan_votes_answers`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_votes_site_rel`
--
ALTER TABLE `diafan_votes_site_rel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
--
-- AUTO_INCREMENT for table `diafan_votes_userversion`
--
ALTER TABLE `diafan_votes_userversion`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
