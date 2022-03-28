<?php
/**
 * Шаблон блока производителей
 *
 * Шаблонный тег <insert name="show_brand" module="shop" [count="количество"]
 * [cat_id="категория"] [site_id="страница_с_прикрепленным_модулем"]
 * [images="количество_изображений"] [images_variation="тег_размера_изображений"]
 * [only_module="true|false"]
 * [template="шаблон"]>:
 * блок производителей
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

if (empty($result["rows"]))
{
	return;
}

	/*?> <pre> <? print_r($result); ?> </pre> <?*/
//вывод производителей
?>
<div class="brand-col">
	<ul>
<? 
foreach ($result["rows"] as $row)
{ ?>
		<li><a href="<?=BASE_PATH_HREF.$row["link"]?>"> <?=$row["name"]?> </a>	</li>
<? } ?>
	</ul>
</div>