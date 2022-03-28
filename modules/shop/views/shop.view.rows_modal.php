<?php
/**
 * Шаблон списка товаров
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
/*?> <pre> <? print_r($result); ?> </pre> <?*/

if(empty($result['rows'])) return false;		?>

				<div class="tabs_product">
						<ul class="tabs__caption_product">						
							<?foreach ($result['rows'] as $row): ?> 	
								<li><?=$row["name"];?><br/><?=$row["price_arr"][0]["price"];?> руб.<br/>
								<? if ($row["price_arr"][0]["old_price"]) { ?>
								<span class="price-old"><?=$row["price_arr"][0]["old_price"];?> руб.</span>
								<? } ?>
								</li>							
							<?endforeach;?>
						</ul>
		
					<?foreach ($result['rows'] as $row): ?> 	
						<div class="tabs__content_product">
							<div class="inner_wrap_catalog_new">								
								<div class="h1"><?=$row["name"];?></div>
								<div class="card_catalog_new">
									<div class="cardMain_catalog_new">
										<img src="<?=$row['img'][0]['vs']['medium']?>" alt="">									
									</div>
									<div class="cardTech_catalog_new">
										<div class="price_catalog_new">
											<table>
												<tbody>
												<tbody>
												<tr>
													<td width="50%">Розничная стоимость:</td>
													<!--<td width="50%"><span class="shock_catalog_new">Цена по акции:</span></td>-->
												</tr>
												<tr>
													<td class="newPrice_catalog_retail"><span class="price-new"><?=$row["price_arr"][0]["price"];?> руб. </span> 
														<? if ($row["price_arr"][0]["old_price"]) { ?>
														<span class="price-old"><?=$row["price_arr"][0]["old_price"];?> руб.</span>
														<? } ?>
													</td>
												  <!--  <td class="newPrice_catalog_newTd"><span>от </span><span class="newPrice_catalog_new">71 010</span
														руб.>-->
													</td>
												</tr>
												</tbody>
											</table>
										</div>
										<table cellspacing="0" cellpadding="0" class="params_catalog_new">
											<tbody> 
											<? foreach ($row['all_param'] as $params): 	
											
												switch ($params) {
													case $params["id"]==2:
														echo 	
															"<tr>
																<td>Производительность</td>
																<td>".$params['value']."  м<sup>3</sup>/сут</td>
															</tr>";
														break;
													case $params["id"]==3:
														echo 	
															"<tr>
																<td>Количество пользователей</td>
																<td>".$params['value']." чел.</td>
															</tr>";
														break;
													case $params["id"]==4:
														echo 	
															"<tr>
																<td>Глубина залегания трубы</td>
																<td>".$params['value']." см</td>
															</tr>";
														break;
													case $params["id"]==5:
														echo 	
															"<tr>
																<td>Объем залпового сброса</td>
																<td>".$params['value']." л</td>
															</tr> ";
														break;
													case $params["id"]==6:
														echo 	
															"<tr>
																<td>Потребляемая электроэнергия</td>
																<td>".$params['value']." квт*сут</td>
															</tr>   ";
														break;
													case $params["id"]==7:
														echo 	
															"<tr>
																<td>Вес</td>
																<td>".$params['value']." кг</td>
															</tr>";
														break;
													case $params["id"]==8:
														echo 	
															"<tr>
																<td>Габариты установки д/ш/в</td>
																<td>".$params['value']."  м</td>
															</tr>";
														break;
												}
												endforeach;
											?> 
											
											</tbody>
										</table>
									</div>									
									<div class="inner-text_catalog_new">
									
									<? /* <pre> <? print_r($row); ?> </pre> */ ?>
								
										<p><?=$row['anons']; ?></p>
									</div>
								</div>			
					
								<div class="block-1-form">
									<h3>Узнайте стоимость под ключ</h3>
									<form id="form_zakazat_zvonok" method="post" action=""  onsubmit="sendProduct(this); return false;" data-metrika-target="productzayavka">
										<div class="row">
											<div class="col-md-4 col-xs-12">
												<div class="form-group" >
												  <input type="text" name="name" id="form-input-name" placeholder="  Ваше имя">              
												</div>		
											</div>	
											<div class="col-md-4 col-xs-12">
												<div class="form-group">
												  <input type="text" name="phone" id="form-input-phone" placeholder="  Ваш телефон">          
												</div>
											</div>	
											<input type="text" name="product" style="display: none;" value="<?=$row["name"];?>" class="form-input-product">  
											
											<input type="text" placeholder="UTM фраза" name="utm31">
						<input type="text" placeholder="UTM компания" name="utm32">
						<input type="text" placeholder="UTM источник" name="utm33">
						
						
											
											<button class="button_call_back" id="#btn-product">Узнать цену под ключ</button>	
										</div>
									</form>
								</div>			
							</div>
						</div>								
					<?endforeach;?>					
				</div>			

<!-- Модальные окно - конец -->  

