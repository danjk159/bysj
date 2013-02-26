// JavaScript Document
$(document).ready(function() {
	$("#FirstMenu > li > a").click(function() {
		$("#FirstMenu > li > a").removeClass('expanded').addClass('collapsed');
		$(".navigation").slideUp();
		$(this).removeClass('collapsed').addClass('expanded').parent().find('> ul').slideDown();
	});
	$(".navigation > li > a").click(function() {
		$(".navigation > li > a").css("color","#3A3F5C");								 
		$(this).css("color","#7C022B");
	});
	$("#MainRtLeft").click(function() {		
		$("#MainLt").toggle();
		if($("#MainRtCon").css("width")=="765px"){$("#MainRtCon").css("width","988px");}
		else {$("#MainRtCon").css("width","765px");}
		if($("#MainContent").css("width")=="765px"){$("#MainContent").css("width","988px");}
		else {$("#MainContent").css("width","765px");}
		
	});
	
});