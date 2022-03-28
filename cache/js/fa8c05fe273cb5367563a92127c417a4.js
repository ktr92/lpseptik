$(document).on('click',".js_photo_link_ajax, .previous_link a, .next_link a",function(){var url=$(this).attr("href");$.ajax({url:url,data:{module_ajax:'photo'},type:'POST',dataType:'json',success:(function(response)
{if(response.text)
{$(".js_photo_id, .photo_id").html(prepare(response.text));}
if(response.h1)
{$("h1").html(prepare(response.h1));}})});return false;});