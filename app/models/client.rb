class Client < ActiveRecord::Base
	enum blood_group: [:"A+",:"A-",:"AB+",:"AB-",:"O+",:"O-",:unknown]
	enum gender: [:male, :female, :undefinded]
	belongs_to	:company, :class_name => "Company", :foreign_key => "company_id"
	
	has_many	:product_clients, :class_name => "ProductClient", :foreign_key => "client_id"
	has_many	:products, :through => :product_clients
	
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
