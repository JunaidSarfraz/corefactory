class ProductSupplier < ActiveRecord::Base
	belongs_to	:product, :class_name => "Product", :foreign_key => "product_id"
	belongs_to	:supplier, :class_name => "User", :foreign_key => "supplier_id"
end
