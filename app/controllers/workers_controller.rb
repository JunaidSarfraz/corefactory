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
		params.require(:user).permit(
			:first_name, 
			:middle_name, 
			:last_name, 
			:gender, 
			:cnic, 
			:cast,
			:religion, 
			:email, 
			:password, 
			:password_confirmation, 
			:address, 
			:city, 
			:country, 
			:zip_code,
			:primary_phone, 
			:secondary_phone, 
			:disabled, 
			:_type, 
			:blood_group, 
			:height, 
			:join_date, 
			:branch_id, 
			:hobbies_attributes => [
				:id, 
				:name,
				:description,
				:_destroy
			],
			:accounts_attributes => [
				:id,
				:title,
				:description,
				:_type,
				:bank_name,
				:bank_account_number,
				:bank_address,
				:bank_city,
				:bank_state,
				:bank_country,
				:bank_zip_code,
				:bank_primary_phone,
				:bank_secondary_phone,
				:current_balance,
				:account_holder_type,
				:_destroy
			]
		)
	end
end
