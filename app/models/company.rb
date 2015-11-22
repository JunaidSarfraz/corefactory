class Company < ActiveRecord::Base
	has_many :branches, :dependent => :delete_all
	has_many :accounts, :dependent => :delete_all
	belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
	accepts_nested_attributes_for :branches, :allow_destroy => true
end