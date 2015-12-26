class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   enum gender: [:male, :female, :undefinded]
   enum blood_group: [:"A+",:"A-",:"AB+",:"AB-",:"O+",:"O-",:unknown]
   enum _type: [:owner, :manager, :worker, :client, :supplier]
   has_many       :companies, :dependent => :delete_all
   
   has_many  	:hobbies, :dependent => :delete_all
   accepts_nested_attributes_for :hobbies, :allow_destroy => true

   has_many  	:accounts, :dependent => :delete_all
   accepts_nested_attributes_for :accounts, :allow_destroy => true
   
   belongs_to      :branch
   belongs_to      :company
   belongs_to      :client_company, :class_name => "Company", :foreign_key => "client_company_id"
   has_one 	       :payroll
   has_many       :branches, :class_name => "Branch", :foreign_key => "branch_head_id", :dependent => :delete_all
   has_many       :work_diaries, :class_name => "WorkDiary", :foreign_key => "user_id", :dependent => :delete_all
   #self relation ship of manager and employees
   #-----------------------------------------------------------------------------------------------------
   has_many	:employees, :class_name => "User", :foreign_key => "manager_id", :dependent => :nullify
   belongs_to	:manager, :class_name => "User", :foreign_key => "manager_id"
   #-----------------------------------------------------------------------------------------------------

   belongs_to :branch, :class_name => "Branch", :foreign_key => "branch_id" 
   accepts_nested_attributes_for :hobbies, :allow_destroy => true

   has_many  :product_suppliers, :class_name => "ProductSupplier", :foreign_key => "supplier_id"
   has_many  :supplier_products, :through => :product_suppliers, :source => :product
   accepts_nested_attributes_for :supplier_products, :allow_destroy => true

   has_many  :product_clients, :class_name => "ProductClient", :foreign_key => "client_id"
   has_many  :client_products, :through => :product_clients, :source => :product
   accepts_nested_attributes_for :client_products, :allow_destroy => true
end