//= require app
$(document).ready(function () {

	$(document).on('click', '.supplier_enable_disable_button', function(){
		var worker_id = $(this).parent().parent().find('.supplier_id').val();
		var button_text = $(this).text();
		var element = this;
		send_ajax_request("post",
			"/suppliers/"+worker_id+"/change_status",
			"json",
			{ },
			function(data){	
				// Actual this is not accessable here so I use element instead of this
				if(button_text == "Enable"){
					$(element).text("Disable");
				}else if(button_text == "Disable"){
					$(element).text("Enable");
				}
			},
			function(jqXHR, exception){
				console.log(exception);
			}
		); // end of ajax call
		e.stopPropagation();
	});

	// show supplier


	$(document).on('click','.delete_supplier',function(e){
		e.stopPropagation();
	});
}); // end of document.ready