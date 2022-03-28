<?php
/**
 * Права пользователя для пользовательской части, испольуземые модулем
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
 * Forum_admin_role
 */
class Forum_admin_role
{
	/**
	 * Возвращает права
	 * @return array
	 */
    public function get_rules()
	{
	    $rules = array('moderator' => 'Модератор');
	    return $rules;
	}
}