jQuery(document).ready(function($){
	$('#gornjaNavigacija').prepend('<div id="menu-icon"></div>');
    $("#menu-icon").on("click", function(){
        $("#gornjaNav").slideToggle();
        $(this).toggleClass("active");
    });
	$(document).ready(function(){
	slideShow();
    });
});
function slideShow(){
		var current = $('#sliderS .slideShow');
		var next = current.next().length ? current.next() : current.parent() .children(':first');
		
		current.hide().removeClass('slideShow');
		next.fadeIn().addClass('slideShow');
		
		setTimeout(slideShow, 5000);
}