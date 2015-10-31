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

}); // end of document.ready
