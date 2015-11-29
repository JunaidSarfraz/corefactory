class ClientsController < ApplicationController
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
		@client = User.find(params[:id])
	end

	def destroy
		@client = User.find(params[:id])
		@client.destroy
		redirect_to :action => "index"
	end

	private

	def load_clients
		@clients = Array.new
		current_user.companies(:created_at).each do |company|
			company.clients(:created_at).each do |client|
				@clients << client
			end
		end
	end

	def client_params
		params.require(:user).permit(:first_name, :middle_name, :last_name, :gender, :cnic, :cast,
		:religion, :email, :password, :password_confirmation, :address, :city, :country, :zip_code,
		:primary_phone, :secondary_phone, :disabled, :_type, :blood_group, :height, :join_date, :fax,
		:secondary_email, :ntn, :social_media_links, :home_contact, :hobbies_attributes => [:id, :name,:description,:_destroy])
	end
end
