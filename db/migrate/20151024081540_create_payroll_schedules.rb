class CreatePayrollSchedules < ActiveRecord::Migration
  def change
    create_table :payroll_schedules do |t|
    	t.date :schedule_date
    	t.date :pay_date
      t.integer :number_of_days_for_notification
      
      t.integer :payroll_id
      t.timestamps null: false
    end
  end
end
