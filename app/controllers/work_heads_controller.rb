require 'shared_functions'
class WorkHeadsController < ApplicationController
	def index
		@branches = Array.new
		current_user.companies.each do |company|
			@branches = @branches + company.branches
		end
	end

	def create
		pay_head = PayHead.create(:name => params[:name], 
		:work_description => params[:work_description],
		:number_of_items => params[:number_of_items],
		:pay => params[:pay],
		:branch_id => params[:branch_id])
		redirect_to :back
	end

	def destroy
		@work_head = PayHead.find(params[:id])
		@work_head.destroy
		redirect_to :back
	end

	def update
		pay_head = PayHead.find(params[:id])
		pay_head.update_attributes(:name => params[:name],
		:work_description => params[:work_description],
		:number_of_items => params[:number_of_items],
		:pay => params[:pay])
		redirect_to :back
	end
end
