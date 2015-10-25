class UserController < ApplicationController

	before_action :authenticate_user!
	before_filter :load_user, :only => [:dashboard, :settings]
	def dashboard
	end

	def settings
	end

	private

	def load_user
		@user = User.find(params[:user_id])
	end
end
