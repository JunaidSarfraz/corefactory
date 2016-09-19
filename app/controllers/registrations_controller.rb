class RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_parameters, :only => [:create, :update]

protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :middle_name, :last_name, :cnic,
		 :religion, :gender, :cast, :height,:blood_group, :address, :city, :country, :primary_phone,
		 :seconday_phone,:email, :password, :_type) }
  end

end
