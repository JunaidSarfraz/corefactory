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


  	#Filtration Logic of Branches Dropdown
  	def get_work_heads_of_branch
  		signal = params[:signal]
  		puts "-=-=-=-=-=-\n" * 10
  		puts params[:factory_id]
  		puts "-=-=-=-=-=-\n" * 10
  		@branches = Array.new
  		if(signal == "")
  			@factory = Factory.find(params[:factory_id].to_i)
  			@branches = @factory.branches
  		elsif(signal == "All")
			current_user.factories.each do |factory|
				@branches = @branches + factory.branches
	  		end
	  	elsif(signal == "consider")
	  		@branches << Branch.find(params[:branch_id])
	  	end
	  	render partial: "work_heads/work_heads_index"
  	end
end
