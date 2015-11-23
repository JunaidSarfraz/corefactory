//= require app
$(document).ready(function () {
	
	// Extract factories on the base of selected option using ajax in workers index page
	$(document).on('change', '#all_factories_dropdown_workers', function(){
		var factory_id = $('#all_factories_dropdown_workers').find(":selected").val();
		var page_identity = "workers"
		if(factory_id === ""){
			factory_id = 0;
		}
		// add elements to branches dropdown
		send_ajax_request("post",
			"/filtration/filtration_logic_of_factories",
			"json",
			{
				factory_id: factory_id,
				page_identity: "workers"
			},
			function(data){
				$('#all_branches_dropdown_workers').children().remove().end();
				$('#all_branches_dropdown_workers').append("<option selected value='' selected='selected'>All Branches</option>");
				if(data != false){					
					$.each(data, function(index,value){
						$('#all_branches_dropdown_workers').append("<option value='"+value.id+"'>"+value.name+"</option>");
					});
				}
			},
			function(jqXHR, exception){
				console.log(exception);
			}); // end of ajax call

		// Update page content
		send_ajax_request("post",
			"/filtration/filtration_logic_of_factories",
			"html",
			{
				factory_id: factory_id,
				page_identity: "workers"
			},
			function(data){
				$('#all_workers_table').html("");
				$('#all_workers_table').html(data);
			},
			function(jqXHR, exception){
				console.log(exception);
			}
		); // end of ajax call
		$('#workers_managers_dropdown_workers').val('');
	});





	$(document).on('change', '#workers_managers_dropdown_workers', function(){
		var selection = $('#workers_managers_dropdown_workers').find(":selected").val();
		var factory = $('#all_factories_dropdown_workers').find(":selected").val();
		var branch = $('#all_branches_dropdown_workers').find(":selected").val();
		if(selection == ''){
			selection = "all";
		}
		if(factory == ''){
			factory = "all";
		}
		if(branch == ''){
			branch = "all";
		}
		send_ajax_request("post",
			"/filtration/worker_or_manager",
			"html",
			{
				factory_id: factory,
				branch_id: branch,
				selection: selection
			},
			function(data){
				$('#all_workers_table').html("");
				$('#all_workers_table').html(data);
			},
			function(jqXHR, exception){
				console.log(exception);
			}
		); // end of ajax call

	});




	// Branch level filtration in workers
	$(document).on('change', '#all_branches_dropdown_workers', function(){
		debugger;
		var branch_id = $('#all_branches_dropdown_workers').find(":selected").val();
		var factory_id = $('#all_factories_dropdown_workers').find(":selected").val();
		// In this state signal is don't care
		var signal = "";
		if(branch_id == "" && factory_id == ""){
			branch_id = nil;
			signal = "All";
		}
		else if(branch_id == "" && factory_id != ""){
			branch_id = 0;
			signal = "";
		}
		else if(branch_id != ""){
			signal = "consider"
		}
		// Update page content
		send_ajax_request("post",
			"/filtration/filtration_logic_of_branches",
			"html",
			{
				branch_id: branch_id,
				signal: signal,
				factory_id: factory_id,
				page_identity: "workers"
			},
			function(data){
				$('#all_workers_table').html("");
				$('#all_workers_table').html(data);
			},
			function(jqXHR, exception){
				console.log(exception);
			}
		); // end of ajax call
		$('#workers_managers_dropdown_workers').val('');
	});



	$(document).on('click', '.worker_enable_disable_button', function(){
		var worker_id = $(this).parent().parent().find('.worker_id').val();
		var button_text = $(this).text();
		var element = this;
		send_ajax_request("post",
			"/workers/"+worker_id+"/change_status",
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
	});


	$(document).on('change','#factories_on_worker_form_table', function(){
		var selected_company_id = $('#factories_on_worker_form_table').val();
		// add elements to branches dropdown
		send_ajax_request("post",
			"/companies/"+selected_company_id+"/get_all_branches",
			"json",
			{ },
			function(data){
				$('#all_branches_on_worker_form_table').children().remove().end();
				if(data != false){					
					$.each(data, function(index,value){
						$('#all_branches_on_worker_form_table').append("<option value='"+value.id+"'>"+value.name+"</option>");
					});
				}
			},
			function(jqXHR, exception){
				console.log(exception);
			}
		); // end of ajax call
	});
});