$(document).ready(function () { 
	$('.dropdown-toggle').dropdown(); 
	$('.datepicker').dcalendarpicker({
  		format: 'yyyy-mm-dd'
	});
	$('table').accordion({header: '.category' });

}); // end of document.ready
