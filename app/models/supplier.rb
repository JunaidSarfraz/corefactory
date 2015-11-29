class Supplier < ActiveRecord::Base
	enum blood_group: [:"A+",:"A-",:"AB+",:"AB-",:"O+",:"O-",:unknown]
	enum gender: [:male, :female, :undefinded]
	belongs_to :company, :class_name => "Company", :foreign_key => "company_id"
	
	has_many	:product_suppliers, :class_name => "ProductSupplier", :foreign_key => "supplier_id"
	has_many	:products, :through => :product_suppliers
	
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
