$(document).ready(function(){

	$(document).on('click', '.client_enable_disable_button', function(){
		var client_id = $(this).parent().parent().find('.client_id').val();
		var button_text = $(this).text();
		var element = this;
		send_ajax_request("post",
			"/suppliers/"+client_id+"/change_status",
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
	$(document).on('click','.delete_client',function(){
		e.stopPropagation();
	});
	$.each($('.company_id_dropdown_on_new_client'), function(index, obj){
		obj.value = obj.getAttribute('company_id');
	});

	$(document).on('change','.company_id_dropdown_on_new_client',function(e){
		($(this).parent().find($('.company_id_hidden_field'))).val( $(this).val() );
	});
}); // end of document.ready