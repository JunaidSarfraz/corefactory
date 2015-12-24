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
			flash[:alert] = "Successfully Updated"
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
	def load_suppliers
		@suppliers = Array.new
		current_user.companies(:created_at).each do |company|
			company.suppliers(:created_at).each do |supplier|
				@suppliers << supplier
			end
		end
	end

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
			]
		)
	end

	def set_supplier
		@supplier = User.find(params[:id].to_i)
	end
end