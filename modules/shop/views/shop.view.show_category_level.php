<?php
/**
 * Шаблон вложенных уровней блока категорий
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

if (empty($result["rows"][$result["attributes"]["parent_id"]]))
{
	return false;
}
	/*?> <pre> <? print_r($result); ?> </pre> <?*/

//вывод категорий
foreach ($result["rows"][$result["attributes"]["parent_id"]] as $row)
{
	?> 
	<div class="col-md-4 col-sm-6 col-xs-12">
		<div class="product" style="cursor:pointer;" data-toggle="modal" name="modalka" href="#myModal_product<?=$row['id']?>">
			<?	echo ($this->htmleditor('<insert name="show_block" template="preview" module="shop" images="1" count="1" cat_id="'.$row['id'].'">')); ?>
			<button name="modalka" href="#myModal_product<?=$row['id']?>" class="button_call_back"><span id="caption_zakazat">Посмотреть</span></button>
		</div>

	<?/*

	if(! empty($result["rows"][$row["id"]]))
	{
		$res = $result;
		$res["level"] = $result["level"] + 1;
		$res["parent_id"] = $row["id"];
		echo $this->get('show_category_level', 'shop', $res);
	}
	*/
	
	?>
	</div>
			<!-- Модальные окно  -->
			<div id="myModal_product<?=$row['id']?>" class="modal fade">
				<div class="modal-dialog" id="modal_zvonok_size">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" id="modal_zvonok_close" data-dismiss="modal" aria-hidden="true"><img src="images/icon-close.png"></button>
						</div>					
						<?	echo ($this->htmleditor('<insert name="show_block" template="modal" module="shop" images="1" count="20" cat_id="'.$row['id'].'">')); 
		?> 			</div>
				</div>
			</div>
	
	
	<?
	
}
