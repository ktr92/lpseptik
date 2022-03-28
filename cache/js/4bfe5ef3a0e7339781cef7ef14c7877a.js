$(document).on('click','.js_delete_attachment, .delete_attachment',function(){var del_id=$(this).attr("del_id");if(!confirm($(this).attr("title")))
return false;$.ajax({type:'POST',dataType:'json',data:{module:'forum',action:'delete_attachment',del_id:del_id,check_hash_user:$('input[name=check_hash_user]').val()},success:(function(response)
{$(response.target).hide();if(response.hash)
{$('input[name=check_hash_user]').val(response.hash);}})});return false;});$(document).on('click','.js_forum_message_show_form, .forum_message_show_form',function(){$(this).next('.js_forum_message_block_form, .forum_message_block_form').toggle();});$(document).on('mouseover',".js_forum_message, .js_forum_theme, .forum_message, .forum_theme",function(){$(this).find(".js_forum_actions, .forum_actions span").show();});$(document).on('mouseout',".js_forum_message, .js_forum_theme, .forum_message, .forum_theme",function(){$(this).find(".js_forum_actions, .forum_actions span").hide();});$(document).on('click','.js_forum_action, .forum_actions a',function(){if(!$(this).attr("action"))
{return true;}
if($(this).attr("title"))
{if(!confirm($(this).attr("title")))
{return false;}}
$(this).parents('form').find('input[name=action]').val($(this).attr("action"));$(this).parents('form').submit();});