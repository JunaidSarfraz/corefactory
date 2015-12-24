class ProductClient < ActiveRecord::Base
	belongs_to	:product, :class_name => "Product", :foreign_key => "product_id"
	belongs_to	:client, :class_name => "User", :foreign_key => "client_id"
end
