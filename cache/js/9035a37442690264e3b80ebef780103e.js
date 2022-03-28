$(document).on('mouseover',".js_ab, .ab",function(){$(this).find(".ab_actions a").show();});$(document).on('mouseout',".js_ab, .ab",function(){$(this).find(".js_ab_action, .ab_actions a").hide();});$(document).on('click','.js_ab_action, .ab_actions a',function(){if($(this).attr("confirm"))
{if(!confirm($(this).attr("confirm")))
{return false;}}});