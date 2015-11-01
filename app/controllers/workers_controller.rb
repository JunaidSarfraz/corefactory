class WorkersController < ApplicationController
	def index
		load_workers
	end

	def new
		@worker = User.new
	end

	def create
		@worker = User.create(worker_params)
		@worker.branch_id = params[:branch][:id]
		@worker.confirm
		@worker.save
		redirect_to :action => "index"
	end

	def destroy
		@worker = User.find(params[:id])
		@worker.destroy
		redirect_to :back
	end

	private

	def load_workers
		@workers = Array.new
		current_user.factories.each do |factory|
			factory.branches.each do |branch|
				@workers = @workers + branch.employees.where.not(_type: 0)
			end
		end
	end

	def worker_params
		params.require(:user).permit(:first_name, :middle_name, :last_name, :gender, :cnic,
		:religion, :email, :password, :password_confirmation, :address, :city, :country, :zip_code,
		:primary_phone, :secondary_phone, :disabled, :_type, :blood_group, :height)
	end
end
