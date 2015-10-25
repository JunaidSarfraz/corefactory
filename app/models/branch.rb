class Branch < ActiveRecord::Base
	has_many 	:employees, :class_name => "User", :foreign_key => "branch_id" 
	has_many	:pay_heads
	belongs_to 	:factory
	belongs_to  :branch_head, :class_name => "User", :foreign_key => "branch_head_id"
end
