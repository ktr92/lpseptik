function sendForm(t){var th=t;var data=new FormData(t);var metrikaTarget=$(th).attr('data-metrika-target');$.ajax({type:"POST",url:'/send/send.php',contentType:!1,processData:!1,data:data,dataType:'json',success:function(data){console.log(data);if(data.result=='success'){$('input').removeClass('error_input');$('.modal').on('show.bs.modal',function(){$('.modal').not($(this)).each(function(){$(this).modal('hide')})});$('#myModal_spasibo').modal('show');$('input[name=name]').val("");$('input[name=phone]').val("");yaCounter45556083.reachGoal(metrikaTarget,function(){console.log('Цель '+metrikaTarget+' отправлена')})}else{var i=0;$('input').removeClass('error_input');for(var errorField in data.text_error){$('input[name="'+errorField+'"]').addClass('error_input');if(i==0){}i++}}},error:function(error){console.log(error)},beforeSend:function(){console.log('loading...');$('.modal').prepend('<div class="loader">dd</div>')},complete:function(){$('.loader').remove()}})};function sendProduct(t){var th=t;var data=new FormData(t);var metrikaTarget=$(th).attr('data-metrika-target');$.ajax({type:"POST",url:'/send/send_product.php',contentType:!1,processData:!1,data:data,dataType:'json',success:function(data){console.log(data);if(data.result=='success'){$('input').removeClass('error_input');$('.modal').on('show.bs.modal',function(){$('.modal').not($(this)).each(function(){$(this).modal('hide')})});$('#myModal_spasibo').modal('show');yaCounter45556083.reachGoal(metrikaTarget,function(){console.log('Цель '+metrikaTarget+' отправлена')})}else{var i=0;$('input').removeClass('error_input');for(var errorField in data.text_error){$('input[name="'+errorField+'"]').addClass('error_input');if(i==0){}i++}}},error:function(error){console.log(error)},beforeSend:function(){console.log('loading...');$('.modal').prepend('<div class="loader">dd</div>')},complete:function(){$('.loader').remove()}})};function sendFile(t){var th=t;var data=new FormData(t);var metrikaTarget=$(th).attr('data-metrika-target');$.ajax({type:"POST",url:'/send/sendfilepdf.php',contentType:!1,processData:!1,data:data,dataType:'json',success:function(data){console.log(data);if(data.result=='success'){$('input').removeClass('error_input');$('.modal').on('show.bs.modal',function(){$('.modal').not($(this)).each(function(){$(this).modal('hide')})});$('#myModal_file_finish').modal('show');yaCounter45556083.reachGoal(metrikaTarget,function(){console.log('Цель '+metrikaTarget+' отправлена')})}else{var i=0;$('input').removeClass('error_input');for(var errorField in data.text_error){$('input[name="'+errorField+'"]').addClass('error_input');if(i==0){}i++}}},error:function(error){console.log(error)},beforeSend:function(){console.log('loading...');$('.modal').prepend('<div class="loader">dd</div>')},complete:function(){$('.loader').remove()}})};function sendTest(t){var th=t;var data=new FormData(t);var metrikaTarget=$(th).attr('data-metrika-target');$.ajax({type:"POST",url:'/send/send_test.php',contentType:!1,processData:!1,data:data,dataType:'json',success:function(data){console.log(data);if(data.result=='success'){$('input').removeClass('error_input');$('.modal').on('show.bs.modal',function(){$('.modal').not($(this)).each(function(){$(this).modal('hide')})});$('#myModal_spasibo_test').modal('show');$('input[name=name]').val("");$('input[name=phone]').val("");yaCounter45939039.reachGoal(metrikaTarget,function(){console.log('Цель '+metrikaTarget+' отправлена')})}else{var i=0;$('input').removeClass('error_input');for(var errorField in data.text_error){$('input[name="'+errorField+'"]').addClass('error_input');if(i==0){}i++}}},error:function(error){console.log(error)},beforeSend:function(){console.log('loading...');$('.modal').prepend('<div class="loader">dd</div>')},complete:function(){$('.loader').remove()}})};/*$(document).ready(function(){$('.sertificates-top').slick({infinite:!0,slidesToShow:2,slidesToScroll:1,arrows:!0,nextArrow:'.sert-right',prevArrow:'.sert-left',responsive:[{breakpoint:700,settings:{slidesToShow:1,slidesToScroll:1,}}]})});$(document).ready(function(){$('.sertificates-bottom').slick({infinite:!0,slidesToShow:2,slidesToScroll:1,arrows:!0,nextArrow:'.sert-right-2',prevArrow:'.sert-left-2',responsive:[{breakpoint:700,settings:{slidesToShow:1,slidesToScroll:1,}}]})});*/$(document).ready(function(){$('.reviews').slick({infinite:!0,slidesToShow:1,slidesToScroll:1,arrows:!0,dots:!0,nextArrow:'.otz-right',prevArrow:'.otz-left'})});$(function(){$('ul.tabs__caption').on('click','li:not(.active)',function(){$(this).addClass('active').siblings().removeClass('active').closest('div.tabs').find('div.tabs__content').removeClass('active').eq($(this).index()).addClass('active')})});$(function(){$('ul.tabs__caption_product').on('click','li:not(.active_product)',function(){$(this).addClass('active_product').siblings().removeClass('active_product').closest('div.tabs_product').find('div.tabs__content_product').removeClass('active_product').eq($(this).index()).addClass('active_product')})});$(document).ready(function(){lightbox.option({'resizeDuration':0,'wrapAround':!0})});$('#accordion h3').click(function(){$(this).next().toggle();return!1}).next().hide();$(function(){$('ul.tabs__caption li:first').addClass('active').closest('div.tabs').find('div.tabs__content:first').addClass('active')});$(document).ready(function(){$('ul.tabs__caption_product').find('li:first').addClass('active_product');$('div.tabs_product').find('div.tabs__content_product:first').addClass('active_product')});jQuery(function($){$("input[name=phone]").mask("+7(999) 999-99-99")});$(document).ready(function(){$('.persons input').on('change',function(){$('.persons label').removeClass('check');$('.persons label input:checked').parent().addClass('check')})});$(document).ready(function(){$('input[type="text"]').removeClass('error_input');var count=1;$("#step1 .btn-test").on('click',function(){$("#step1").css("display","none");$("#step2").css("display","block");count=count+1;console.log(count)});$("#step6 .btn-test").on('click',function(){$("#step6").css("display","none");$("#step7").css("display","block");count=count+1;console.log(count)});$("#step2 label").on('click',function(){$("#step2").css("display","none");$("#step3").css("display","block");count=count+1;console.log(count)});$("#step3 label").on('click',function(){$("#step3").css("display","none");$("#step4").css("display","block");count=count+1;console.log(count)});$("#step4 label").on('click',function(){$("#step4").css("display","none");$("#step5").css("display","block");count=count+1;console.log(count)});$("#step5 label").on('click',function(){$("#step5").css("display","none");$("#step6").css("display","block");count=count+1;console.log(count)});$("#step7 label").on('click',function(){$("#step7").css("display","none");$("#step8").css("display","block");count=count+1;console.log(count)});$("#step8 label").on('click',function(){$("#step8").css("display","none");$("#step9").css("display","block");count=count+1;console.log(count)});$("#step9 label").on('click',function(){$("#step9").css("display","none");$("#step10").css("display","block");count=count+1;console.log(count)});$("#step10 label").on('click',function(){$("#step10").css("display","none");$("#step11").css("display","block");count=count+1;console.log(count)});$("#step11 label").on('click',function(){$("#step11").css("display","none");$("#step12").css("display","block");count=count+1;console.log(count)});$("#step12 label").on('click',function(){$("#step12").css("display","none");$("#step13").css("display","block");count=count+1;console.log(count)});$("#step13 label").on('click',function(){$("#step13").css("display","block");count=count+1;console.log(count)});$(".btn-cancel").on('click',function(){if(count<13){$("#step"+count).css("display","none");$("#step"+(count-1)).css("display","block")}else{$("#step9").css("display","block")}count=count-1})});

$( document ).ready(function() {
    
  
	
		var pageurl = document.location.href;
		var currentTime = new Date().getTime();
			
		if (pageurl.indexOf('?utm_source=yandex') + 1) {
			localStorage.setItem("from_context", "yandex");			
			localStorage.setItem("context_time", currentTime); 
		}
		if (pageurl.indexOf('utm_source=google') + 1) {
			localStorage.setItem("from_context", "google");
			localStorage.setItem("context_time", currentTime); 
		}
		
		
		if(pageurl.indexOf('utm_source') + 1) {
			var terms = decodeURI(pageurl.substring(pageurl.indexOf('utm_source')+11, pageurl.length)); 
			var tmp = terms;
			if (tmp.substring(0, terms.indexOf('&')) != "") {
			    terms = tmp;
			}
			terms = terms.substring(0, terms.indexOf('&')); 
			localStorage.setItem("utm_source", terms);	
		}
		
	
		if(pageurl.indexOf('keyword') + 1) {
			var terms = decodeURI(pageurl.substring(pageurl.indexOf('keyword')+8, pageurl.length)); 
			var tmp = terms;
			if (tmp.substring(0, terms.indexOf('&')) != "") {
			    terms = tmp;
			}
			terms = terms.substring(0, terms.indexOf('&')); 
			localStorage.setItem("keyword", terms);			
		}
		
		if(pageurl.indexOf('utm_campaign') + 1) {
			var terms = decodeURI(pageurl.substring(pageurl.indexOf('utm_campaign')+13, pageurl.length)); 
			var tmp = terms;
			if (tmp.substring(0, terms.indexOf('&')) != "") {
			    terms = tmp;
			}
		
			localStorage.setItem("utm_campaign", terms);			
		}
	
		
		
	
		
		
		if (!((pageurl.indexOf('?utm_source=yandex') + 1) || (pageurl.indexOf('utm_source=google') + 1))) {
			if ((localStorage.getItem("context_time")-currentTime) < -1296000000) {
				localStorage.removeItem('from_context');
				localStorage.removeItem('context_time');
				localStorage.removeItem('utm_source');
				localStorage.removeItem('keyword');
				localStorage.removeItem('utm_campaign');
				
			}
			
		}
		
		  if (localStorage.getItem('keyword')) {
                $('input[placeholder="UTM фраза"]').val(localStorage.getItem('keyword'));
            }
            
        if (localStorage.getItem('utm_campaign')) {
                $('input[placeholder="UTM компания"]').val(localStorage.getItem('utm_campaign'));
            }
            
            
        if (localStorage.getItem('utm_source')) {
                $('input[placeholder="UTM источник"]').val(localStorage.getItem('utm_source'));
            }
            
            
		
		
		
		
		
	});