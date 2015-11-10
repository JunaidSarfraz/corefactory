require 'shared_functions'
class WorkersController < ApplicationController
	before_action :load_worker, only: [:show, :edit, :update, :destroy]
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

	def show
	end

	def edit
	end

	def update
		puts "=-=-=-=-=-=--=-=-\n" * 10
		puts params.to_yaml
		puts "=-=-=-=-=-=--=-=-\n" * 10

		@worker.update_without_password(worker_params)
		redirect_to action: "index"
	end

	def destroy
		load_worker
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
	
	def load_worker
		@worker = User.find(params[:id].to_i)
	end
	def worker_params
		params.require(:user).permit(:first_name, :middle_name, :last_name, :gender, :cnic,
		:religion, :email, :password, :password_confirmation, :address, :city, :country, :zip_code,
		:primary_phone, :secondary_phone, :disabled, :_type, :blood_group, :height, :join_date, 
		:branch_id)
	end
end
