<?php 
	
	
	$error = array();
	// полученные данные
	$result = array(
		'name' => $_POST['name'],
		'phone' => $_POST['phone'],
	);
	foreach($result as $fieldName => $oneField){
		if($oneField == '' || !isset($oneField)){
			$error[$fieldName] = 'Поле обязательно для заполнения';
		}
	}	
	if(empty($error)){
		// если нет ошибок сообщаем об успехе
		echo json_encode(array('result' => 'success'));
		
		$to  = "sergeiseptik@mail.ru, info@chelnyseptik.ru, leads.velvetmedia@gmail.com" ;
		
		$subject = "lp.chelnyseptik.ru - Заявка на продукцию"; 

		$message = ' <p>lp.chelnyseptik.ru - Новая заявка на продукцию</p> </br> 
						<p>Товар: <b>'.$_POST['product'].'</b></p>  </br> 
						<p>Имя: <b>'.$_POST['name'].'</b></p>  </br> 
						<p>Телефон: '.$_POST['phone'].'</br></p>
						<p>UTM фраза: '.$_POST['utm31'].'</p>
						<p>UTM компания: '.$_POST['utm32'].'</p>
						<p>UTM источник: '.$_POST['utm33'].'</p>
						
						';

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
