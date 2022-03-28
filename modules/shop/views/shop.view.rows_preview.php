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

		foreach ($result['rows'] as $row)
		{		
			//вывод изображений товара
			if (!empty($row["img"]))
			{
				
				?>
				<img src="<?=$row['img'][0]['vs']['medium']?>" alt="">									
				<?
			}
			?>
			<p><?=$row['name']; ?></p>
			<?

            if(empty($result['search'])) {
				echo $this->get('buy_form_preview', 'shop', array("row" => $row, "result" => $result));
			}
		}			
		

