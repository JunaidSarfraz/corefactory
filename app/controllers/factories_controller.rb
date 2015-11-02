class FactoriesController < ApplicationController
  before_action :authenticate_user!
  helper_method :calculate_number_of_employees
  helper_method :calculate_last_year_sale
  helper_method :calculate_last_year_profit
  before_action :load_factory
  def index
  	@factories = current_user.factories
  end
  
  def new
  	@factory = Factory.new
  end
  
  def create
  	@factory = Factory.create(factory_params)
  	@factory.owner = current_user
  	@factory.save!
  	redirect_to :action => "index"
  end

  def show
  end

  def edit
  end

  def update
  	@factory.update_attributes(factory_params)
  	@factory.save
  	redirect_to action: "index"
  end

  def destroy
  	@factory.destroy
  	redirect_to :action => "index"
  end

  def get_all_branches
    if params[:factory_id] == "0"
      @branches = Array.new
      current_user.factories.each do |factory|
        @branches = @branches + factory.branches
      end
    else
      @factory = Factory.find(params[:factory_id])
      @branches = @factory.branches
    end
    respond_to do |format|
      format.html { render partial: "work_heads/work_heads_index"}
      format.json {
        if @factory.present? 
          render json: @factory.branches.to_json
        else
          render json: false
        end 
      }
    end
  end

  private

  def factory_params
  	params.require(:factory).permit(:id, :name, :vision, :work_description, :email, 
  	:password_of_factory_email, :primary_phone, :secondary_phone, :tax_information,
  	branches_attributes: [:id, :name, :address, :city, :country, :zip_code, :primary_phone, :secondary_phone, :email,
  	:branch_head_id, :_destroy])
  end

  def load_factory
  	if params[:id].present?
  		@factory = Factory.find(params[:id])
  	end
  end

  def calculate_number_of_employees(factory)
  	result = 0
  	factory.branches.each do |branch|
  		result = result + branch.employees.count
  	end
  	return result
  end

  def calculate_last_year_sale(factory)
  	return 0
  end

  def calculate_last_year_profit(factory)
  	return 0
  end
end
