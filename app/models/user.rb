class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   enum gender: [:male, :female, :undefinded]
   enum blood_group: [:"A+",:"A-",:"AB+",:"AB-",:"O+",:"O-"]
   enum _type: [:owner, :manager, :worker]
   has_many	:factories
   has_many  	:hobbies
   has_many  	:accounts
   belongs_to 	:branch
   has_one 		:payroll
   has_many       :branches, :class_name => "Branch", :foreign_key => "branch_head_id"
   has_many       :work_diaries, :class_name => "WorkDiary", :foreign_key => "user_id"
   #self relation ship of manager and employees
   #-----------------------------------------------------------------------------------------------------
   has_many	:employees, :class_name => "User", :foreign_key => "manager_id"
   belongs_to	:manager, :class_name => "User", :foreign_key => "manager_id"
   #-----------------------------------------------------------------------------------------------------

   belongs_to :branch, :class_name => "Branch", :foreign_key => "branch_id" 

end