jQuery(document).ready(function(){
	$(".submit").change(function(){
		var $form = $(this).closest("form");
		$(this).closest("form").submit();
	});
});
