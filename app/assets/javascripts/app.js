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

	// Extract factories on the base of selected option using ajax
	$(document).on('change', '#all_factories_dropdown_work_heads', function(e){
		var factory_id = $('#all_factories_dropdown_work_heads').find(":selected").val();
		if(factory_id == ""){
			factory_id = 0;
		}
		// add elements to branches dropdown
		$.ajax({
			type: "post",
			url: "/factories/get_all_branches",
			dataType: "json",
			data: {
				factory_id: factory_id
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
			url: "/factories/get_all_branches",
			dataType: "html",
			data: {
				factory_id: factory_id
			},
			success: function(data){
				$('#all_work_heads').html("");
				$('#all_work_heads').html(data);
			}
		}); // end of ajax call

	});

	$(document).on('change', '#workers_or_manager_work_heads', function(e){
		alert($('#workers_or_manager_work_heads').find(":selected").val());
	});

	$(document).on('change', '#all_branches_dropdown_work_heads', function(e){
		alert($('#all_branches_dropdown_work_heads').find(":selected").val());
	});
	
}); // end of document.ready
