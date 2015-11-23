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
	
}); // end of document.ready
