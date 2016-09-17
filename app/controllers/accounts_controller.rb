class AccountsController < ApplicationController
	
	before_filter :set_account, :only => [:edit, :update,:show,:destroy]
	def index
		load_accounts
	end

	def new
		@account = Account.new
	end

	def create
		Account.create(account_params)
  		redirect_to :action => "index"
	end

	def edit
	end

	def update
	end

	def show
		if !(@account.present?)
			redirect_to :action => "index"
		end
	end

	def extract_users_by_account_holer_type
		account_holder_type = params[:selected_value]
		assosiated_users = Array.new
		if account_holder_type === "employee"
			assosiated_users = get_all_employees
		elsif account_holder_type === "client"
			assosiated_users = get_all_clients
		elsif account_holder_type === "supplier"
			assosiated_users = get_all_suppliers
		elsif account_holder_type == "company"
			assosiated_users = get_all_companies
		end
		render json: assosiated_users
	end


	def destroy
		@tab = params[:'tab-identity']
		if(@account.present?)
			@account.destroy
			if @account.company?
				load_company_accounts
			elsif @account.employee?
				load_employee_accounts
			elsif @account.supplier?
				load_suppliers_accounts
			elsif @account.client?
				load_clients_accounts
			end
			respond_to do |format|
				format.js {}
			end
		else
			redirect_to :action => "index"
		end
	end

	def account_names
		identity = params[:identity]
		tags = Array.new
		if identity == "company"
			load_company_accounts
			tags = @companies_accounts
		elsif identity == "employee"
			load_employee_accounts
			tags = @employee_accounts
		elsif identity == "client"
			load_clients_accounts
			tags = @client_accounts
		elsif identity == "supplier"
			load_suppliers_accounts
			tags = @supplier_accounts
		end
		tags = Account.where(id: tags.map(&:id)).pluck(:title)
		render json: tags
	end

private

	def load_accounts
		load_company_accounts
		load_employee_accounts
		load_suppliers_accounts
		load_clients_accounts
	end

	def load_company_accounts
		@companies_accounts = Array.new
		current_user.companies.each do |company|
			company.accounts.each do |company_account|
				@companies_accounts << company_account
			end
		end
	end

	def load_employee_accounts
		@employee_accounts = Array.new
		current_user.companies.each do |company|
			company.branches.each do |branch|
				branch.employees.each do |employee|
					employee.accounts.each do |employee_account|
						@employee_accounts << employee_account
					end
				end
			end
		end
	end

	def load_suppliers_accounts
		@supplier_accounts = Array.new
		current_user.companies.each do |company|
			company.suppliers.each do |supplier|
				supplier.accounts.each do |supplier_account|
					@supplier_accounts << supplier_account
				end
			end
		end
	end

	def load_clients_accounts
		@client_accounts = Array.new
		current_user.companies.each do |company|
			company.clients.each do |client|
				client.accounts.each do |client_account|
					@client_accounts << client_account
				end
			end
		end
	end

	def get_all_employees
		all_employees = Array.new
		current_user.companies.each do |company|
			company.branches.each do |branch|
				branch.employees.each do |employee|
					all_employees << employee
				end
			end
		end
		all_employees
	end

	def get_all_clients
		all_clients = Array.new
		current_user.companies.each do |company|
			company.clients.each do |client|
				all_clients << client
			end
		end
		all_clients
	end

	def get_all_suppliers
		all_suppliers = Array.new
		current_user.companies.each do |company|
			company.suppliers.each do |supplier|
				all_suppliers << supplier
			end
		end
		all_suppliers
	end

	def get_all_companies
		all_companies = Array.new
		current_user.companies.each do |company|
			all_companies << company
		end
		all_companies
	end

	def account_params
		params.require(:account).permit(:title, :description, :_type, :bank_account_number, :bank_name,
			:bank_address, :bank_city, :current_balance, :user_id, :bank_state, :bank_country, :bank_zip_code,
			:bank_primary_phone, :bank_secondary_phone, :account_holder_type, :company_id)
	end

	def set_account
		@account = Account.where(:id => params[:id]).first
	end
end
