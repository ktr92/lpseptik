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
	if(empty($error)){
		// если нет ошибок сообщаем об успехе
		echo json_encode(array('result' => 'success'));
		
		$to  = "info@chelnyseptik.ru, leads.velvetmedia@gmail.com, ".$_POST['email']."";		
				
		$subject = "lp.chelnyseptik.ru - 13 ошибок при выборе септика"; 
		$message = ' 	<p>Вы оставляли заявку на сайте http://lp.chelnyseptik.ru/</p> </br> 
						<p>Имя: '.$_POST['name'].'</p></br>
						<p>Телефон: '.$_POST['phone'].'</p> </br>
						<p>Файл с советами прикреплен к данному письму </br>
						
						<p>UTM фраза: '.$_POST['utm11'].'</p>
						<p>UTM компания: '.$_POST['utm12'].'</p>
						<p>UTM источник: '.$_POST['utm13'].'</p>
						
						';	
						
						
	
		
		$filename = "pdftosend.pdf";	
		$filepath = "pdftosend.pdf";	


		$boundary = "--".md5(uniqid(time())); 
		// генерируем разделитель

		$mailheaders = "MIME-Version: 1.0;\r\n"; 
		$mailheaders .="Content-Type: multipart/mixed; boundary=\"$boundary\"\r\n"; 
		// разделитель указывается в заголовке в параметре boundary 

		$mailheaders .= "From: $user_email <$user_email>\r\n"; 
		$mailheaders .= "Reply-To: $user_email\r\n"; 

		$multipart = "--$boundary\r\n"; 
		$multipart .= "Content-Type: text/html; charset=utf-8\r\n";
		$multipart .= "Content-Transfer-Encoding: base64\r\n";    
		$multipart .= "\r\n";
		$multipart .= chunk_split(base64_encode($message));
		// первая часть само сообщение
		 
		// Закачиваем файл 
			$fp = fopen($filepath,"r"); 
				if (!$fp) 
				{ 
					print "Никак не удается открыть файл !!!"; 
					exit(); 
				} 
		$file = fread($fp, filesize($filepath)); 
		fclose($fp); 
		// чтение файла

		$message_part = "\r\n--$boundary\r\n"; 
		$message_part .= "Content-Type: application/octet-stream; name=\"$filename\"\r\n";  
		$message_part .= "Content-Transfer-Encoding: base64\r\n"; 
		$message_part .= "Content-Disposition: attachment; filename=\"$filename\"\r\n"; 
		$message_part .= "\r\n";
		$message_part .= chunk_split(base64_encode($file));
		$message_part .= "\r\n--$boundary--\r\n";
		// второй частью прикрепляем файл, можно прикрепить два и более файла

		$multipart .= $message_part;

		mail($to,$subject,$multipart,$mailheaders);
		// отправляем письмо 
	
	}else{
		// если есть ошибки то отправляем
		echo json_encode(array('result' => 'error', 'text_error' => $error));
	}
	
	
/*
	 


*/
