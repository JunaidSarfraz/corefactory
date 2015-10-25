class WorkDiary < ActiveRecord::Base
	belongs_to :pay_head
	belongs_to :emplyee, :class_name => "User", :foreign_key => "user_id"
end
