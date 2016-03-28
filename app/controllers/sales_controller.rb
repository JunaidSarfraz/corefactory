class SalesController < ApplicationController
	def index
	end

	def new
		@sale = Transection.new
	end

	def create
	end
end
