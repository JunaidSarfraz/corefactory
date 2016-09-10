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

	$(document).on('click', '.show_records tr[data-link]', function(){
		debugger;
		window.location = $(this).data("link");
	});

	$('.date-picker').datepicker();

	// This is for shared/nested_account_form and it's structure specific
	$('body').on('change', '.account-type-selector', function(){
		var selected = $(this).val();
		if(selected === "bank_account"){
			$(this).closest('.account-fields').find('.bank_info_fields').removeClass('hide');
		}
		else{
			$(this).closest('.account-fields').find('.bank_info_fields').addClass('hide');
		}
	});
	$(document).on('nested:fieldAdded:branches', function(event){
	  // this field was just inserted into your form
	  var field = event.field;
	  set_number_of_records(field, $("#branches_records"), "Branch # ");
	})
	
	$(document).on('nested:fieldRemoved:branches', function(event){
	  // this field was just inserted into your form
	  var field = event.field;
	  remove_number_of_records(field, $("#branches_records"), "Branch # ");
	})
	
	$(document).on('nested:fieldAdded:products', function(event){
	  // this field was just inserted into your form
	  var field = event.field;
	  set_number_of_records(field, $("#products"), "Product # ");
	})

	$(document).on('nested:fieldRemoved:products', function(event){
	  // this field was just inserted into your form
	  var field = event.field;
	  remove_number_of_records(field, $("#products"), "Product # ");
	})

	$(document).on('nested:fieldAdded:accounts', function(event){
	  // this field was just inserted into your form
	  var field = event.field;
	  set_number_of_records(field, $("#accounts"), "Account # ");
	})

	$(document).on('nested:fieldRemoved:accounts', function(event){
	  // this field was just inserted into your form
	  var field = event.field;
	  remove_number_of_records(field, $("#accounts"), "Account # ");
	})

	// ------------------ Product profit and sale price calculations --------------
	$('body').on('change', '.product_sale_price', function(){
		var cost = parseInt($(this).closest('.product-fields').find('.product_cost').val());
		var sale_price = parseInt($(this).val());
		var profit = sale_price - cost;
		var profit_percentage = ((profit/cost) * 100).toFixed(2);
		$(this).closest('.product-fields').find('.product_profit').val(profit);
		$(this).closest('.product-fields').find('.product_profit_percentage').val(profit_percentage);
	})

	$('body').on('change', '.product_profit', function(){
		var cost = parseInt($(this).closest('.product-fields').find('.product_cost').val());
		var profit = parseInt($(this).val());
		var sale_price = cost + profit;
		var profit_percentage = ((profit/cost) * 100).toFixed(2);
		$(this).closest('.product-fields').find('.product_sale_price').val(sale_price);
		$(this).closest('.product-fields').find('.product_profit_percentage').val(profit_percentage);
	})

	$('body').on('change', '.product_profit_percentage', function(){
		var cost = parseInt($(this).closest('.product-fields').find('.product_cost').val());
		var profit_percentage = parseFloat($(this).val());
		var profit = Math.ceil(((profit_percentage * cost)/100));
		var sale_price = cost + profit;
		$(this).closest('.product-fields').find('.product_sale_price').val(sale_price);
		$(this).closest('.product-fields').find('.product_profit').val(profit);
	})

	$('.no-event-bubble-up').each(function(){
		$(this).click(function(e){
			debugger;
			e.stopPropagation();
		});
	});
}); // end of document.ready

function set_number_of_records(field, field_element, text_initial){
	var number_element = field.find(".branch-number-heading");
	number_element.text(text_initial + field_element.find(".nested_fields_div:visible").length);
}
function remove_number_of_records(field, field_element, text_initial){
	var number_removed = parseInt(field.find(".branch-number-heading").text().split("#")[1]);
  $.each( field_element.find(".nested_fields_div:visible"), function(index, value){
  	var found_value = parseInt($(value).find(".branch-number-heading").text().split("#")[1]);
  	if(found_value > number_removed){
  		$(value).find(".branch-number-heading").text(text_initial + (found_value - 1));
  	}
  });
}

warning_alert = function(msg, auto_hide) {
  var closeButton_opt, closeOnClick_opt, sticky_opt;
  if (auto_hide == null) {
    auto_hide = true;
  }
  sticky_opt = closeButton_opt = false;
  closeOnClick_opt = true;
  if (auto_hide === false) {
    sticky_opt = true;
    closeOnClick_opt = false;
    closeButton_opt = true;
  }
  return $.amaran({
    content: {
      bgcolor: '#D04B2B',
      color: '#fff',
      message: msg
    },
    theme: 'colorful',
    position: 'top right',
    cssanimationIn: 'swing',
    inEffect: 'slideRight',
    cssanimationOut: 'bounceOut',
    sticky: sticky_opt,
    closeOnClick: closeOnClick_opt,
    closeButton: true,
    delay: 5000
  });
};

success_alert = function(msg, auto_hide) {
  var closeButton_opt, closeOnClick_opt, sticky_opt;
  if (auto_hide == null) {
    auto_hide = true;
  }
  sticky_opt = closeButton_opt = false;
  closeOnClick_opt = true;
  if (auto_hide === false) {
    sticky_opt = true;
    closeOnClick_opt = false;
    closeButton_opt = true;
  }
  return $.amaran({
    content: {
      bgcolor: '#73AA58',
      color: '#fff',
      message: msg
    },
    theme: 'colorful',
    position: 'top right',
    cssanimationIn: 'swing',
    inEffect: 'slideRight',
    cssanimationOut: 'bounceOut',
    sticky: sticky_opt,
    closeOnClick: closeOnClick_opt,
    closeButton: true,
    delay: 3000
  });
};

window.warning_alert = warning_alert;

window.success_alert = success_alert;