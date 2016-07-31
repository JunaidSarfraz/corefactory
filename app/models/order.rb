class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :company
	has_many   :order_items
	accepts_nested_attributes_for :order_items, :allow_destroy => true
end
