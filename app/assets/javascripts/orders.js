$(document).ready(function(){
	$(document).on('nested:fieldAdded:order_items', function(){
		$('body').on('change', ".order-item-product-selector", function(){
			debugger;
			$this = $(this);
			var product_id = $(this).val();
			send_ajax_request("post", 
				"/products/" + product_id + "/get_price",
				"json",
				"",
				function(data){
					// data contains users put these users to assosiated user dropdown
					debugger;
					$this.closest('tr').find('.product-cost').val(data);
				},
				function(jqXHR, exception){
					console.log(exception);
				}
			);
		})
	})
})