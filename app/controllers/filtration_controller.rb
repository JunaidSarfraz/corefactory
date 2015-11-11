require 'shared_functions'
class FiltrationController < ApplicationController
	
	#Filteration Logic of factories drop-down on work_heads and workers Index pages
	def filtration_logic_of_factories
	    if params[:factory_id] == "0" && params[:page_identity] == "work_heads"
	      @branches = Array.new
	      current_user.companies.each do |company|
	        @branches = @branches + company.branches
	      end
	    elsif params[:page_identity] == "work_heads"
	      @company = Company.find(params[:factory_id].to_i)
	      @branches = @company.branches
	    end

	    if params[:factory_id] == "0" && params[:page_identity] == "workers"
	    	load_workers
	    elsif params[:page_identity] == "workers"
	    	@workers = Array.new
	    	@company = Company.find(params[:factory_id].to_i)
	    	@company.branches.each do |branch|
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
	        if @company.present? 
	          render json: @company.branches.to_json
	        else
	          render json: false
	        end 
	      }
	    end
  	end


  	#Filtration Logic of Branches Dropdown on work_heads and workers Index pages
  	def filtration_logic_of_branches
  		signal = params[:signal]
  		
  		#one of the following branches or workers are used in this controller
  		@branches = Array.new
  		@workers = Array.new
  		@company = Company.find(params[:factory_id].to_i)
  		if signal == "" && params[:page_identity] == "work_heads"
  			@branches = @company.branches
  		elsif signal == "All" && params[:page_identity] == "work_heads"
			current_user.companies.each do |company|
				@branches = @branches + company.branches
	  		end
	  	elsif signal == "consider" && params[:page_identity] == "work_heads"
	  		@branches << Branch.find(params[:branch_id])
	  	end
		
		if signal == "" && params[:page_identity] == "workers"
  			@company.branches.each do |branch|
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

  	#Filtration Logic of worker or manager on workers index page
  	def worker_or_manager
  		factory_id = params[:factory_id]
  		branch_id = params[:branch_id]
  		selection = params[:selection]
  		@workers = Array.new	
  		if factory_id == "all"
  			if selection == "worker"
  				@workers = User.where(:_type => 2)
  			elsif selection == "manager"
  				@workers = User.where(:_type => 1)
  			elsif selection == "all"
  				load_workers
  			end	
  		elsif branch_id == "all"
	  		company = Company.find(factory_id)
  			if selection == "worker"
	  			company.branches.each do |branch|
		    			@workers = @workers + branch.employees.where(:_type => 2)
		    		end
		    	elsif selection == "manager"
		    		company.branches.each do |branch|
	    				@workers = @workers + branch.employees.where(:_type => 1)
	    			end
	    		elsif selection == "all"
	    			company.branches.each do |branch|
	    				@workers = @workers + branch.employees
	    			end
		    	end
		elsif branch_id != "all"
			branch = Branch.find(branch_id)
			if selection == "manager"
				@workers = branch.employees.where(:_type => 1)
			elsif selection == "worker"
				@workers = branch.employees.where(:_type => 2)
			elsif selection == "all"
				@workers = branch.employees
			end
  		end
  		render partial: "workers/workers_table"
  	end
end