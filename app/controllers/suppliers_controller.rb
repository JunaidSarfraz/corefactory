class SuppliersController < ApplicationController
	before_filter :set_supplier, :only => [:edit, :update,:show,:destroy, :change_status]
	def index
		load_suppliers
	end

	def new
		@supplier = User.new
	end

	def create
		@supplier = User.create(supplier_params)
		@supplier.company_id = params[:company][:id]
		@supplier.confirm
		@supplier.save
		redirect_to :action => "index"
	end

	def show
	end

	def update
		if @supplier.update_without_password(supplier_params)
			flash[:notice] = "Successfully Updated"
		end
		if @supplier.errors.messages.any?
			flash[:error] = @supplier.errors.messages
    end
		redirect_to :action => "index"
	end

	def destroy
		@supplier.destroy
		redirect_to :action => "index"
	end

	def change_status
		if @supplier.disabled
			@supplier.disabled = false
		else
			@supplier.disabled = true
		end
		@supplier.save
		render json: true
	end

	private
	

	def supplier_params
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
			:zip_code, :primary_phone, 
			:secondary_phone, 
			:disabled, 
			:_type, 
			:blood_group, 
			:height, 
			:join_date, 
			:company_id,
			:fax,
			:social_media_links,
			:secondary_email,
			:hobbies_attributes => [
				:id, 
				:name, 
				:description, 
				:_destroy
			], :supplier_products_attributes => [
				:id,
				:name,
				:description,
				:_type,
				:category,
				:cost,
				:company_id,
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

	def set_supplier
		@supplier = User.find(params[:id].to_i)
	end
end