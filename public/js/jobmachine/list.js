jQuery(document).ready(function(){
	$(".submit").change(function(){
		var $form = $(this).closest("form");
		$(this).closest("form").submit();
	});
	$(".json").each(function () {
		var parm = $(this);
		var json = eval('(' + parm.html() + ')');
		var p = JSON.stringify(json, null, 4);
		$(this).html(p);
	});
});
