<?php
/**
 * Настройки для поисковой индексации для модуля «Поиск»
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

/**
 * Clauses_search_config
 */
class Clauses_search_config
{
	public $config = array(
		'clauses' => array(
			'fields' => array('name', 'anons', 'text'),
			'rating' => 1
		),
		'clauses_category' => array(
			'fields' => array('name', 'anons', 'text'),
			'rating' => 1
		)
	);
}