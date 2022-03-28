<?php
/**
 * Установка модуля
 * 
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2017 OOO «Диафан» (http://www.diafan.ru/)
 */

if (! defined('DIAFAN'))
{
	$path = __FILE__; $i = 0;
	while(! file_exists($path.'/includes/404.php'))
	{
		if($i == 10) exit; $i++;
		$path = dirname($path);
	}
	include $path.'/includes/404.php';
}

class Mistakes_install extends Install
{
	/**
	 * @var string название
	 */
	public $title = "Ошибки на сайте";

	/**
	 * @var array таблицы в базе данных
	 */
	public $tables = array(
		array(
			"name" => "mistakes",
			"comment" => "Ошибки на сайте, добавленные пользователями",
			"fields" => array(
				array(
					"name" => "id",
					"type" => "INT(11) UNSIGNED NOT NULL AUTO_INCREMENT",
					"comment" => "идентификатор",
				),
				array(
					"name" => "url",
					"type" => "VARCHAR(255) NOT NULL DEFAULT ''",
					"comment" => "ссылка на сайте",
				),
				array(
					"name" => "created",
					"type" => "INT(10) UNSIGNED NOT NULL DEFAULT '0'",
					"comment" => "дата создания",
				),
				array(
					"name" => "selected_text",
					"type" => "TEXT",
					"comment" => "выделенный текст с ошибкой",
				),
				array(
					"name" => "comment",
					"type" => "TEXT",
					"comment" => "комментарий пользователя",
				),
			),
			"keys" => array(
				"PRIMARY KEY (id)",
			),
		),
	);

	/**
	 * @var array записи в таблице {modules}
	 */
	public $modules = array(
		array(
			"name" => "mistakes",
			"admin" => true,
			"site" => true,
		),
	);

	/**
	 * @var array меню административной части
	 */
	public $admin = array(
		array(
			"name" => "Ошибки на сайте",
			"rewrite" => "mistakes",
			"group_id" => "2",
			"sort" => 24,
			"act" => true,
		),
	);

	/**
	 * @var array демо-данные
	 */
	public $demo = array(
		'mistakes' => array(
			array(
				'url' => '/shop/ryukzaki/baul-vodonepronitsaemyy-kashalot-45/',
				'selected_text' => 'джип',
				'comment' => 'Правильно говорить внедорожник',
			),
		),
	);
}