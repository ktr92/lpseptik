/**
 * JS-сценарий модуля
 * 
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2017 OOO «Диафан» (http://www.diafan.ru/)
 */

$('body').keypress(function(event) {
	if((event.ctrlKey) && ((event.keyCode == 0xA)||(event.keyCode == 0xD)))
	{
		$('.js_mistakes_form input[name=selected_text], .mistakes_form input[name=selected_text]').val(getSelection());
		$.prettyPhoto.open("#mistakes_comment");
	}
});

diafan_ajax.before['mistakes_add'] = function(form){$('input[name=url]', form).val(window.location.href);}
diafan_ajax.success['mistakes_add'] = function(form, response){$.prettyPhoto.close();}

function getSelection() {
	return (!!document.getSelection) ? document.getSelection() :
		   (!!window.getSelection)   ? window.getSelection() :
		   document.selection.createRange().text;
}