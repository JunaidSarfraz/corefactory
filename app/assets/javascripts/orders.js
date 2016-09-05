$(document).ready(function(){
	$(document).on('nested:fieldAdded:order_items', function(){
		$('body').on('change', ".order-item-product-selector", function(){
			$this = $(this);
			var product_id = $(this).val();
			send_ajax_request("post", 
				"/products/" + product_id + "/get_price",
				"json",
				"",
				function(data){
					// data contains users put these users to assosiated user dropdown
					$this.closest('tr').find('.product-cost').val(data);
					update_total_cost($this.closest('tr').find('.product-total'), $this.closest('tr').find('.product-cost'), $this.closest('tr').find('.product-quantity'), $this.closest('tr').find('.product-discount'));
					update_grand_total($('.order-grand-total'), $(".product-total:visible").map(function() { return this.value; }));
				},
				function(jqXHR, exception){
					console.log(exception);
				}
			);
		})

		$(document).on('nested:fieldRemoved:order_items', function(){
			update_grand_total($('.order-grand-total'), $(".product-total:visible").map(function() { return this.value; }));
		})

		$('body').on('change', '.product-quantity', function(){
			update_total_cost($this.closest('tr').find('.product-total'), $this.closest('tr').find('.product-cost').val(), $this.closest('tr').find('.product-quantity').val(), $this.closest('tr').find('.product-discount').val());
			update_grand_total($('.order-grand-total'), $(".product-total:visible").map(function() { return this.value; }));
		})
	})
})