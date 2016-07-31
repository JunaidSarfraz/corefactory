class OrdersController < ApplicationController

	def index
	end

	def new
		@product_list = Hash.new
		current_user.companies.each do |company|
			company.products.each do |product|
				@product_list[product.name] = product.id
			end
		end
		@order = Order.new
	end
end
