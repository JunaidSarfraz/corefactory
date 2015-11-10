require 'shared_functions'
class WorkHeadsController < ApplicationController
	def index
		@branches = Array.new
		current_user.factories.each do |factory|
			@branches = @branches + factory.branches
		end
	end

	def create
		pay_head = PayHead.create(:name => params[:name], 
		:work_description => params[:work_description],
		:number_of_items => params[:number_of_items],
		:pay => params[:pay],
		:branch_id => params[:branch_id])
		redirect_to :back
	end

	def destroy
		@work_head = PayHead.find(params[:id])
		@work_head.destroy
		redirect_to :back
	end

	def update
		pay_head = PayHead.find(params[:id])
		pay_head.update_attributes(:name => params[:name],
		:work_description => params[:work_description],
		:number_of_items => params[:number_of_items],
		:pay => params[:pay])
		redirect_to :back
	end


	#Filteration Logic of factories drop-down
	def filtration_logic_of_factories
	    if params[:factory_id] == "0" && params[:page_identity] == "work_heads"
	      @branches = Array.new
	      current_user.factories.each do |factory|
	        @branches = @branches + factory.branches
	      end
	    elsif params[:page_identity] == "work_heads"
	      @factory = Factory.find(params[:factory_id].to_i)
	      @branches = @factory.branches
	    end

	    if params[:factory_id] == "0" && params[:page_identity] == "workers"
	    	load_workers
	    elsif params[:page_identity] == "workers"
	    	@workers = Array.new
	    	@factory = Factory.find(params[:factory_id].to_i)
	    	@factory.branches.each do |branch|
	    		@workers = @workers + branch.employees
	    	end
	    end

	    respond_to do |format|
	      format.html {
	      		if params[:page_identity] == "workers"
	      			render partial: "workers/workers_table"
	      		else 
	      			render partial: "work_heads/work_heads_index"
	      		end
	      	}
	      format.json {
	        if @factory.present? 
	          render json: @factory.branches.to_json
	        else
	          render json: false
	        end 
	      }
	    end
  	end


  	#Filtration Logic of Branches Dropdown
  	def filtration_logic_of_branches
  		signal = params[:signal]
  		
  		#one of the following branches or workers are used in this controller
  		@branches = Array.new
  		@workers = Array.new
  		@factory = Factory.find(params[:factory_id].to_i)
  		if signal == "" && params[:page_identity] == "work_heads"
  			@branches = @factory.branches
  		elsif signal == "All" && params[:page_identity] == "work_heads"
			current_user.factories.each do |factory|
				@branches = @branches + factory.branches
	  		end
	  	elsif signal == "consider" && params[:page_identity] == "work_heads"
	  		@branches << Branch.find(params[:branch_id])
	  	end
		
		if signal == "" && params[:page_identity] == "workers"
  			@factory.branches.each do |branch|
	    			@workers = @workers + branch.employees
	    		end
  		elsif signal == "All" && params[:page_identity] == "workers"
			load_workers
	  	elsif signal == "consider" && params[:page_identity] == "workers"
	  		@workers = Branch.find(params[:branch_id].to_i).employees
	  	end	
	  	if params[:page_identity] == "work_heads" 	
	  		render partial: "work_heads/work_heads_index"
	  	elsif params[:page_identity] == "workers"
	  		render partial: "workers/workers_table"
	  	end
  	end
end
