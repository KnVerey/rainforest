$(document).ready(function() {
	$("#dropdown-anchor").on("mouseover", function(){
		if($("#dropdown").css("display")==="none") { $("#dropdown").slideDown(); }
	});
	$("#dropdown").on("mouseleave", function(){
		$("#dropdown").slideUp();
	});
});

