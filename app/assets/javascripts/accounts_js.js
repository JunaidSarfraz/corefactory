

function send_ajax_request(req_type, req_url, data_type, req_data, success_callback, error_callback){
	debugger;
	$.ajax({
		type: req_type,
		url: req_url,
		dataType: data_type,
		data: req_data,
		success: success_callback,
		error: error_callback
	});
}


$(document).ready(function(){
	$(document).on('change', '#account__type', function(){
		var selected = $('#account__type').val();
		if(selected === "bank_account"){
			$('.bank_info_fields').removeClass('hide');
		}
		else{
			$('.bank_info_fields').addClass('hide');
		}
	});

	$('#myTabs a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
	})
	$('#myTabs a:first').tab('show') // Select first tab
	// $('#myTabs a[href="#profile"]').tab('show') // Select tab by name
	// $('#myTabs a:last').tab('show') // Select last tab
	// $('#myTabs li:eq(2) a').tab('show') // Select third tab (0-indexed)


	// Assosiated User Tr is hidden when page load because initially company is selected
	// in account holder type
	$('.assosiated_user_tr').hide();
	
	// This Function is called to change content of assosiated user drop down when account holder type 
	// changed
	$(document).on('change ready', '.account_holder_type_dropdown', function(){
		var selected_value = $('.account_holder_type_dropdown').val();
		//Now we have to load account user on basis of selected account holder type and 
		// These users to account user drop down in account form.
		request_data = {
			selected_value: selected_value
		};
		if (selected_value === "company"){
			$('.assosiated_user_dropdown option:first-child').attr("selected", "selected");
			$('.assosiated_user_tr').hide();
			$('.assosiated_company_tr').show();
		}
		else{
			$('.assosiated_company_dropdown option:first-child').attr("selected", "selected");
			$('.assosiated_company_tr').hide();	
			send_ajax_request("post", 
								"/accounts/extract_users_by_account_holer_type",
								"json",
								request_data,
								function(data){
									// data contains users put these users to assosiated user dropdown
									$('.assosiated_user_dropdown').children().remove();
									$('.assosiated_user_dropdown').append("<option value=0></option>");
									$.each(data, function(index, obj){
										$('.assosiated_user_dropdown').append("<option value= '"+obj.id+"'>"+obj.first_name+"</option>");	
									});
									$('.assosiated_user_tr').show();
								},
								function(jqXHR, exception){
									console.log(exception);
								});
		}
	});
	
	$(document).on('click','.delete_account',function(e){
		e.preventDefault();
		var account_id = $(this).attr('account-id');
		var tab_identity = $(this).attr('tab-identity');
		send_ajax_request("DELETE",
							"/accounts/" + account_id,
							"html",
							{},
							function(data){
								if (tab_identity === "company"){
									$('#company_accounts').html(data);
								} else if (tab_identity === "employee"){
									$('#employee_accounts').html(data);
								} else if (tab_identity === "supplier"){
									$('#supplier_accounts').html(data);
								} else if (tab_identity === "client"){
									$('#client_accounts').html(data);
								}
							},
							function(jqXHR, exception){
								console.log(exception);
							});
	});

	

}); // end of document.ready