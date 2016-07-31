class ProductsController < ApplicationController
	before_action :set_product, except: []
	
	def index
		if current_user.owner?
			@companies = current_user.companies.order(:created_at)
		end
	end

	def get_price
		render json: @product.sale_price
	end

	private

	def set_product
		@product = Product.find(params[:id])
	end

end
