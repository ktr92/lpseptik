<?php
/**
 * Шаблон страницы бренда
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
?></div></div>

	
 <? /* <pre><? print_r($result); ?> </pre> */ ?>
					
					
					
	<div class="container">
		<? /* <?= $this->htmleditor('<insert name="show_search" module="shop" template="style" site_id="18" cat_id="current">'); ?> */ ?>
		<div class="catalog-content">
			<div class="content-title">
			<?
			//вывод названия категории
			echo '<h2>'.$result["name"].'</h2>';
			echo '<a class="noLink" href="'.BASE_PATH_HREF.$cat['link'].'">Все модели</a>';

			?>  
			
			</div>
			<div class="categories-list">
				<?= $this->htmleditor('<insert name="show_category" module="shop" parent_id="'.$result['id'].'" template="custom">') ; ?>
			</div>
		</div>	
						
	
	<?
		echo '<div class="url_brand_container"><a class="url_brand" target="_blank" href="'.$result["url_brand"].'">'.$result["url_brand"].'</a></div>';

		//вывод товаров в категории
		if (!empty($result["rows"] ))
		{
			?>

					<div class="products-list">
						<div class="row">						
							<? echo $this->get('rows_brandpage', 'shop', $result); ?>										
						</div>
					</div>
			<?
		} ?>
		
	<div class="container">
		<div class="pagination"> <?
			if (!empty($result["paginator"]))
			{
				echo $result["paginator"];
			}
			?>
		</div>
	</div>

<div class="container" style="padding-bottom: 50px;">
	<? echo ($result['text']); ?>
</div>


