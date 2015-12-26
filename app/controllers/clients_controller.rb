class ClientsController < ApplicationController
	before_filter :set_client, :only => [:update, :show, :destroy]
	def index
		load_clients
	end

	def new
		@user = User.new
	end

	def create
		@client = User.create(client_params)
		@client.client_company_id = params[:company][:id]
		@client.confirm
		@client.save
		redirect_to :action => "index"
	end

	def show
	end

	def destroy
		@client.destroy
		redirect_to :action => "index"
	end

	def update
		if @client.update_without_password(client_params)
			flash[:alert] = "Successfully Updated"
		end
		redirect_to :action => "index"
	end

	def change_status
		if @client.disabled
			@client.disabled = false
		else
			@client.disabled = true
		end
		@client.save
		render json: true
	end

	private

	def set_client
		@client = User.find(params[:id])
	end

	def load_clients
		@clients = Array.new
		current_user.companies(:created_at).each do |company|
			company.clients(:created_at).each do |client|
				@clients << client
			end
		end
	end

	def client_params
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
			:fax,
			:secondary_email, 
			:ntn, 
			:social_media_links, 
			:home_contact, 
			:client_company_id,
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
				:_destroy
			],
			:client_products_attributes => [
				:id,
				:name,
				:description,
				:_type,
				:category,
				:cost,
				:company_id,
				:_destroy
			]
		)
	end
end
