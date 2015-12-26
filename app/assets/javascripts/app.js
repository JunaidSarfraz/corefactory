function send_ajax_request(req_type, req_url, data_type, req_data, success_callback, error_callback){
	$.ajax({
		type: req_type,
		url: req_url,
		dataType: data_type,
		data: req_data,
		success: success_callback,
		error: error_callback
	});
}

$(document).ready(function () { 
	
	$('.dropdown-toggle').dropdown(); 
	$('.datepicker').dcalendarpicker({
  		format: 'yyyy-mm-dd'
	});

	$(document).on('click', '.show_records tr[data-link]', function(){
		window.location = $(this).data("link");
	});

	// This is for shared/nested_account_form and it's structure specific
	$('body').on('change', '.account-type-selector', function(){
		var selected = $(this).val();
		if(selected === "bank_account"){
			$(this).parent().parent().parent().find('.bank_info_fields').removeClass('hide');
		}
		else{
			$(this).parent().parent().parent().find('.bank_info_fields').addClass('hide');
		}
	});
	
}); // end of document.ready
