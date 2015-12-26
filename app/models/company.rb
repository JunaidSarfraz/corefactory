class Company < ActiveRecord::Base
	has_many :branches, :dependent => :delete_all
	accepts_nested_attributes_for :branches, :allow_destroy => true
	
	has_many :accounts, :dependent => :delete_all
	accepts_nested_attributes_for :accounts, :allow_destroy => true

	belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

	has_many :suppliers, :class_name => "User", :foreign_key => "company_id"
	has_many :clients, :class_name => "User", :foreign_key => "client_company_id"
	
	has_many :products, :class_name => "Product", :foreign_key => "company_id"
	accepts_nested_attributes_for :products, :allow_destroy => true

end