class ProductClient < ActiveRecord::Base
	belongs_to	:product, :class_name => "Product", :foreign_key => "product_id"
	belongs_to	:client, :class_name => "Client", :foreign_key => "client_id"
end
