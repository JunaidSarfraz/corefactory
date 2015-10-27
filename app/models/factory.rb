class Factory < ActiveRecord::Base
	has_many :branches, :dependent => :delete_all
	belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
end
