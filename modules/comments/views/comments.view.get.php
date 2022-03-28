<?php
/**
 * Шаблон вывода комментариев
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

echo '<div class="comments"'.(empty($result["rows"]) ? ' style="display:none"' : '').'>';
echo '<div class="block_header">'.$this->diafan->_('Комментарии').'</div>';
if (! empty($result["rows"]))
{
	echo $this->get('list', 'comments', $result["rows"]);
}
echo '</div>';

//постраничная навигация
if (! empty($result["paginator"]))
{
	echo $result["paginator"];
}

if(! empty($result["unsubscribe"]))
{
	echo '<a name="comment0"></a><div class="errors">'.$this->diafan->_('Вы отписаны от уведомлений на новые комментарии.').'</div>';
}

if($result["form"])
{
	echo $this->get('form', 'comments', $result["form"]);
}
if($result["register_to_comment"])
{
	echo $this->diafan->_('Чтобы комментировать, зарегистрируйтесь или авторизуйтесь');
}