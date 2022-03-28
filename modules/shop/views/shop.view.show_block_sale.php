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

if(empty($result['rows'])) return false;

?> 
<div class="products-list">
	<div class="row"> <?

		foreach ($result['rows'] as $row)
		{
			foreach ($row['all_param'] as $params):
				 if ($params['id']==3): ?>	
					<div class="col-md-3 col-sm-6 col-xs-12">
								<div class="product-category-list">
									<div class="product-main-img">
										<img src="<?=$row['img'][0]['src'] ?>">
									</div>
									<div class="for-bottom-text">	
										<a href="<?=BASE_PATH_HREF.$row['link'] ?>" class="product-category-list-title noLink">
										<?=$row['name'] ?></a>
									</div>									
									<div class="manufacturer">
											<? if ($row['brand']['name']): ?>
												<a href="<?=BASE_PATH_HREF.$row['brand']['link']; ?>"><span class="green"><?=$row['brand']['name']; ?></span></a>, 
												<?= $this->htmleditor('<insert name="show_brand" module="shop" template="text" brandid="'.$row['brand']['id'].'">'); ?>

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
											<? if ($row['new']==1): ?>	
												<div class="product-rasprodazha">Новинка</div>
												<? else: ?>
													<? if ($row['hit']==1): ?>	
														<div class="product-rasprodazha">Хит</div>
													<? endif; ?>											
											<? endif; ?>	
										<? foreach ($row['all_param'] as $params): ?> 
											<? if ($params['id']==3): ?>	
												<div class="product-rasprodazha">Распродажа</div>
											<? endif; ?>	
										<? endforeach; ?>
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
							  </div><?
			endif;
			endforeach;
		}	?>
	</div>
</div>