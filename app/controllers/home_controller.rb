class HomeController < ApplicationController
   
   def index
   	if current_user.present?
   		redirect_to user_dashboard_path(current_user)
   	end
   end
end
