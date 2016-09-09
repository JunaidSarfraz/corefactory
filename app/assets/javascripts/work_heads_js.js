//= require app
$(document).ready(function(){
	// $.getScript("/app/assets/javascripts/jquery-ui.js", function()
	// {
	// 	$('table').accordion({header: '.category' });
	// });

	$('.clear_modal_content').on('click', function(e){
		$('#work_head_name').val("");
		$('#work_head_description').val("");
		$('#work_head_items').val("");
		$('#work_head_pay').val("");
	});

	// Extract factories on the base of selected option using ajax in work head index page
	$(document).on('change', '#all_factories_dropdown_work_heads', function(){
		var factory_id = $('#all_factories_dropdown_work_heads').find(":selected").val();
		if(factory_id === ""){
			factory_id = 0;
		}
		// add elements to branches dropdown
		send_ajax_request("post",
			"/filtration/filtration_logic_of_factories",
			"json",
			{
				factory_id: factory_id,
				page_identity: "work_heads"
			},
			function(data){
				$('#all_branches_dropdown_work_heads').children().remove().end();
				$('#all_branches_dropdown_work_heads').append("<option selected value='' selected='selected'>All Branches</option>");
				if(data != false){					
					$.each(data, function(index,value){
						$('#all_branches_dropdown_work_heads').append("<option value='"+value.id+"'>"+value.name+"</option>");
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
				page_identity: "work_heads"
			},
			function(data){
				debugger;
				$('#all_work_heads').html("");
				$('#all_work_heads').html(data);
			},
			function(jqXHR, exception){
				console.log(exception);
			}); // end of ajax call

	});


	// Branch level filtration in work heads
	$(document).on('change', '#all_branches_dropdown_work_heads', function(){
		var branch_id = $('#all_branches_dropdown_work_heads').find(":selected").val();
		var factory_id = $('#all_factories_dropdown_work_heads').find(":selected").val();
		// In this state signal is don't care
		var signal = "";
		if(branch_id === "" && factory_id === ""){
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
				page_identity: "work_heads"
			},
			function(data){
				$('#all_work_heads').html("");
				$('#all_work_heads').html(data);
			},
			function(jqXHR, exception){
				console.log(exception);
			}); // end of ajax call
	});
})