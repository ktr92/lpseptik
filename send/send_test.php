<?php 
	
	
	$error = array();
	// полученные данные
	$result = array(
		'name' => $_POST['name'],
		'phone' => $_POST['phone'],
		'email' => $_POST['email'],
	);
	foreach($result as $fieldName => $oneField){
		if($oneField == '' || !isset($oneField)){
			$error[$fieldName] = 'Поле обязательно для заполнения';
		}
	}	
	

	$answers = array(
		'persons' => $_POST['persons'],
		'grunt' => $_POST['grunt'],
		'exist' => $_POST['exist'],
		'rasstoyanie' => $_POST['rasstoyanie'],
		'variant' => $_POST['variant'],
		'podarok' => $_POST['podarok'],	
		'types' => $_POST['types'],
		'seasons' => $_POST['seasons'],
		/* 'kuda' => $_POST['kuda'], */
		'level' => $_POST['level'],
		'who' => $_POST['who'],
		'kogda' => $_POST['kogda'],
		'glubina' => $_POST['glubina'],
	);
	
	
	foreach($answers as $ansName => &$ansField){
		if(empty($ansField)){
			$ansField = '-';
		}
	}	
	
	$exist="";
	$arr = array( 0 => "Ванна обычная", 1 => "Раковина", 2 => "Биде", 3 => "Груша", 4 => "Душевая кабинка", 5 => "Стиралка", 6 => "Унитаз", 7 => "Посудомойка", 8 => "Прочее",);
	$k=0;
	foreach ($answers['exist'] as $i) {
		if(!empty($i)){			
			if ($k!=8) {
				$exist=$exist.$arr[$k].": ".$i." шт. /";
			}
			else {
				$exist=$exist.$arr[$k].": ".$i;
			}
		}
		$k++;
	}
	
	if(empty($error)){
		// если нет ошибок сообщаем об успехе
		echo json_encode(array('result' => 'success'));
		
		$to  = "leads.velvetmedia@gmail.com, velvet-media@yandex.ru, sergeiseptik@mail.ru, info@chelnyseptik.ru";
			
		$subject = "lp.chelnyseptik.ru - Тестирование пройдено"; 

		$message = ' <p>lp.chelnyseptik.ru - Пройден тест</p> </br> 
						<p>Имя: <b>'.$_POST['name'].'</b></p>  </br> 
						<p>Телефон: <b>'.$_POST['phone'].'</b></br>
						<p>Email: <b>'.$_POST['email'].'</b></br>
						</br> 
						<p>-------------------------------</p>
						</br>
						<p>Тип объекта: <b>'.$answers['types'].'</b></p>
						<p>Количество постоянно проживающих человек: <b>'.$answers['persons'].'</b></p>
						<p>Сезонность: <b>'.$answers['seasons'].'</b></p>
						<p>Какой уровень грунтовых вод на Вашем участке: <b>'.$answers['grunt'].'</b></p>						
						<p>Что из этого у вас имеется и в каком количестве: <b>'.$exist.'</b></p>
						<p>Глубина залегания вашей трубы<b>'.$answers['glubina'].'</b></p>
						<p>На каком расстоянии от дома планируется установить септик?: <b>'.$answers['rasstoyanie'].'</b></p>						
						<p>Выберите необходимый уровень очистки: <b>'.$answers['level'].'</b></p>
						<p>Кто будет заниматься установкой и подключением канализации?: <b>'.$answers['who'].'</b></p>
						<p>В какие сроки планируете монтаж?: <b>'.$answers['kogda'].'</b></p>
						<p>Выберите ваш подарок: <b>'.$answers['podarok'].'</b></p>
						</br> 
						
						
						<p>UTM фраза: '.$_POST['utm21'].'</p>
						<p>UTM компания: '.$_POST['utm22'].'</p>
						<p>UTM источник: '.$_POST['utm23'].'</p>
						
						</p> ';

		$headers  = "Content-type: text/html; charset=utf-8 \r\n"; 
		$headers .= "From: От кого письмо <info@chelnyseptik.ru>\r\n"; 
		$headers .= "Reply-To: reply-to@example.com\r\n"; 

		mail($to, $subject, $message, $headers); 
		
	}else{
		// если есть ошибки то отправляем
		echo json_encode(array('result' => 'error', 'text_error' => $error));
	}
	
	
/*
	 


*/
