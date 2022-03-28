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
/*?>
<pre><? print_r($result); ?> </pre>
<?*/
$countries = [];
$i=0;
foreach ($result["rows"] as $row)
{ 
	$countries[$i]=strip_tags(mb_strtolower($row["text"]));
	$i++;
}

$countries = array_unique($countries);

$k=0;
foreach ($countries as $i => $val) {
	$countries_new[$k]=$val;
	$k++;
}

?>

<ul class="filter-countries">
	<li id="br-all">Все</li>
	<? for ($i = 0; $i < count($countries_new); $i++) { 
		if (!empty($countries_new[$i])) { ?>
		<li id="<?=$countries_new[$i]?>"><?=$countries_new[$i]?></li>		
		
		<? } 
	} ?>
</ul>


<div class="filter-letters">
	<ul>
		<li>A</li>
		<li>B</li>
		<li>C</li>
		<li>D</li>
		<li>E</li>
		<li>F</li>
		<li>G</li>
		<li>H</li>
		<li>I</li>
		<li>J</li>
		<li>K</li>
		<li>L</li>
		<li>M</li>
		<li>N</li>
		<li>O</li>
		<li>P</li>
		<li>Q</li>
		<li>R</li>
		<li>S</li>
		<li>T</li>
		<li>U</li>
		<li>V</li>
		<li>W</li>
		<li>X</li>
		<li>Y</li>
		<li>Z</li>
	</ul>
</div> 	

<div class="all-brands">
<!--<div id="brands-br-euro">-->
	<div class="row">
		<?
			//вывод производителей
			foreach ($result["rows"] as $row)
			{ ?>

				<div class="col-md-2 col-sm-3 col-xs-4">
					<a href="<?=BASE_PATH_HREF.$row["link"]?>"><img class="opacity-03" src="<?=$row["img"][0]["src"]?>" brandname="<?=$row["name"]?>" brandcountry="<?=strip_tags(mb_strtolower(str_replace(" ", "", $row["country"])))?>"></a>
				</div>
				
				<? } ?>
</div>
