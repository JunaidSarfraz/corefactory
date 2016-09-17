//= require app
$(document).ready(function(){

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
	$('body').on('change ready', '.account_holder_type_dropdown', function(){
		var selected_value = $('.account_holder_type_dropdown').val();
		//Now we have to load account user on basis of selected account holder type and 
		// These users to account user drop down in account form.
		request_data = {
			selected_value: selected_value
		};
		$('.assosiated_company_dropdown option:first-child').attr("selected", "selected");
		$('.assosiated_company_tr').hide();	
		send_ajax_request("post", 
			"/accounts/extract_users_by_account_holer_type",
			"json",
			request_data,
			function(data){
				if (selected_value === "company"){
					$('.assosiated_user_dropdown').children().remove();
					$('.assosiated_user_tr').hide();
					$.each(data, function(index, obj){
						console.log(obj)
						$('.assosiated_company_dropdown').append("<option value= '"+obj.id+"'>"+ obj.name + "</option>");	
					});
					$('.assosiated_company_tr').show();
				}
				else{
					// data contains users put these users to assosiated user dropdown
					$('.assosiated_user_dropdown').children().remove();
					$('.assosiated_company_dropdown').children().remove();
					$('.assosiated_company_tr').hide();

					// $('.assosiated_user_dropdown').append("<option value=0></option>");
					$.each(data, function(index, obj){
						$('.assosiated_user_dropdown').append("<option value= '"+obj.id+"'>"+obj.first_name+"</option>");	
					});
					$('.assosiated_user_tr').show();
				}
			},
			function(jqXHR, exception){
				console.log(exception);
			}
		);
	});


	//auto complete in company accounts tab for search bar
	// if ($('.search_bar_comapny_accounts').length > 0){
	// 	send_ajax_request("post",
	// 		"/accounts/account_names",
	// 		"json",
	// 		{
	// 			identity: "company"
	// 		},
	// 		function(data){
	// 			$( ".search_bar_comapny_accounts" ).autocomplete({
	// 				source: data,
	// 					messages: {
	// 			        		noResults: '',
	// 			        		results: function() {}
	// 					}
	// 				});
	// 		},
	// 		function(jqXHR, exception){
	// 			console.log(exception);
	// 		}
	// 	);
	// }

	// //auto complete in employee accounts tab for search bar
	// if ($('.search_bar_employee_accounts').length > 0){
	// 	send_ajax_request("post",
	// 		"/accounts/account_names",
	// 		"json",
	// 		{
	// 			identity: "employee"
	// 		},
	// 		function(data){
	// 			$( ".search_bar_employee_accounts" ).autocomplete({
	// 				source: data,
	// 				messages: {
	// 		        		noResults: '',
	// 		        		results: function() {}
	// 				}
	// 			});
	// 		},
	// 		function(jqXHR, exception){
	// 			console.log(exception);
	// 		}
	// 	);
	// }

	// //auto complete in client accounts tab for search bar
	// if ($('.search_bar_client_accounts').length > 0){
	// 	send_ajax_request("post",
	// 		"/accounts/account_names",
	// 		"json",
	// 		{
	// 			identity: "client"
	// 		},
	// 		function(data){
	// 			$( ".search_bar_client_accounts" ).autocomplete({
	// 				source: data,
	// 				messages: {
	// 		        		noResults: '',
	// 		        		results: function() {}
	// 				}
	// 			});
	// 		},
	// 		function(jqXHR, exception){
	// 			console.log(exception);
	// 		}
	// 	);
	// }

	// //auto complete in supplier accounts tab for search bar
	// if ($('.search_bar_supplier_accounts').length > 0){
	// 	send_ajax_request("post",
	// 		"/accounts/account_names",
	// 		"json",
	// 		{
	// 			identity: "supplier"
	// 		},
	// 		function(data){
	// 			$( ".search_bar_supplier_accounts" ).autocomplete({
	// 				source: data,
	// 				messages: {
	// 		        		noResults: '',
	// 		        		results: function() {}
	// 				}
	// 			});
	// 		},
	// 		function(jqXHR, exception){
	// 			console.log(exception);
	// 		}
	// 	);
	// }


	$('body').on('click','.account_search_button',function(e){
		e.preventDefault();
		if ($(this).parent().parent().find('.search_bar_comapny_accounts').length > 0){
			var search_query = $(this).parent().parent().find('.search_bar_comapny_accounts').val();
			alert(search_query);
		} else if ($(this).parent().parent().find('.search_bar_employee_accounts').length > 0){
			var search_query = $(this).parent().parent().find('.search_bar_employee_accounts').val();
			alert(search_query);
		} else if ($(this).parent().parent().find('.search_bar_client_accounts').length > 0){
			var search_query = $(this).parent().parent().find('.search_bar_client_accounts').val();
			alert(search_query);
		} else if ($(this).parent().parent().find('.search_bar_supplier_accounts').length > 0){
			var search_query = $(this).parent().parent().find('.search_bar_supplier_accounts').val();
			alert(search_query);
		}
	});

}); // end of document.ready