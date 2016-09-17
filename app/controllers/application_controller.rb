class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # callbacks to load data in sidebar
	before_filter :set_current_user_companies
	before_filter :load_suppliers
	before_filter :load_clients

	def after_sign_in_path_for(resource)
		if resource.disabled? == true
			sign_out resource
			flash[:notice] = "Your Account is Disabled Contact Product Owner"
			root_url
		else
			user_dashboard_path(current_user)
		end
	end 

	def after_sign_up_path_for(resource) 
		new_user_session_path 
	end 

	def after_update_path_for(resource) 
		user_dashboard_path(current_user)
	end

	private

	def set_current_user_companies
		if current_user.present?
			@sidebar_companies = current_user.companies
		end
	end 

	def load_suppliers
		if current_user.present?
			@suppliers = Array.new
			current_user.companies(:created_at).each do |company|
				company.suppliers(:created_at).each do |supplier|
					@suppliers << supplier
				end
			end
		end
	end

	def load_clients
		if current_user.present?
			@clients = Array.new
			current_user.companies(:created_at).each do |company|
				company.clients(:created_at).each do |client|
					@clients << client
				end
			end
		end
	end

end
