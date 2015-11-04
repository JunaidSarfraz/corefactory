require 'shared_functions'
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
		@worker = User.find(params[:id].to_i)
		@worker.destroy
		redirect_to :back
	end

	def change_status
		worker = User.find(params[:id])
		if worker.disabled
			worker.disabled = false
		else
			worker.disabled = true
		end
		worker.save
		render json: true
	end

	private
	
	def worker_params
		params.require(:user).permit(:first_name, :middle_name, :last_name, :gender, :cnic,
		:religion, :email, :password, :password_confirmation, :address, :city, :country, :zip_code,
		:primary_phone, :secondary_phone, :disabled, :_type, :blood_group, :height)
	end
end
