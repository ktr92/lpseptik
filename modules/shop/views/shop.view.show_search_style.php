<?php
/**
 * Шаблон форма поиска по товарам
 *
 * Шаблонный тег <insert name="show_search" module="shop"
 * [cat_id="категория"] [site_id="страница_с_прикрепленным_модулем"]
 * [ajax="подгружать_результаты"]
 * [only_module="only_on_module_page"] [template="шаблон"]>:
 * форма поиска по товарам
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

echo '<div class="block shop-search">';
echo '<form method="GET" action="'.BASE_PATH_HREF.$result["path"].'" class="js_shop_search_form'.(! empty($result["send_ajax"]) ? ' ajax' : '').'">';
echo '<input type="hidden" name="module" value="shop">
<input type="hidden" name="action" value="search">';

if (count($result["site_ids"]) > 1)
{
	echo '<div class="shop_search_site_ids">
	<span class="input-title">'.$this->diafan->_('Раздел').':</span>
	<select class="js_shop_search_site_ids">';
	foreach ($result["site_ids"] as $row)
	{
		echo '<option value="'.$row["id"].'" path="'.BASE_PATH_HREF.$row["path"].'"';
		if($result["site_id"] == $row["id"])
		{
			echo ' selected';
		}
		echo '>'.$row["name"].'</option>';
	}
	echo '</select>';
	echo '</div>';
}




if (!empty($result["rows"]))
{
	
	if (count($result["cat_ids"]) > 1)
{
	echo '<div class="shop_search_cat_ids">
	<span class="input-title">'.$this->diafan->_('Категория').':</span>
	<select name="cat_id" class="js_shop_search_cat_ids">';
	echo '<option value="">'.$this->diafan->_('Все').'</option>';
	foreach ($result["cat_ids"] as $row)
	{
		echo '<option value="'.$row["id"].'" site_id="'.$row["site_id"].'"';
		if($result["cat_id"] == $row["id"])
		{
			echo ' selected';
		}
		echo '>';
		if($row["level"])
		{
			echo str_repeat('- ', $row["level"]);
		}
		echo $row["name"].'</option>';
	}
	echo '</select>';
	echo '</div>';
}
else
{
	echo '<input name="cat_id" type="hidden" value="'.$result["cat_id"].'">';
}
	foreach ($result["rows"] as $row)
	{
		echo '<div class="filter-item">
				<div class="js_shop_search_param shop_search_param shop_search_param'.$row["id"].'" cat_ids="'.$row["cat_ids"].'">';
		switch ($row["type"])
		{
			case 'title':
				echo '<span class="input-title">'.$row["name"].':</span>';
				break;

			case 'date':
				echo '
				<span class="input-title">'.$row["name"].':</span>
				<div>
					<input type="text" name="p'.$row["id"].'_1" value="'.$row["value1"].'" class="from timecalendar" showTime="false">
					&nbsp;-&nbsp;
					<input type="text" name="p'.$row["id"].'_2" value="'.$row["value2"].'" class="to timecalendar" showTime="false">
				</div>';
				break;

			case 'datetime':
				echo '
				<span class="input-title">'.$row["name"].':</span>
				<div>
					<input type="text" name="p'.$row["id"].'_1" value="'.$row["value1"].'" class="from timecalendar" showTime="true">
					&nbsp;-&nbsp;
					<input type="text" name="p'.$row["id"].'_2" value="'.$row["value2"].'" class="to timecalendar" showTime="true">
				</div>';
				break;

			case 'numtext':
				echo '
				<span class="input-title">'.$row["name"].':</span>
				<div>
					<input type="text" class="from" name="p'.$row["id"].'_1" value="'. $row["value1"].'">
					&nbsp;-&nbsp;
					<input type="text" class="to"  name="p'.$row["id"].'_2" value="'.$row["value2"].'">
				</div>';
				break;

			case 'checkbox':
				echo '
				<input type="checkbox" id="shop_search_p'.$row["id"].'" name="p'.$row["id"].'" value="1"'.($row["value"] ? " checked" : '').'>
				<label for="shop_search_p'.$row["id"].'">'.$row["name"].'</label>
				<br>';
				break;

			case 'select':
			case 'multiple':
				echo '
				<span class="input-title">'.$row["name"].':</span><br/>';
				foreach ($row["select_array"] as $key => $value)
				{
					echo '<label for="shop_search_p'.$row["id"].'_'.$key.'"><input type="checkbox" id="shop_search_p'.$row["id"].'_'.$key.'" name="p'.$row["id"].'[]" value="'.$key.'"'.(in_array($key, $row["value"]) ? " checked" : '').'><span class="checkbox-custom"></span>
					'.$value.'</label>
					<br>';
				}
		}
		echo '
			</div>
		</div>';
	}

echo '
	<br>
	<input class="button-zakazat" type="submit" value="'.$this->diafan->_('Показать', false).'">';
}
echo'
	</form>
</div>';