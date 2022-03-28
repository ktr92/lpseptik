<?php
/**
 * Шаблон стартовой страницы сайта
 * 
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2017 OOO «Диафан» (http://www.diafan.ru/)
 */
 
if(! defined("DIAFAN"))
{
	$path = __FILE__; $i = 0;
	while(! file_exists($path.'/includes/404.php'))
	{
		if($i == 10) exit; $i++;
		$path = dirname($path);
	}
	include $path.'/includes/404.php';
}
?><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="ru">
<head>
  <!-- Кодировка документа -->
  <meta charset="utf-8">
  <meta name="robots" content="noindex, nofollow" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ЧелныСептик</title>
 
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap&subset=cyrillic,cyrillic-ext" rel="stylesheet">

  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/bootstrap-theme.min.css">
  <link rel="stylesheet" type="text/css" href="/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="/css/my.css">
  <link rel="stylesheet" type="text/css" href="/css/slick.css">
  <link rel="stylesheet" type="text/css" href="/libs/lightbox/css/lightbox.css">
  <link rel="shortcut icon" href="/fav.ico" type="image/x-icon">

</head>

<body>
<!-- Шапка и верхний блок -->
<section class="container-fluid block-1" style="background-repeat-y: no-repeat;">
<header>
    <div id="mask_header">
  	  <div class="container">
      <div class="header-top">
    	  <div class="row">
    			<div class="col-md-5  col-sm-6 col-xs-12">	
					<div class="logo">             
						<img src="images/logo.png">
						<div class="logo-inf-bottom">Автономная канализация для Вашего дома</div>
					</div>
				</div>
    			<div class="col-md-4  col-sm-6 col-xs-12">
					<div class="phone-inf">	
						<div class="phone">8-<span class="green">962</span>-558-84-94</div>
					</div>
    			</div>
    			<div class="col-md-3  col-sm-6 col-xs-12">
					<div class="call-back">	
						<button data-toggle="modal" href="#myModal_zakazat_zvonok" class="button_call_back"><span id="caption_zakazat">Заказать звонок</span></button>
					</div>
					
				</div>
    	  </div>		 
      </div> 
      </div> 
	</div> 	
</header>
  <div class="container-block-1">
	<div class="container">
       <div class="row">
	    <div class="center">
			<div class="col-md-8  col-sm-6 col-xs-12">	
				<div class="h1-block-1">
					<h1>Продажа и установка<br/> <span class="yellow">автономной канализации (септиков)</span><br/> "под ключ"</h1>
				</div>
				
				<div class="call-back" style="margin-bottom: 5s5px;
    margin-top: -40px;" >	
						<button data-toggle="modal" href="#myModal_test" class="button_call_back" style="    font-size: 20px;
    font-weight: bold;
    padding: 0 30px;
    line-height: 45px;"><span id="caption_zakazat">Подобрать септик и рассчитать стоимость</span></button>
					</div>
					
					
			</div>
		</div>
		
			<div class="col-md-4  col-sm-6 col-xs-12">	
			
			<div class="block-1-form">
				<h2><span style="font-weight: bold;">ОСТАВЬТЕ ЗАЯВКУ</span> <br/><span style="font-size: 18px;">прямо сейчас и получите<br/> <span class="blue">бесплатный</span> расчет сметы!</h2>
				<form id="form_zakazat_zvonok" method="post" action=""  onsubmit="sendForm(this); return false;" data-metrika-target="prostozayavka">
					<div class="form-group" >
					  <input type="text" name="name" id="form-input-name" placeholder="  Ваше имя">              
					</div>					
					<div class="form-group">
					  <input type="text" name="phone" id="form-input-phone" placeholder="  Ваш телефон">          
					</div>
					<input type="text" placeholder="UTM фраза" name="utm1">
						<input type="text" placeholder="UTM компания" name="utm2">
						<input type="text" placeholder="UTM источник" name="utm3">
					<button class="button_call_back">Оставить заявку</button>	
				</form>
				<p>Вы получите сметы с учетом: типа грунта, глубины подвода коммуникации, уровня грунтовых вод, геологии участка, выбора модели септика.</p>
			</div>
			</div>
		</div>
	</div>
</div>	
</section>

<!--
<section id="block_intro"><a name="zima"></a>
	<div class="container">
		<div class="title">
			<h1>ЗИМНЯЯ АКЦИЯ!</h1>
		</div>
		<ul>
			<li class="block_intro_li_1">
				<img src="/images/1-50.png" class="block_intro_img_1" alt="">
                <span>
                    <b >скидка до 20%</b>
                </span>
			</li>
			<li class="block_intro_li_2">
				<img src="/images/1-0.png" class="block_intro_img_2" alt="">
                <span>
                    <b>рассрочка 0%</b><br>без участия банков <br> без переплат
                </span>
			</li>
			<li class="block_intro_li_3">
				<img src="/images/1-free.png" class="block_intro_img_3" alt="">
                <span>
                    <b>бесплатный <br> выезд специалиста</b><br>  замер и<br>  составление сметы
                </span>
			</li>
		</ul>
		<div class="order">
			<div class="order_invested">
				<p>
					<b>Зафиксируйте выгодную цену<br> уже сейчас<br></b>
					<strong><small>Подробности уточняйте у менеджеров</small></strong>
					<br>Только до 15 марта 2019 г.
				</p>
			</div>
			<button data-toggle="modal" href="#myModal_zakazat_zvonok" class="modal-trigger button">Узнать подробнее</button>
		</div>
	</div>
</section>
-->
<!--<section class="akcia-new" style="background-image: url(/img/septikakcia.jpg);     background-repeat: no-repeat;
    background-size: cover;
    background-position-x: center;
    min-height: 480px;
    text-align: center;">-->
<section class="akcia-new" style="    background-color: #e8e8e8;
    padding: 30px 0;">
	<div class="container">
		<insert name="show_block" module="bs" cat_id="1">
	</div>
</section>

<insert name="show_category" module="shop" template="index">

<section class="container-fluid block-4"><a name="block4"></a>
	<div class="container">		
	<div class="block-4-content">
		<h2>Автономная канализация <br/><span style="font-size: 25px; font-weight:400;">или выгребная яма?</span></h2>
		<p>Не можете решиться на установку автономной канализации? Считаете это сложным процессом, а затраты на него неоправданными? Автономная канализация не только экологична и очень удобна, в последствии оказывается дешевле и проще в эксплуатации, чем даже самая обычная выгребная яма.</p>
		<div class="row">
			<div class="left-green">
				<div class="col-md-6 col-xs-12">
					<h3>Автономная канализация</h3>
					<div class="block-4-left">
						<img src="/images/bl4-left.jpg">
						<ul>
							<li>
								<img src="/images/block-4-icon-left.png"><span>При использовании нет неприятного запаха.</span>
								<p>Автономная канализация полностью герметична и не издает непиятного запаха.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-left.png"><span>Экологична и проходит все нормы.</span>
								<p>На выходе получается вода, пригодная для безопасного сброса в грунт или водоем.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-left.png"><span>Удобство в любую погоду.</span>
								<p>Все удобства расположены в помещении, Вам не придется выходить на улицу.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-left.png"><span>Срок службы до 50 лет.</span>
								<p>Автономная канализация надежна, не лопается на морозе и не ржавеет.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-left.png"><span>Не нарушает законодательство.</span>
								<p>Автономная канализация не засоряет и не наносит вред окружающей среде.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-left.png"><span>Минимальные затраты на обслуживание.</span>
								<p>Нет необходимости в вызову ассенизаторной машины для откачки.</p>
							</li>
						</ul>
					</div>
					</div>
				</div>  
			<div class="right-red">
				<div class="col-md-6 col-xs-12">
					<h3>Выгребная яма</h3>
					<div class="block-4-right">
						<img src="/images/bl4-right.jpg">
						<ul>
							<li>
								<img src="/images/block-4-icon-right.png"><span>При использовании неприятный запах</span>
								<p>Вы, Ваши гсоти и соседи будете постоянно испытывать дискомфорт от неприятноо запаха.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-right.png"><span>Не экологична.</span>
								<p>Загрязняет окружающую почву, подземные воды и наносит вред оружающей среде.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-right.png"><span>Неудобно в дождь и холод.</span>
								<p>Невозможно расположить в помещении, поэтому приходится выходить на улицу в любую погоду.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-right.png"><span>Необходимо чистить раз в год и чаще.</span>
								<p>Приходится постоянно откачивать сбросы, либо чистить яму препаратами.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-right.png"><span>Нарушение законодательства.</span>
								<p>Расстояние до дома должно быть не менее 15м. Так же нужно соблюдать СанПин.</p>
							</li>
							<li>
								<img src="/images/block-4-icon-right.png"><span>Постоянные затраты на обслуживание</span>
								<p>Постоянные затраты на ассенизаторскую машину, на препараты для обеззараживания.</p>
							</li>
						</ul>
					</div>
					</div>
				</div>  
			</div>
		</div> 
	</div> 
</section>  


<section class="container-fluid block-7"><a name="block7"></a>
	<div class="container">
		<h2>О нас в цифрах</h2>
			<div class="row">
				<div class="col-md-4 col-xs-12">
					<div class="cifra" id="cifra_1">
						<span class="line_bottom"><span style="font-size: 50px; font-weight: bold;">10</span> лет</span> <br/>на рынке
					</div>
				</div>
				<div class="col-md-4 col-xs-12">
					<div class="cifra" id="cifra_2">
						<span class="line_bottom"><span style="font-size: 50px; font-weight: bold;">258</span> </span> септиков <br/>установлено с 2008 г.
					</div>
				</div>
				<div class="col-md-4 col-xs-12">
					<div class="cifra" id="cifra_3">
						<span class="line_bottom"><span style="font-size: 50px; font-weight: bold;">35%</span></span> клиентов <br/>приходят к нам по рекомендации
					</div>
				</div>
				<div class="col-md-4 col-xs-12">
					<div class="cifra" id="cifra_4">
						<span class="line_bottom">более <span style="font-size: 50px; font-weight: bold;">2 </span>млн.</span> рублей <br/>мы экономим нашим клентам в год
					</div>
				</div>
				<div class="col-md-4 col-xs-12">
					<div class="cifra" id="cifra_5">
						<span class="line_bottom"><span style="font-size: 50px; font-weight: bold;">50 </span>лет</span> <br/>срок службы наших септиков
					</div>
				</div>
				<div class="col-md-4 col-xs-12">
					<div class="cifra" id="cifra_6">
						<span class="line_bottom"><span style="font-size: 50px; font-weight: bold;">8</span> часов</span> <br/>нам нужно для монтажа септика
					</div>
				</div>
			</div>			
	</div>
</section>
  
  
<section class="container-fluid block-8"><a name="block8"></a>
	<div class="container">
		<div class="row">
			<div class="col-md-5 col-xs-12">
				<h3>Сертификаты на продукцию септиков Топас и Евролос</h3>
				<p>Септики и автономные канализации проходят все необходимые тесты и имеют сертификаты соответствия. Мы продаем только оригинальный и качественный товар напрямую от производителя. Чтобы купить септик оставьте заявку ниже и мы предложим Вам самую выгодную цену!</p>				
				<button data-toggle="modal" href="#myModal_zakazat_zvonok" class="stat_vladetzem"><span id="caption_zakazat">СТАТЬ ВЛАДЕЛЬЦЕМ ПРОДУКЦИИ</span></button>
			</div>
			<div class="col-md-7 col-xs-12">
				<div class="sertificates-top">
				<div class="sert">
						<a href="/images/sertificat-1.jpg" data-lightbox="image-1"><img src="/images/sertf-1.jpg"></a>
					</div>
					<div class="sert">
						<a href="/images/sertificat-22.jpg" data-lightbox="image-2"><img src="/images/sertf-22.jpg"></a>
					</div>
				</div>				
			</div>			
			
		</div>
	</div>
</section>



<section class="container-fluid block-9"><a name="block9"></a>
	<div class="container">
		<h2>Наши работы</h2>
		<div class="row">
			<div class="col-md-4 col-xs-12">
        <div class="bl-9-central-image">
          <a href="/images/rabota/1.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/1m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
      <div class="col-md-4 col-xs-12">
        <div class="bl-9-central-image">
          <a href="/images/rabota/2.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/2m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
      <div class="col-md-4 col-xs-12">
        <div class="bl-9-central-image">
          <a href="/images/rabota/3.JPG" data-lightbox="image-3" class="galerea"><img src="/images/rabota/3m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
      <div class="col-md-4 col-xs-12">
        <div class="bl-9-central-image">
          <a href="/images/rabota/4.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/4m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
      <div class="col-md-4 col-xs-12">
        <div class="bl-9-central-image">
          <a href="/images/rabota/5.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/5m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
        <div class="bl-9-central-image">
          <a href="/images/rabota/6.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/6m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
        <div class="bl-9-central-image">
          <a href="/images/rabota/7.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/7m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
        <div class="bl-9-central-image">
          <a href="/images/rabota/8.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/8m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
        <div class="bl-9-central-image">
          <a href="/images/rabota/9.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/9m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
        <div class="bl-9-central-image">
          <a href="/images/rabota/10.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/10m.jpg"  class="for-relative"> <button class="button_call_back">Увеличить фото</button></a>      
        </div>
      </div>
		

			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-1.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-1-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-2.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-2-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>			
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-4.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-4-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>			
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-11.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-11-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-12.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-12-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>			
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-16.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-16-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>			
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-18.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-18-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-19.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-19-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-20.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-20-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-21.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-21-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-22.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-22-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota/nasha-rabota-23.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/nasha-rabota-23-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota-2.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/rabota-2-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			<div class="col-md-4 col-xs-12 hidden-sm hidden-xs">
				<div class="bl-9-central-image">
					<a href="/images/rabota-4.jpg" data-lightbox="image-3" class="galerea"><img src="/images/rabota/rabota-4-thumb.jpg"  class="for-relative">	<button class="button_call_back">Увеличить фото</button></a>			
				</div>
			</div>
			
		</div>		
		
		<div class="show-more">
			<!--<button class="button_call_back">Показать еще</button>-->
		</div>
		
		<div class="center">
			<p>Благодаря огромному опыту в сфере продажи и установки автономной канализации, наши специалисты смогут качественно и быстро установить септик или станцию очистки сточных вод на Вашем участке. </p>

			<p>Мы крайне редко прибегаем к услугам спецтехники, поэтому Вы можете не переживать за ландшафт на участке - мы постараемся его сохранить при проведении работ. <b>Заказывайте монтаж автономной канализации у профессионалов!</b></p>
		</div>

	</div>
</section>




<section class="container-fluid block-6"><a name="block6"></a>
	<div class="container">	
		<h2>7 факторов, влияющих на стоимость монтажных работ</h2>
		<div class="row">
			<div class="col-md-4 col-xs-12">
				<p>Заказав автономную канализацию, многие задаются вопросом монтажа. Мы готовы установить автономную станцию “под ключ” на Вашем участке.</p>
				<div class="factor">
					<span class="nomber">1</span>
					<b>Тип грунта<b>
					<p>Любой, даже самый хороший септик или автономная станция очистки прослужат недолго, если при их установке не учитывался тип грунта на участке.</p>
				</div>
				<div class="factor">
					<span class="nomber">2</span>
					<b>Глубина подвода трубы<b>
					<p>Стоимость самой автономной канализации, а так же стоимость монтажных работ напрямую зависят от глубины заложения канализационной трубы.</p>
				</div>
				<div class="factor">
					<span class="nomber">3</span>
					<b>Уровень грунтовых вод<b>
					<p>Если на Вашем участке высокий уровень грунтовых вод, то не любую станцию можно будет устанавливать. Наша задача - подобрать правильную модель для Вашего участка.</p>
				</div>
			</div>
			<div class="col-md-4 col-xs-12">
				<div class="factor">
					<span class="nomber">4</span>
					<b>Необходимость в технике<b>
					<p>В заивсимости от типа почвы, от расположения участка, может потребоваться техника для монтажа автономной канализации. Это так же влияет на стоимость монтажа.</p>
				</div>
				<div class="factor">
					<span class="nomber">5</span>
					<b>Геология участка<b>
					<p>Стоимость монтажных работ на ровном участке значительно ниже, чем стоимость монтажа автономной канализации  на участке с перепадами высот. </p>
				</div>
				<div class="factor">
					<span class="nomber">6</span>
					<b>Модель септика<b>
					<p>В зависимости от модели автономной канализации, септика или станции очистки сточных вод, стоимость монтажных работ может существенно отличаться.</p>
				</div>
				<div class="factor">
					<span class="nomber">7</span>
					<b>Варианты отвода воды<b>
					<p>Очищенную воду можно собирать в отдельный резервуар, использовать для полива растений на участке, использовать повторно или сливать в ливневую канализацию.</p>
				</div>
			</div>
			<div class="col-md-4 hidden-xs">
				<img src="/images/block-6.png">
				<button data-toggle="modal" href="#myModal_zakazat_zvonok" class="button_stoimost"><span id="caption_zakazat">Узнать стоимость монтажа</span></button>
			</div>
		</div>
	</div>
</section>



  

<section class="container-fluid block-14"><a name="block14"></a>
	<div class="container">
		<h2>Что говорят о нас клиенты</h2>
		<div class="otzyvy">
		<div class="reviews">
			<div class="review">
				<div class="row">
					<div class="col-md-3 col-md-offset-1">
						<img src="/images/otz-3.jpg">
					</div>
					<div class="col-md-7">
						<p>При постройке за городом коттеджа занялись и вопросом канализации. Для нас это вообще тяжёлый вопрос, так как мы мало чего понимаем, что нам подходит септик, биосептик, автономная канализация - сейчас чего только нет на рынке. А самое главное, у нас на участке близко расположены грунтовые воды. У соседей септики почти круглый год,особенно весной все полные стоят.</p>
						<p>Когда обратились ЧелныСептик, очень грамотный инженер нам все подробно объяснил. Предложил несколько вариантов, рассказал все плюсы и минусы различных типов канализации. Объяснил их устройство и принцип работы. В общем рассказал все предельно ясно и подробно. Мы выбрали автономное биологическое очистное сооружение. Установили очень быстро и очень качественно. Сейчас пользуемся им постоянно, и никаких вопросов и проблем не возникает ни летом, ни зимой. Честно говоря думали, что зимой все замерзнет, потому что и не глубоко закопан и очищенная вода сливается прямо под забором в дренажную канаву,которая зимой вся в снегу. Рекомендую всем у кого близко грунтовые воды - станции биологической очистки!
						</p>

						<p style="text-align: right;"><b>Руслан и Диана </b></p>
					</div>
				</div>
			</div>
			<div class="review">
				<div class="row">
					<div class="col-md-3 col-md-offset-1">
						<img src="/images/otz-1.jpg">
					</div>
					<div class="col-md-7">
						<p>В 2016 году я заказывал установку автоматической канализации на участок в загородном доме в поселке Малая Шильна. Я, как ответственный покупатель, пересмотрел много разных ссылок, позвонил нескольким фирмам, которые предлагают установку канализации в частном доме и решил остановиться на компании “ЧелныСептик”. Цены у них практически самые низкие во всем регионе, к тому же, соседи тоже заказывали у них установку автоматической станции очистки сточных вод и остались довольны качеством оказанной услуги.</p>
						<p>К нам приехал инженер, снял все необходимые замеры, мы сразу заключили договор, буквально на следующий день нам привезли сам септик, установили его быстро, даже не повредили газон. К тому же, проконсультировали по дальнейшему использованию, как пользоваться автономной канализацией, чтобы она прослужила долгие годы без сбоев. 
						От лица всей нашей семьи выражаем благодарность коллективу “ЧелныСептик” за проделанную работу и рекомендуем всем обращаться только к ним!</p>

						<p style="text-align: right;"><b>Семья Гайнуллиных, Малая Шильна</b></p>
					</div>
				</div>
			</div>
			<div class="review">
				<div class="row">
					<div class="col-md-3 col-md-offset-1">
						<img src="/images/otz-4.jpg">
					</div>
					<div class="col-md-7">
						<p>У меня была простая выгребная яма из ж/б колец. Помню эти вечные мучения с канализацией в своем доме: частые засоры, экономия воды – а то часто приходилось вызывать ассенизатор чтобы выкачивали яму, зловония. Что только не делали: и чистили, и меняли трубы. Постоянно ругалась с соседями, которые жаловались на запах.</p>
						<p>Поэтому и решили заказать септик. Обратились за помощью в ЧелныСептик, где нас проконсультировали по всем вопросам, объяснили чем отличаются септики от выгребной ямы и посоветовали септик с почвенной доочисткой. Теперь и жить легче стало, все само работает, я туда даже не заглядываю. Советовали еще в септик добавлять бактерии, но у меня и так все пока в порядке, сказали просто не надо в канализацию сливать все подряд, что бы не загубить биофлору септика. На счет канализации теперь вообще нет проблем! Никакого запаха, никакого шума, все работает отлично! И с соседями помирилась.</p>

						<p style="text-align: right;"><b>Валентина</b></p>
					</div>
				</div>
			</div>
			
			<div class="review">
				<div class="row">
					<div class="col-md-3 col-md-offset-1">
						<img src="/images/otz-2.jpg">
					</div>
					<div class="col-md-7">
						<p>Все летнее время, проживая на даче, мы испытывали неудобства. Ночью в туалет не выйдешь, да и в плохую погоду тоже. Раковину для мытья посуды в доме не подключишь, да и вообще комфорта никакого. Наконец, решили сделать канализацию на даче. Ребята приехали, подобрали недорогой, оптимальный для нас вариант, септик из бетонных колец и в доме все сделали: канализацию, водопровод! Теперь на даче у нас нет никаких неудобств. Туалет, ванная и кухня - все теперь в доме! Даже дети и внуки стали чаще приезжать отдыхать на дачу. Спасибо ЧелныСептик!</p>
						<p>Советуем всем, особенно пенсионерам!- просто доверьте подбор оборудования и работу этим ребятам!
						</p>

						<p style="text-align: right;"><b>Асхат Мансурович и Рушанья Рафиковна</b></p>
					</div>
				</div>
			</div>
		</div>
		<div class="otz-left"><img src="/images/left-white.png"></div>
		<div class="otz-right"><img src="/images/right-white.png"></div>
	</div>	
	</div>	
</section>

<section class="container-fluid block-15"><a name="block15"></a>
    <div class="container">
	<a name="vopros_block"></a>
    <div class="vopros_content">
      <p><div class="vopros_title">ОСТАЛИСЬ <span style="color:black">ВОПРОСЫ?</span></div>
      <div class="vopros_href"><a data-toggle="modal" data-target="#myModal_zakazat_zvonok" id="vopros_a" href="#">Задайте их специалисту</a></div><p>
    </div>
    </div>  
</section>


<section class="container-fluid block-3"><a name="block3"></a>
	<div class="container">		 
		<div class="row">	
			<div class="padding-50-0">
			<div class="col-md-9 col-md-offset-3 col-xs-12">
				<h2>Узнайте какие <span class="fon-yellow">13 ошибок</span> совершают<br/> при выборе автономной канализации.</h2>
				<p>Заполните Ваши данные и мы пришлем их Вам на почту.</p>
				<form id="form_sendfile" method="post" action=""  onsubmit="sendFile(this); return false;" data-metrika-target="filezayavka">
					<div class="row">
						<div class="col-md-5 col-md-offset-1 col-xs-12">
							<div class="form-group" >
							  <input type="text" name="name" id="form-input-name" placeholder="  Ваше имя">              
							</div>	
						</div>
						<div class="col-md-5 col-xs-12">
							<div class="form-group">
							  <input type="text" name="phone" id="form-input-phone" placeholder="  Ваш телефон">          
							</div>
						</div>
						<div class="col-md-5 col-md-offset-1 col-xs-12">
							<div class="form-group">
							  <input type="text" name="email" id="form-input-email" placeholder="  Ваш e-mail">          
							</div>
						</div>
						<input type="text" placeholder="UTM фраза" name="utm11">
						<input type="text" placeholder="UTM компания" name="utm12">
						<input type="text" placeholder="UTM источник" name="utm13">
						<div class="col-md-5 col-xs-12">
							<div class="form-group">
								<button class="button_call_back">Хочу узнать</button>
							</div>
						</div>	
					</div>
				</form>		
			</div>  
		</div>
	</div> 	
	</div> 
</section>




<section class="container-fluid block-10"><a name="block10"></a>
	<div class="container">
		<h2>Обязательные этапы монтажа септика</h2>
		<div class="row">
			<div class="col-md-4 col-md-offset-1 col-xs-12">
				<div class="etap" style="color: #fff">
					<p>Подготовка <br/>котлована</p>
					<span>1</span>
				</div>
				<div class="etap" style="color: #fff">
					<p>Выравнивание <br/>станции</p>
					<span>3</span>
				</div>
				<div class="etap" style="color: #fff">
					<p>Заполнение <br/>водой</p>
					<span>5</span>
				</div>
				<div class="etap" style="color: #fff">
					<p>Проверка <br/>функциониования</p>
					<span>7</span>
				</div>
			</div>
			<div class="col-md-2 hidden-xs">
				<img src="/images/strelka.png">
			</div>
			<div class="col-md-4 col-md-offset-1 col-xs-12">
				<div class="right-col-bl-10">
					<div class="etap" style="color: #fff">
						<p>Установка <br/>станции</p>
						<span>2</span>
					</div>
					<div class="etap" style="color: #fff">
						<p>Монтаж <br/>трубопровода</p>
						<span>4</span>
					</div>
					<div class="etap" style="color: #fff">
						<p>Пуско-наладочные <br/>работы</p>
						<span>6</span>
					</div>
					<div class="etap" style="color: #fff">
						<p>Финальная <br/>засыпка</p>
						<span>8</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="container-fluid block-11"><a name="block11"></a>
	<div class="container">		
			<h2>Отзывы о станциях ТОПАС</h2>
			<div class="row">
				<div class="col-md-4 col-xs-12">
					<iframe src="https://www.youtube.com/embed/pLFsd-fRdtE" frameborder="0" allowfullscreen></iframe>
				</div>
				<div class="col-md-4 col-xs-12">
					<iframe src="https://www.youtube.com/embed/Kp1E1X5b8JI" frameborder="0" allowfullscreen></iframe>
				</div>
				<div class="col-md-4 col-xs-12">
					<iframe src="https://www.youtube.com/embed/MSGrXo2vatA" frameborder="0" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="container-fluid block-12"><a name="block12"></a>
	<div class="container">
		<div class="row">
			<div class="col-md-3 hidden-xs">
				<img src="/images/block-12-image.png">
			</div>
			<div class="col-md-9 col-xs-12">
				<div class="text-block-12">
					Заказывая установку автономной канализации у нас, вы получаете <b>гарантийное и дальнейшее сервисное обслуживаение.</b>
					
					<div class="center">
						<button data-toggle="modal" href="#myModal_zakazat_zvonok" class="button_call_back"><span id="caption_zakazat">Оставить заявку</button>
					</div>
				</div>				
			</div>
		</div>
	</div>
</section>

<section class="container-fluid block-13"><a name="block13"></a>
	<div class="container">
		<h2>Как мы работаем?</h2>
		<div class="row">
			<div class="col-md-4 col-md-offset-2">
				<p style="text-align: right; font-size: 20px">Вы оставляете заявку на сайте или <span style="text-decoration: underline">звоните нам</span> по телефону</p>
			</div>
			<div class="col-md-2">
				<button data-toggle="modal" href="#myModal_zakazat_zvonok" class="button_call_back"><span id="caption_zakazat">Оставить заявку</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="item-bl-13">
					<img src="/images/icon-1.png">
					<p>Менеджер согласует с<br/> вами время и дату<br/> визита инженера</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="item-bl-13">
					<img src="/images/icon-2.png">
					<p>Инженер выезжает к<br/> Вам и делает расчет<br/> сметы</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="item-bl-13">
					<img src="/images/icon-3.png">
					<p>Осуществляем монтаж <br/>канализационной<br/> системы "под ключ"</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="item-bl-13">
					<img src="/images/icon-4.png">
					<p>Вы наслаждаетесь <br/>комфортом в совем <br/>доме</p>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="container-fluid block-16"><a name="block16"></a>
    <div class="container">
		<h2>Остались вопросы?</h2>
		<div id="accordion">
			  <h3><span>1. Что такое септик? <i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i>
				</h3>
			  <div>
				<p>
					По законодательству РФ сброс сточных вод на открытый грунт запрещен и преследуется по закону. В местах, где нет доступа к центральным канализационным сетям, устанавливается автономная канализация (септик). Септик - это автономная канализация, которая не загрязняет почву, не источает запаха и соответствует всем стандартам СанПин.
				</p>
			  </div>
			  <h3><span>2. Сколько это стоит? </span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					Наша компания подберет для вас оптимальное решение и предложит 3 различных варианта для вашего загородного участка. Стоимость септика для дома, в котором проживают до 5 человек, колеблется от 55 000 рублей до 200 000 рублей (в зависимости от заявленных требований). Кроме того, у нас постоянно проходят различные акции, узнать о которых вы можете позвонив по телефону.
				</p>
			  </div>
			  <h3><span>3. Какие бактерии нужны для септика?</span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					Прежде всего следует знать, что постоянно добавлять бактерии нужно только в накопительные септики и септики с почвенной доочисткой. В септики с глубокой биологической очисткой, такие как Топас и пр., добавлять бактерии не нужно.
				</p>
			  </div>
			  <h3><span>4. А зимой септик работает? </span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					Все септики, которые устанавливает наша компания, работают эффективно круглый год.
				</p>			 
			  </div>
			   <h3><span>5. У меня высокие грунтовые воды, что вы можете <br/>посоветовать? </span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					Наша компания может предложить несколько вариантов септиков, которые эффективно работают при высоких грунтовых водах. Для экономии на монтажных работах, рекомендуем производить монтаж зимой, когда уровень грунтовых вод максимально низкий.
				</p>			 
			  </div>
			   <h3><span>6. Могу ли я установить септик зимой? </span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					Наша компания осуществляет монтажные работы по установке септиков круглый год, если температура не ниже -20°.
				</p>			 
			  </div>
			   <h3><span>7. Как производится монтаж септика? </span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					Монтаж септика производится без использования тяжелой техники. Септик монтируется вручную, с максимально аккуратным отношением к вашему ландшафту. Средняя продолжительность монтажа не более одного дня.
				</p>			 
			  </div>
			   <h3><span>8. Какую воду можно сливать в септик? </span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					В септики, которые устанавливает наша компания, можно сливать любые хозяйственно-бытовые стоки, в том числе: канализационные стоки, вода из-под ванны, душа, раковины, стиральной машины, посудомоечной машины и бани. Не желательно попадание: горюче-смазочных и лакокрасочных материалов (бензин, керосин, ацетон, краска).
				</p>			 
			  </div>
			   <h3><span>9. Как заказать? </span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					Позвоните по телефону, или оставьте заявку на сайте, и первый освободившийся специалист свяжется с вами.
				</p>			 
			  </div>
			   <h3><span>10. Какие гарантии я получу? </span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					Мы фиксируем в договоре окончательную стоимость монтажа до начала работ и даем юридические гарантии, что она не изменится.
				</p>			 
			  </div>
			   <h3><span>11. Как много электричества потребляют станции с глубокой биологической очисткой? </span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					Совсем не много. Так станция глубокой биологической очистки на 5 человек, потребляет всего 40 Вт/час, т.е. чуть более 1 кВт/сутки. Таким образом за год (при постоянной работе, без выключения) электричества нагорит на сумму менее 2000 руб.
				</p>			 
			  </div>
			   <h3><span>12. Могу ли я оплатить безналичным переводом? </span></span><i class="fa 	fa-chevron-circle-down" aria-hidden="true"></i></h3>
			  <div>
				<p>
					В нашей компании имеются различные формы оплаты. В том числе, мы принимаем безналичные платежи и банковские карты.
				</p>			 
			  </div>
		</div>
 
	</div>
</section>
  
<footer>
	<div class="container">
      <div class="header-top">
    	  <div class="row">
    			<div class="col-md-5  col-sm-6 col-xs-12">	
					<div class="logo">             
						<img src="images/logo.png">
						<div class="logo-inf-bottom">Автономная канализация для Вашего дома</div>
					</div>
				</div>
    			<div class="col-md-4  col-sm-6 col-xs-12">
					<div class="phone-inf">	
						<div class="phone">8-<span class="green">962</span>-558-84-94</div>
					</div>
    			</div>
    			<div class="col-md-3  col-sm-6 col-xs-12">
					<div class="call-back">	
						<button data-toggle="modal" href="#myModal_zakazat_zvonok" class="button_call_back"><span id="caption_zakazat">Заказать звонок</span></button>
					</div>
				</div>
			</div>		 
		</div> 
    </div> 
</footer> 


	<div id="new-call-request" class="informer">
		<div>							
			<span id="client-name" style="color:orange"></span> оставил(а) заявку: <span id="client-remont"></span>						
		</div>						
		<div>							
			<span style="color:#bbb" id="client-city"></span>	
		</div>					 
	</div>
  

<!-- Модальные окно - Заказать звонок -->
  <div id="myModal_zakazat_zvonok" class="modal fade">
  <div class="modal-dialog" id="modal_zvonok_width">
    <div class="modal-content">
      <!-- Заголовок модального окна -->
      <div class="modal-header">
        <button type="button" class="close" id="modal_zvonok_close" data-dismiss="modal" aria-hidden="true"><img src="images/icon-close.png"></button></div>
      <!-- Основное содержимое модального окна -->
      <div class="modal-body" id="modal_zvonok_container">
        <div class="modal_zvonok_content">
          <h4 class="modal-title" id="modal_zvonok">ОСТАВЬТЕ ЗАЯВКУ</h4>        
          <h5 class="modal_zvonok_text">
            и мы Вам перезвоним </br> <span class="yellow"> в ближайшее время!</span>
          </h5>
          <div class="modal_zvonok_form_content">
          	<form id="form_zakazat_zvonok" method="post" action=""  onsubmit="sendForm(this); return false;" data-metrika-target="prostozayavka">
					<div class="form-group" >
					  <input type="text" name="name" id="form-input-name" placeholder="  Имя">              
					</div>
					<!--<div class="form-group">
					  <input type="text" name="email" id="form-input-email" placeholder="  E-mail">              
					</div>-->
					<div class="form-group">
					  <input type="text" name="phone" id="form-input-phone" placeholder="  Телефон">          
					</div>
						<input type="text" placeholder="UTM фраза" name="utm1">
						<input type="text" placeholder="UTM компания" name="utm2">
						<input type="text" placeholder="UTM источник" name="utm3">
					
					<button class="button_call_back">Заказать звонок</button>	
			</form>
          </div>          
        </div>
      </div>
     
    </div>
  </div>
  </div>
    <!-- Модальные окно - Спасибо за заявку -->
  <div id="myModal_spasibo" class="modal fade">
  <div class="modal-dialog" id="modal_zvonok_size">
    <div class="modal-content">
      <!-- Основное содержимое модального окна -->
      <div class="modal-body" id="modal_spasibo_container">
        <div class="modal_zvonok_content">
          <h4 class="modal-title" id="modal_spasibo">СПАСИБО ЗА</br> ОСТАВЛЕННУЮ ЗАЯВКУ</h4>        
          <h5 class="modal_zvonok_text">
            Мы получили Вашу заявку, в </br>ближайшее время менеджер </br>Вам перезвонит
          </h5>
          <div class="modal_zvonok_form_content">
            <button type="button" data-dismiss="modal" id="modal_close_href">Закрыть</button>
          </div>
        </div>
      </div>
    
    </div>
  </div>
  </div>
  
  
  
  <!-- Модальные окно - Файл отправлен-->
  <div id="myModal_file_finish" class="modal fade">
  <div class="modal-dialog" id="modal_zvonok_size">
    <div class="modal-content">
      <!-- Основное содержимое модального окна -->
      <div class="modal-body" id="modal_spasibo_container">
        <div class="modal_zvonok_content">
          <h4 class="modal-title" id="modal_spasibo">СПАСИБО ЗА</br> ОСТАВЛЕННУЮ ЗАЯВКУ</h4>        
          <h5 class="modal_zvonok_text">
             Файл "13 ошибок при выборе септика отправлен Вам на почту"
          </h5>
          <div class="modal_zvonok_form_content">
            <button type="button" data-dismiss="modal" id="modal_close_href">Закрыть</button>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  </div>
  

  
	      <!-- Модальные окно - расчет -->
  <div id="myModal_test" class="modal fade">
  <div class="modal-dialog" id="modal_zvonok_size">
    <div class="modal-content">
      <!-- Заголовок модального окна -->
      <div class="modal-header">
        <button type="button" class="close" id="modal_zvonok_close" data-dismiss="modal" aria-hidden="true"><img src="/images/icon-close.png"></button></div>
      <!-- Основное содержимое модального окна -->
      <div class="modal-body" id="modal_zvonok_container">
			<div class="oprosnik">
	<form id="form_opros" method="post" action=""  onsubmit="sendTest(this); return false;" data-metrika-target="testcomplete">
 	<section id="step1" class="steps">
		<div class="container">
			<h1>Пройдите тест за 1 минуту<br/>
и узнайте какой септик подойдет<br/>
для Вашего дома и его стоимость</h1>
			<h2>Ответьте на 10 вопросов и получите</h2>
			<ul>
				<li>1. Стоимость Вашего септика и стоимость монтажа</li>
				<li>2. Брошюру о том, как избежать ошибок при выборе септика</li>
				<li>3. Подарки! Вы экономите наше время, мы экономим Ваши деньги</li>
			</ul>
			<a class="btn-test">Пройти тест</a>
		</div>
	</section> 
	
	<section id="step2" class="steps">
		<div class="container">
			<h2>Тип объекта</h2>
			<div class="row">
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="types" value="Дача" />
							<img src="/images/neww1.jpg">
							<span>Дача</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="types" value="Дом/Коттедж" />
							<img src="/images/neww2.jpg">
							<span>Дом/Коттедж</span>
						</label>
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="types" value="Гостиница" />
							<img src="/images/neww3.jpg">
							<span>Гостиница</span>
						</label>
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="types" value="Другое" />
							<img src="/images/neww4.jpg">
							<span>Другое</span>
						</label>
					</div>
				</div>
			</div>
			
			<div class="progress-container">
				<span>Вопрос 1 из 10</span>
				<progress value="0" max="10"></progress>
			</div>
		</div>
	</section>
	
	
	<section id="step3" class="steps">
		<div class="container">
			<h2>Количество постоянно проживающих человек</h2>
			<div class="row">
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="persons" value="от 1 до 4 человек" />
							<img src="/images/persons-1-4.jpg">
							<span>от 1 до 4 человек</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="persons" value="от 5 до 7 человек" />
							<img src="/images/persons-5-7.jpg">
							<span>от 5 до 7 человек</span>
						</label>
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="persons" value="8 человек и более" />
							<img src="/images/persons-8.jpg">
							<span>8 человек и более</span>
						</label>
					</div>
				</div>
			</div>
			
			<div class="progress-container">
				<span>Вопрос 2 из 10</span>
				<progress value="1" max="10"></progress>
			</div>
		</div>
	</section>
	
	<section id="step4" class="steps">
		<div class="container">
			<h2>Сезонность</h2>
			<div class="row">
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="seasons" value="Сезонное (только лето)" />
							<img src="/images/neww5.jpg">
							<span>Сезонное (только лето)</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="seasons" value="Постоянное" />
							<img src="/images/neww6.jpg">
							<span>Постоянное</span>
						</label>
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="seasons" value="Летом (возможно посещение зимой)" />
							<img src="/images/neww7.jpg">
							<span>Летом (возможно посещение зимой)</span>
						</label>
					</div>
				</div>			
			</div>
			
			<div class="progress-container">
				<span>Вопрос 3 из 10</span>
				<progress value="2" max="10"></progress>
			</div>
		</div>
	</section>
	
	
	
	<section id="step5" class="steps">
		<div class="container">
			<h2>Какой уровень грунтовых вод на Вашем участке</h2>
			<div class="row">
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="grunt" value="Низкие грунтовые воды" />
							<img src="/images/grunt-1.jpg">
							<span>Низкие грунтовые воды</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="grunt" value="Высокие грунтовые воды" />
							<img src="/images/grunt-2.jpg">
							<span>Высокие грунтовые воды</span>
						</label>
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="grunt" value="Затрудняюсь ответить" />
							<img src="/images/grunt-3.jpg">
							<span>Затрудняюсь ответить</span>
						</label>
					</div>
				</div>
			</div>
			
			<div class="progress-container">
				<span>Вопрос 4 из 10</span>
				<progress value="3" max="10"></progress>
			</div>
		</div>
	</section>
	<section id="step6" class="steps">
		<div class="container">
			<h2>Что из этого у вас имеется и в каком количестве</h2>
			<div class="row">
				<div class="col-md-4">
					<div class="exist">
						<img src="/images/exist-1.png">
						<label>Ванна обычная</label><input type="number" name="exist[]" min="0" placeholder="_ _ _ _"> <span> шт.</span>
					</div>
				</div>
				<div class="col-md-4">
					<div class="exist">
						<img src="/images/exist-4.png"><label>Раковина</label><input type="number" name="exist[]" min="0" placeholder="_ _ _ _"> <span> шт.</span>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="exist">
						<img src="/images/exist-7.png"><label>Биде</label><input type="number" name="exist[]" min="0" placeholder="_ _ _ _"> <span> шт.</span>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="exist">
						<img src="/images/exist-2.png">
						<label>Ванна угловая</label>	<input type="number" name="exist[]" min="0" placeholder="_ _ _ _"> <span> шт.</span>				
					</div>
				</div>
				<div class="col-md-4">
					<div class="exist">
						<img src="/images/exist-5.png"><label>Душевая кабинка</label><input name="exist[]" type="number" min="0" placeholder="_ _ _ _"> <span> шт.</span>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="exist">
						<img src="/images/exist-8.png"><label>Стиралка</label><input  name="exist[]" type="number" min="0" placeholder="_ _ _ _"> <span> шт.</span>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="exist">
						<img src="/images/exist-3.png"><label>Унитаз</label><input name="exist[]" type="number" min="0" placeholder="_ _ _ _"> <span> шт.</span>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="exist">
						<img src="/images/exist-6.png"><label>Посудомойка</label><input name="exist[]" type="number" min="0" placeholder="_ _ _ _"> <span> шт.</span>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="exist">
						<img src="/images/exist-9.png"><label>Прочее</label><input name="exist[]" type="text" placeholder="_ _ _ _ _ _ _ _ _ _">						
					</div>
				</div>
				
				
			</div>
			<div class="nav-buttons">
				<!--<a class="btn-cancel"><i class="fa fa-arrow-left" aria-hidden="true"></i> Отмена</a>		-->					<a class="btn-test">Далее <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
			</div>
			<div class="progress-container">
				<span>Вопрос 5 из 10</span>
				<progress value="4" max="10"></progress>
			</div>
		</div>
	</section>
	
		
	<!--<section id="step7" class="steps">
		<div class="container">
			<h2>Куда вы планируете отводить очищенную воду</h2>
			<div class="row">
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="kuda" value="На грунт" />
							<img src="/images/neww8.jpg">
							<span>На грунт</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="kuda" value="В дренажный колодец" />
							<img src="/images/neww9.jpg">
							<span>В дренажный колодец</span>
						</label>
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="kuda" value="В ливневую канаву" />
							<img src="/images/neww10.jpg">
							<span>В ливневую канаву</span>
						</label>
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="kuda" value="Затрудняюсь ответить" />
							<img src="/images/neww11.jpg">
							<span>Затрудняюсь ответить</span>
						</label>
					</div>
				</div>
			</div>			
			<div class="progress-container">
				<span>Вопрос 6 из 10</span>
				<progress value="5" max="10"></progress>
			</div>
		</div>
	</section>-->
	
	<section id="step7" class="steps">
		<div class="container">
			<h2>Глубина залегания вашей трубы</h2>
			<div class="row">
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="glubina" value="от 40 см - до 90 см" />
							<img src="/images/new6_1.jpg">
							<span>от 40 см - до 90 см</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="glubina" value="от 90 см - до 1,5 м" />
							<img src="/images/new6_2.jpg">
							<span>от 90 см - до 1,5 м</span>
						</label>
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="glubina" value="от 1,5 м - и ниже" />
							<img src="/images/new6_3.jpg">
							<span>от 1,5 м - и ниже</span>
						</label>
					</div>
				</div>				
			</div>			
			<div class="progress-container">
				<span>Вопрос 6 из 10</span>
				<progress value="5" max="10"></progress>
			</div>
		</div>
	</section>
	<section id="step8" class="steps">
		<div class="container">
			<h2>На каком расстоянии от дома планируется установить септик?</h2>
			<div class="row">
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="rasstoyanie" value="До 5 метров" />
							<img src="/images/rasst-1.jpg">
							<span>До 5 метров</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="rasstoyanie" value="Далее 5 метров" />
							<img src="/images/rasst-2.jpg">
							<span>Далее 5 метров</span>
						</label>
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="rasstoyanie" value="Затрудняюсь ответить" />
							<img src="/images/rasst-3.jpg">
							<span>Затрудняюсь ответить</span>
						</label>
					</div>
				</div>
			</div>
			
			<div class="progress-container">
				<span>Вопрос 7 из 10</span>
				<progress value="6" max="10"></progress>
			</div>
		</div>
	</section>
	
	<section id="step9" class="steps">
		<div class="container">
			<h2>Выберите необходимый уровень очистки</h2>
			<div class="row">
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="level" value="Высокий уровень очистки (не требует откачки ассенизаторской машиной)" />
							<img src="/images/premium-new.jpg">
							<span>Высокий уровень очистки (не требует откачки ассенизаторской машиной)</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="level" value="Средний уровень (почвенная доочистка)" />
							<img src="/images/standart-new.jpg">
							<span>Средний уровень (почвенная доочистка)</span>
						</label>
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="level" value="Без очистки (накопительная емкость, выгребная яма, кольца. Буду откачивать ассенизаторской машиной)" />
							<img src="/images/ecomon.jpg">
							<span>Без очистки (накопительная емкость, выгребная яма, кольца. Буду откачивать ассенизаторской машиной)</span>
						</label>
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="level" value="Еще не определились" />
							<img src="/images/rasst-3.jpg">
							<span>Еще не определились</span>
						</label>
					</div>
				</div>
			</div>
			
			<div class="progress-container">
				<span>Вопрос 8 из 10</span>
				<progress value="7" max="10"></progress>
			</div>
		</div>
	</section>
	
	<section id="step10" class="steps">
		<div class="container">
			<h2>Кто будет заниматься установкой и подключением канализации?</h2>
			<div class="row">
				<div class="col-md-6">
					<div class="persons">
						<label>
							<input type="radio" name="who" value="Самостоятельно" />
							<img src="/images/neww16.jpg">
							<span>Самостоятельно</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-6">
					<div class="persons">
						<label>
							<input type="radio" name="who" value="Профильная организация" />
							<img src="/images/pro.jpg">
							<span>Профильная организация</span>
						</label>
					</div>
				</div>
				
			</div>
			
			<div class="progress-container">
				<span>Вопрос 9 из 10</span>
				<progress value="8" max="10"></progress>
			</div>
		</div>
	</section>
	
		<section id="step11" class="steps">
		<div class="container">
			<h2>В какие сроки планируете монтаж?</h2>
			<div class="row">
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="kogda" value="В течение 1-2 недели" />
							<img src="/images/neww18.jpg">
							<span>В течение 1-2 недели</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="kogda" value="В течение месяца" />
							<img src="/images/neww19.jpg">
							<span>В течение месяца</span>
						</label>
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="kogda" value="До конца года" />
							<img src="/images/neww20.jpg">
							<span>До конца года</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-3">
					<div class="persons">
						<label>
							<input type="radio" name="kogda" value="В следующем году" />
							<img src="/images/neww21.jpg">
							<span>В следующем году</span>
						</label>
					</div>
				</div>
			</div>
			
			<div class="progress-container">
				<span>Вопрос 10 из 10</span>
				<progress value="9" max="10"></progress>
			</div>
		</div>
	</section>

	
	<section id="step12" class="steps">
		<div class="container">
			<h2>Выберите ваш подарок</h2>
			<div class="row">
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="podarok" value="Годовой запас бактерий для септика" />
							<img src="/images/podarok-1.jpg">
							<span>Годовой запас бактерий для септика</span>							
						</label>						
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="podarok" value="Бесплатное первое обслуживание" />
							<img src="/images/podarok-2.jpg">
							<span>Бесплатное первое<br/> обслуживание</span>
						</label>
					</div>
				</div>
				<div class="col-md-4">
					<div class="persons">
						<label>
							<input type="radio" name="podarok" value="Хочу получить персональную скидку!" />
							<img src="/images/podarok-3.jpg">
							<span>Хочу получить персональную скидку!</span>
						</label>
					</div>
				</div>
			</div>
			
				<div class="progress-container">
				<span>Готово!</span>
				<progress value="10" max="10"></progress>
			</div>
			
		</div>
	</section>
	
<section id="step13" class="steps">
		<div class="container">
			<h3>Спасибо за пройденный тест!</h3>
			<p  style="font-size: 20px; color: #fff;">В ближайшее время мы предоставим расчёт и ответим на все ваши вопросы.</h3>
			<h2 style="padding-top: 10px;">Куда отправить информацию и подарки?</h2>
					<input type="text" placeholder="Ваше имя" name="name">

					<input type="text" placeholder="Ваш телефон" name="phone">

					<input type="text" placeholder="Ваше email" name="email">
                    	<input type="text" placeholder="UTM фраза" name="utm21">
						<input type="text" placeholder="UTM компания" name="utm22">
						<input type="text" placeholder="UTM источник" name="utm23">
			
				<div class="nav-buttons">
					<!--<a class="btn-cancel"><i class="fa fa-arrow-left" aria-hidden="true"></i> Отмена</a>		-->			<button class="btn-test" type="submit">Далее <i class="fa fa-arrow-right" aria-hidden="true"></i></button>
				</div>			
			
			<div class="progress-container">
				<span>Готово!</span>
				<progress value="10" max="10"></progress>
			</div>
		</div>
	</section> 
	
	<section id="step14" class="steps">
		<div class="container">
			<h2 style="font-size: 22px; color: #fff;">Благодарим за ответы!</h2>
			<p  style="font-size: 20px; color: #fff;">В ближайшее время мы предоставим расчёт и ответим на все ваши вопросы.</p>

			<div class="progress-container">
				<span>Готово!</span>
				<progress value="10" max="10"></progress>
			</div>
			
		</div>
	</section>
	</form>
</div>
      </div>
    </div>
  </div>
</div>


	  
	<!-- Модальные окно - расчет -->
<div id="myModal_spasibo_test" class="modal fade">
  <div class="modal-dialog" id="modal_zvonok_size">
    <div class="modal-content">
      <!-- Заголовок модального окна -->
      <div class="modal-header">
        <button type="button" class="close" id="modal_zvonok_close" data-dismiss="modal" aria-hidden="true"><img src="/images/icon-close.png"></button></div>
      <!-- Основное содержимое модального окна -->
      <div class="modal-body" id="modal_zvonok_container">  
	  	<section>
			<h2 style="font-size: 22px; color: #fff;">Благодарим за ответы!</h2>
			<p  style="font-size: 20px; color: #fff;">В ближайшее время мы предоставим расчёт и ответим на все ваши вопросы.</p>
			<div class="progress-container">
				<span>Готово!</span>
				<progress value="10" max="10"></progress>
			</div>
			
	</section>
	 </div></div></div> </div>
  
  <!-- Модальные окно, появляется через 1 мин -->
 <!-- <div id="myModal_time" class="modal fade">
  <div class="modal-dialog" id="modal_time_size">
    <div class="modal-content">
      <!-- Заголовок модального окна -->
     <!-- <div class="modal-header">
        <button type="button" class="close" id="modal_zvonok_close" data-dismiss="modal" aria-hidden="true"><img src="images/icon-close.png"></button>
	  </div>
      <!-- Основное содержимое модального окна -->
    <!--  <div class="modal-body" id="modal_time_container">
        <div class="modal_zvonok_content">
          <h4 class="modal-title" id="modal_zvonok">Не можете выбрать автономную канализацию?</h4>        
          <h5 class="modal_zvonok_text">
            Оставьте свои контакты и уточните Вашу персональную скидку
          </h5>
          <div class="modal_zvonok_form_content">
          <form id="form_zakazat_zvonok" method="post" action=""  onsubmit="sendForm(this); return false;" data-metrika-target="prostozayavka">
		  <div class="inputs-center">
				<div class="form-group" id="modal_time_form">
				  <input type="text" name='name' class="form-control" id="modal_input_name" placeholder="Имя*">              
				</div>
				<div class="form-group" id="modal_time_form-2">
				  <input type="text" name="phone" class="form-control" id="modal_input_phone" placeholder="Телефон*">          
				</div>
		   </div>
            <button class="modal_button_zakazat"><span id="modal_caption_zakazat">Получить персональную скидку</button>
          </form>
		   <button type="button" id="modal_time_close" data-dismiss="modal" aria-hidden="true">Мне это не интересно</button>
          </div>          
        </div>
      </div>
      <!-- Футер модального окна 
      <div class="modal-footer">
        <!--<button class="button_calc"><span id="caption_zakazat">Заказать звонок</button>
      </div>-->
  <!--  </div>
  </div>
  </div>-->
  
  <a href="#myModal_test" data-toggle="modal" id="raschet_fixed" class="button orange-button" style="max-width: 460px; width: 100%;">
			  Подобрать септик и рассчитать стоимость
			  <i class="glyphicon glyphicon-chevron-right"></i>
			</a>
  
  
  
  <insert name="show_js">

  <script type="text/javascript" src="/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/libs/lightbox/js/lightbox.js"></script>
  <script type="text/javascript" src="/js/slick.min.js"></script>
  <script src="/js/maskedinput.js"></script>
  <script type="text/javascript" src="/js/my.js"></script>




</body>

</html>
