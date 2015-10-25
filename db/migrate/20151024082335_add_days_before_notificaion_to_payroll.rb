class AddDaysBeforeNotificaionToPayroll < ActiveRecord::Migration
  def change
  	add_column :payrolls, :number_of_days_for_notification,	:integer
  end
end
