class Product < ActiveRecord::Base
	has_many	:product_suppliers, :class_name => "ProductSupplier", :foreign_key => "product_id"
	has_many	:suppliers, :through => :product_suppliers

	has_many	:product_clients, :class_name => "ProductClient", :foreign_key => "product_id"
	has_many	:clients, :through => :product_clients

	belongs_to	:company, :class_name => "Company", :foreign_key => "company_id"
end
