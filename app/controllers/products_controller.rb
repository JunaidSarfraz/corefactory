class ProductsController < ApplicationController
	def index
		if current_user.owner?
			@companies = current_user.companies.order(:created_at)
		end
	end
end
