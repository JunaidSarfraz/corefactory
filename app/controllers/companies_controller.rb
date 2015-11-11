class CompaniesController < ApplicationController
  before_action :authenticate_user!
  helper_method :calculate_number_of_employees
  helper_method :calculate_last_year_sale
  helper_method :calculate_last_year_profit
  before_action :load_factory
  def index
  	@companies = current_user.companies
  end
  
  def new
  	@company = Company.new
  end
  
  def create
  	@company = Company.create(factory_params)
  	@company.owner = current_user
  	@company.save!
  	redirect_to :action => "index"
  end

  def show
  end

  def edit
  end

  def update
  	@company.update_attributes(factory_params)
  	@company.save
  	redirect_to action: "index"
  end

  def destroy
  	@company.destroy
  	redirect_to :action => "index"
  end

  def get_all_branches
    company = Company.find(params[:company_id].to_i)
    render json: company.branches
  end

  private

  def factory_params
  	params.require(:company).permit(:id, :name, :vision, :work_description, :email, 
  	:password_of_company_email, :primary_phone, :secondary_phone, :tax_information,
  	branches_attributes: [:id, :name, :address, :city, :country, :zip_code, :primary_phone, :secondary_phone, :email,
  	:branch_head_id, :_destroy])
  end

  def load_factory
  	if params[:id].present?
  		@company = Company.find(params[:id])
  	end
  end

  def calculate_number_of_employees(company)
  	result = 0
  	company.branches.each do |branch|
  		result = result + branch.employees.count
  	end
  	return result
  end

  def calculate_last_year_sale(company)
  	return 0
  end

  def calculate_last_year_profit(company)
  	return 0
  end
end
