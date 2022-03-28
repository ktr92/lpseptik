/**
 * Редактирование дополнительных характеристик товаров, JS-сценарий
 * 
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2017 OOO «Диафан» (http://www.diafan.ru/)
 */

show_param_shop($("#type select"));
$("#type select").change(function(){
	show_param_shop($(this));
});
$('#attachments_access_admin').remove();

function show_param_shop(obj)
{
	obj.attr("req_self", true);
	if (obj.val() == "multiple")
	{
		$("#required").show();
	}
	else
	{
		$("#required").hide();
	}
	if (obj.val() == "select" || obj.val() == "multiple")
	{
		$("#page").show();
	}
	else
	{
		$("#page").hide();
	}
	if(obj.val() == 'textarea' || obj.val() == 'select' || obj.val() == 'multiple' || obj.val() == 'editor' || obj.val() == 'title')
	{
		$('#display_in_sort').hide();
	}
	else
	{
		$('#display_in_sort').show();
	}

	if(obj.val() == 'textarea' || obj.val() == 'text' || obj.val() == 'email' || obj.val() == 'attachments' || obj.val() == 'editor' || obj.val() == 'images')
	{
		$('#search').hide();
	}
	else
	{
		$('#search').show();
	}

	if(obj.val() == 'numtext')
	{
		$('#measure_unit').show();
	}
	else
	{
		$('#measure_unit').hide();
	}
}