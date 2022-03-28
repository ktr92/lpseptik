<?php
/**
 * Список товаров производителя
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

if(! empty($result["error"]))
{
	echo '<p>'.$result["error"].'</p>';
	return;
}

if(empty($result["ajax"]))
{
	echo '<div class="js_shop_list shop_list">';
}

?>

	
			<div class="breadcrumb-fon">
				<div class="container">
						<?= $this->htmleditor('<insert name="show_breadcrumb_brands" current="true" separator=" ">') ; ?>
				</div>
			</div>
	
<?

?>

<div class="subcategory-item">
	<div class="container">
		<div class="catalog-content">
			<div class="content-title">
			<?
				//вывод названия категории
				echo '<h2>'.$result["name"].'</h2>';
			    echo '<a class="noLink">Все модели</a>';				
			?>  
			</div> 
			
			<div class="categories-list">

<?
//вывод подкатегории


if (!empty($result["children"]))
{
	?> <ul> <?
	foreach ($result["children"] as $child)
	{
		//название и ссылка подкатегории
			echo '<li><a href="'.BASE_PATH_HREF.$child["link"].'">'.$child["name"].'</a></li>';
			
			/*?><pre><? print_r($child); ?></pre><?*/
			
		//вывод изображений подкатегории
		/*if (!empty($child["img"]))
		{
			
			foreach ($child["img"] as $img)
			{
				switch ($img["type"])
				{
					case 'animation':
						echo '<a href="'.BASE_PATH.$img["link"].'" rel="prettyPhoto[gallery'.$child["id"].'shop]">';
						break;
					case 'large_image':
						echo '<a href="'.BASE_PATH.$img["link"].'" rel="large_image" width="'.$img["link_width"].'" height="'.$img["link_height"].'">';
						break;
					default:
						echo '<a href="'.BASE_PATH_HREF.$img["link"].'">';
						break;
				}
				echo '<img src="'.$img["src"].'" width="'.$img["width"].'" height="'.$img["height"].'" alt="'.$img["alt"].'" title="'.$img["title"].'">'
				. '</a> ';
			}
			echo '</div>';
		}*/

		

		//краткое описание подкатегории
	/*	if ($child["anons"])
		{
			echo '<div class="shop_cat_anons">'.$child['anons'].'</div>';
		}
		echo '</div>';
*/
		//вывод списка товаров подкатегории
		/*if (!empty($child["rows"]))
		{
			$res = $result;
			$res["rows"] = $child["rows"];
                        echo '<div class="shop-pane">';
			echo $this->get('rows', 'shop', $res);
                        echo '</div>';
		}*/
	}
	?> </ul> <?
}

	?></div> </div> <?
	
		//вывод товаров в категории
	if (!empty($result["rows"] ))
	{
		?>
				<div class="products-list">
					<div class="row">
					
					<!-- Товары, у которых подкатегория 3 уровня */ -->
					
						<? foreach ($result["rows"] as $row): ?> 
						
						 <? /*foreach ($row['all_param'] as $params) {
										 ?> <pre> <? print_r ($params); ?> </pre> <?
									 }*/
									?>
									
									
						<? /* <pre><? print_r($row); ?></pre> */ ?>
							<div class="col-md-3 col-sm-6 col-xs-12">
								<div class="product-category-list">
									<img src="<?=$row['img'][0]['src'] ?>">
									<div class="for-bottom-text">	
										<a href="<?=BASE_PATH_HREF.$row['link'] ?>" class="product-category-list-title">
										<?=$row['name'] ?></a>
									</div>									
									<div class="manufacturer">
											<? if ($row['brand']['name']): ?>
												<a href="<?=BASE_PATH_HREF.$row['brand']['link']; ?>"><span class="green"><?=$row['brand']['name']; ?></span></a>, Россия	
											<? endif ?>											
									</div>							
									
									<div class="mebel-style">
											<? if ($row['param'][0]['value']): ?>
												<?=$row['param'][0]['value']; ?>
											<? endif ?>
									</div>									
									<button data-toggle="modal" data-target="#myModal_zayavka<?=$row['id']?>" class="button-zakazat">Заказать</button>									
									<? if ($row['action']==1): ?>	
										<div class="product-akcia">Акция</div>
									<? else: ?>
										<? if ($row['all_param'][2]['value']==1): ?>	
											<div class="product-rasprodazha">Распродажа</div>
											<? else: ?>
											<? if ($row['new']==1): ?>	
												<div class="product-rasprodazha">Новинка</div>
												<? else: ?>
													<? if ($row['hit']==1): ?>	
														<div class="product-rasprodazha">Хит</div>
													<? endif; ?>	
											<? endif; ?>	
										<? endif; ?>	
									<? endif; ?>
																	
								</div>
							</div>	

							<!-- Модальные окно - Заказать товар -->
							<div id="myModal_zayavka<?=$row['id']?>" class="modal fade">
								<div class="modal-dialog" id="modal_zvonok_size">
								<div class="modal-content">
								  <!-- Заголовок модального окна -->
									<div class="modal-header">
									<button type="button" class="close" id="modal_zvonok_close" data-dismiss="modal" aria-hidden="true"><img src="/img/close.png"></button></div>
								  <!-- Основное содержимое модального окна -->
								  <div class="modal-body" id="modal_zvonok_container">
									<div class="modal_zvonok_content">
									  <h4 class="modal-title" id="modal_zvonok">Заявка на <?=$row['name'];?></h4>        
									  <h5 class="modal_zvonok_text">Оставьте заявку и мы Вам перезвоним!</h5>						
										  <?= $this->htmleditor('<insert  name="show_form" module="feedback" site_id="33"  template="tovar" product="Заявка на: '.htmlspecialchars($row['name']).'">'); ?>
										  <p>Ваши данные не будут переданы третьим лицам</p>
									</div>
								  </div>
								</div>
							  </div>
							  </div>										
						<? endforeach; ?>
					</div>
				</div>
				
			<?
	}	
	
//вывод списка товаров
/*if (!empty($result["rows"]))
{
    	//вывод сортировки товаров
	if(! empty($result["link_sort"]))
	{
		echo $this->get('sort_block', 'shop', $result);
	}

	echo '<div class="shop-pane">';
	echo $this->get('rows', 'shop', $result);
        echo '</div>';
}*/

/*?> <pre> <? print_r($this->diafan->_paginator->get()); ?> </pre> <?*/

//постраничная навигация
if (!empty($result["paginator"]))
{
	echo $result["paginator"];
}

//вывод описания текущей категории
if (!empty($result["text"]))
{
	echo '<div class="shop_text text">';
	//вывод изображений текущей категории
	if (!empty($result["img"]))
	{
		echo '<div class="shop_cat_all_img">';
		foreach ($result["img"] as $img)
		{
			switch ($img["type"])
			{
				case 'animation':
					echo '<a href="'.BASE_PATH.$img["link"].'" rel="prettyPhoto[gallery'.$result["id"].'shop_cat]">';
					break;
				case 'large_image':
					echo '<a href="'.BASE_PATH.$img["link"].'" rel="large_image" width="'.$img["link_width"].'" height="'.$img["link_height"].'">';
					break;
				default:
					echo '<a href="'.BASE_PATH_HREF.$img["link"].'">';
					break;
			}
			echo '<img src="'.$img["src"].'" width="'.$img["width"].'" height="'.$img["height"].'" alt="'.$img["alt"].'" title="'.$img["title"].'">'
			. '</a> ';
		}
		echo '</div>';
	}
	echo $result['text'].'</div>';
}
else
{
	//вывод изображений текущей категории
	if (!empty($result["img"]))
	{
		echo '<div class="shop_cat_all_img">';
		foreach ($result["img"] as $img)
		{
			switch ($img["type"])
			{
				case 'animation':
					echo '<a href="'.BASE_PATH.$img["link"].'" rel="prettyPhoto[gallery'.$result["id"].'shop_cat]">';
					break;
				case 'large_image':
					echo '<a href="'.BASE_PATH.$img["link"].'" rel="large_image" width="'.$img["link_width"].'" height="'.$img["link_height"].'">';
					break;
				default:
					echo '<a href="'.BASE_PATH_HREF.$img["link"].'">';
					break;
			}
			echo '<img src="'.$img["src"].'" width="'.$img["width"].'" height="'.$img["height"].'" alt="'.$img["alt"].'" title="'.$img["title"].'">'
			. '</a> ';
		}
		echo '</div>';
	}
}

/*if (!empty($result["rows"]) && empty($result["hide_compare"]))
{
	echo $this->get('compared_goods_list', 'shop', array("site_id" => $this->diafan->_site->id, "shop_link" => $result['shop_link']));
}*/

//вывод ссылок на предыдущую и последующую категории
/*if (! empty($result["previous"]) || ! empty($result["next"]))
{
	echo '<div class="previous_next_links">';
	if (! empty($result["previous"]))
	{
		echo '<div class="previous_link"><a href="'.BASE_PATH_HREF.$result["previous"]["link"].'">&larr; '.$result["previous"]["text"].'</a></div>';
	}
	if (! empty($result["next"]))
	{
		echo '<div class="next_link"><a href="'.BASE_PATH_HREF.$result["next"]["link"].'">'.$result["next"]["text"].' &rarr;</a></div>';
	}
	echo '</div>';
}
*/
//вывод комментариев ко всей категории товаров (комментарии к конкретному товару в функции id())
if (!empty($result["comments"]))
{
	echo $result["comments"];
}

if(empty($result["ajax"]))
{
	echo '</div>';
}

?> </div>
