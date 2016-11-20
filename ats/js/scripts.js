function onClickshowATSStat(command)
{
	$('#overlay').fadeIn(100, // сначала плавно показываем темную подложку
		 	function(){ // после выполнения предъидущей анимации
				$('#modal_form') 
					.css('display', 'block') // убираем у модального окна display: none;
					.animate({opacity: 1, top: '50%'}, 10);
	});
				
	if(command == null)
	{
		$.ajax({
			type: "POST",
			url:  "ComManager.php",
			data: "com=showATSStatDefault",
			success: function(result){	
				  $("#Body").empty();
				  $("#Body").append(result);
				  					
					$('#modal_form')
					.animate({opacity: 0, top: '45%'}, 200,  // плавно меняем прозрачность на 0 и одновременно двигаем окно вверх
						function(){ // после анимации
							$(this).css('display', 'none'); // делаем ему display: none;
							$('#overlay').fadeOut(400); // скрываем подложку
						}
					);
			}
		});
				
		return;
	}
	
	$.ajax({
		type: "POST",
		url:  "ComManager.php",
		data: "com=" + command +  "&ds=" + $("#ds").val() + 
		                          "&de=" + $("#de").val() + 
		                          "&ts=" + $("#ts").val() + 
		                          "&te=" + $("#te").val() + 
		                          "&durs=" + $("#durs").val() +
		                          "&dure=" + $("#dure").val() +
		                          "&dept=" + $("#dept").val() +
		                          "&limit=" + $("#limit").val() +
		                          "&offset=" + $("#offset").val()
			  	,
		success: function(result){	
			  $("#Body").empty();
			  $("#Body").append(result);
			  
			  $('#modal_form')
				.animate({opacity: 0, top: '45%'}, 200,  // плавно меняем прозрачность на 0 и одновременно двигаем окно вверх
					function(){ // после анимации
						$(this).css('display', 'none'); // делаем ему display: none;
						$('#overlay').fadeOut(400); // скрываем подложку
					}
				);			  
		}
	});
}

function onClicksubmitAuth()
{ 
	$.ajax({
		  type: "POST",
		  url: "ComManager.php",
		  data: "com=authorize" + "&login=" + $("#login").val() + "&pass=" + $("#pass").val(),
		  success: function(result){
				  	switch(result)
				  	{			  	    
					  	case "401": $('#authResult').empty();
					  	            $('#authResult').append("ACCESS DENIED"); 
					  	            break;
					  	            
					  	default: $('#Body').empty();
					  			 $('#Body').append(result);
				  	};		    
		  }
		});
}

function onClickExitSite()
{
	$.ajax({
		type: "POST",
		url:  "ComManager.php",
		data: "com=exitSite",
		success: function(result){
			  $("#Body").empty();
			  location.reload();			
		}
	});	
}

function authorizeRequest()
{
	$.ajax({
			type: "POST",
			url:  "ComManager.php",
			data: "com=authorizeRequest",
			success: function(result){
				  $("#Body").empty();
				  $("#Body").append(result);
			}
	});
}

function onClickChangeUser()
{
	$.ajax({
		type: "POST",
		url:  "ComManager.php",
		data: "com=ChangeUser",
		success: function(result){
			  $("#Body").empty();
			  $("#Body").append(result);
		}
	});		
}

$(document).ready(function(){
	authorizeRequest();
});


