<?php
/**
 * Шаблон блока товаров
 *
 * Шаблонный тег <insert name="show_block" module="shop" [count="количество"]
 * [cat_id="категория"] [site_id="страница_с_прикрепленным_модулем"] [brand_id="производитель"] 
 * [images="количество_изображений"] [images_variation="тег_размера_изображений"]
 * [sort="порядок_вывода"] [param="дополнительные_условия"]
 * [hits_only="только_хиты"] [action_only="только акции"] [new_only="только_новинки"]
 * [discount_only="только_со_скидкой"]
 * [only_module="only_on_module_page"] [template="шаблон"]>:
 * блок товаров
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
	return false;
}
?>
	<div class="row">
		<div class="akcii-slider">		
											

<?
if(empty($result['rows'])) return false;

		foreach ($result['rows'] as $row):
				?>
				
		<? /* <pre><? print_r($row); ?></pre>  */ ?>
		
		<div class="akcii-item">
				<div class="col-md-10 col-md-offset-1">
					<div class="akcii-product">
						<img src="<?=$row["img"][0]["vs"]["large"]?>">
						<div class="product-info">
							<div class="product-name">
								<a href="<?=BASE_PATH_HREF.$row["link"]?>" class="shop-item-title noLink"><?=$row["name"]?></a>
							</div>
							<? foreach ($row['all_param'] as $param) {
								if ($param['id']==1) { ?>
									<div class="product-sizes">								
										<?=$param['value']; ?>
									</div>
								<? }
							} ?>
							
							
							<? 	if ($row['discount']) { ?>
									<div class="product-prices">
										<div class="product-new-price">
											<?=$row['price']; ?> руб.
										</div>
										<div class="product-old-price">
											<?=$row['old_price']; ?> руб.
										</div>
										<div class="skidka">
											-<?=$row['discount']; ?> %
										</div>
									</div>
								<? } ?>
							
							
						</div>
					</div>
				</div>
			</div>			
		<? endforeach; ?>	
		</div>  
	</div> 

