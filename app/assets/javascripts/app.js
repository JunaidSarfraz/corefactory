$(document).ready(function () { 
	$('.dropdown-toggle').dropdown(); 
	$('.datepicker').dcalendarpicker({
  		format: 'yyyy-mm-dd'
	});
	$('table').accordion({header: '.category' });

	$('.clear_modal_content').on('click', function(e){
		$('#work_head_name').val("");
		$('#work_head_description').val("");
		$('#work_head_items').val("");
		$('#work_head_pay').val("");
	});





	// Extract factories on the base of selected option using ajax in work head index page
	$(document).on('change', '#all_factories_dropdown_work_heads', function(e){
		var factory_id = $('#all_factories_dropdown_work_heads').find(":selected").val();
		if(factory_id == ""){
			factory_id = 0;
		}
		// add elements to branches dropdown
		$.ajax({
			type: "post",
			url: "/filtration/filtration_logic_of_factories",
			dataType: "json",
			data: {
				factory_id: factory_id,
				page_identity: "work_heads"
			},
			success: function(data){
				$('#all_branches_dropdown_work_heads').children().remove().end();
				$('#all_branches_dropdown_work_heads').append("<option selected value='' selected='selected'>All Branches</option>");
				if(data != false){					
					$.each(data, function(index,value){
						$('#all_branches_dropdown_work_heads').append("<option value='"+value.id+"'>"+value.name+"</option>");
					});
				}
			}
		}); // end of ajax call

		// Update page content
		$.ajax({
			type: "post",
			url: "/filtration/filtration_logic_of_factories",
			dataType: "html",
			data: {
				factory_id: factory_id,
				page_identity: "work_heads"
			},
			success: function(data){
				$('#all_work_heads').html("");
				$('#all_work_heads').html(data);
			}
		}); // end of ajax call

	});


	// Extract factories on the base of selected option using ajax in workers index page
	$(document).on('change', '#all_factories_dropdown_workers', function(e){
		var factory_id = $('#all_factories_dropdown_workers').find(":selected").val();
		var page_identity = "workers"
		if(factory_id == ""){
			factory_id = 0;
		}
		// add elements to branches dropdown
		$.ajax({
			type: "post",
			url: "/filtration/filtration_logic_of_factories",
			dataType: "json",
			data: {
				factory_id: factory_id,
				page_identity: "workers"
			},
			success: function(data){
				$('#all_branches_dropdown_workers').children().remove().end();
				$('#all_branches_dropdown_workers').append("<option selected value='' selected='selected'>All Branches</option>");
				if(data != false){					
					$.each(data, function(index,value){
						$('#all_branches_dropdown_workers').append("<option value='"+value.id+"'>"+value.name+"</option>");
					});
				}
			}
		}); // end of ajax call

		// Update page content
		$.ajax({
			type: "post",
			url: "/filtration/filtration_logic_of_factories",
			dataType: "html",
			data: {
				factory_id: factory_id,
				page_identity: "workers"
			},
			success: function(data){
				$('#all_workers_table').html("");
				$('#all_workers_table').html(data);
			}
		}); // end of ajax call
		$('#workers_managers_dropdown_workers').val('');
	});





	$(document).on('change', '#workers_managers_dropdown_workers', function(e){
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
		$.ajax({
			type: "post",
			url: "/filtration/worker_or_manager",
			data: {
				factory_id: factory,
				branch_id: branch,
				selection: selection
			},
			success: function(data){
				$('#all_workers_table').html("");
				$('#all_workers_table').html(data);
			}
		}); // end of ajax call

	});



	// Branch level filtration in work heads
	$(document).on('change', '#all_branches_dropdown_work_heads', function(e){
		debugger;
		var branch_id = $('#all_branches_dropdown_work_heads').find(":selected").val();
		var factory_id = $('#all_factories_dropdown_work_heads').find(":selected").val();
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
		$.ajax({
			type: "post",
			url: "/filtration/filtration_logic_of_branches",
			data: {
				branch_id: branch_id,
				signal: signal,
				factory_id: factory_id,
				page_identity: "work_heads"
			},
			success: function(data){
				$('#all_work_heads').html("");
				$('#all_work_heads').html(data);
			}
		}); // end of ajax call
	});

	// Branch level filtration in workers
	$(document).on('change', '#all_branches_dropdown_workers', function(e){
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
		$.ajax({
			type: "post",
			url: "/filtration/filtration_logic_of_branches",
			data: {
				branch_id: branch_id,
				signal: signal,
				factory_id: factory_id,
				page_identity: "workers"
			},
			success: function(data){
				$('#all_workers_table').html("");
				$('#all_workers_table').html(data);
			}
		}); // end of ajax call
		$('#workers_managers_dropdown_workers').val('');
	});



	$(document).on('click', '.worker_enable_disable_button', function(e){
		var worker_id = $(this).parent().parent().find('.worker_id').val();
		var button_text = $(this).text();
		var element = this;
		$.ajax({
			type: "post",
			url: "/workers/"+worker_id+"/change_status",
			data: {
			},
			success: function(data){	
				// Actual this is not accessable here so I use element instead of this
				if(button_text == "Enable"){
					$(element).text("Disable");
				}else if(button_text == "Disable"){
					$(element).text("Enable");
				}
			}
		}); // end of ajax call
	});


}); // end of document.ready
