check_route_method();$(document).on('change',"select[name=route_method]",check_route_method);function check_route_method()
{if($("select[name=route_method]").val()==1)
{$('#route_translit_from,#route_translit_to').show();}
else
{$('#route_translit_from,#route_translit_to').hide();}
if($("select[name=route_method]").val()==2)
{$('#route_translate_yandex_key').show();}
else
{$('#route_translate_yandex_key').hide();}}