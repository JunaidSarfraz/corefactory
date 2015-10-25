class AddPayrollScheduleIdToTransection < ActiveRecord::Migration
  def change
  	add_column :transections, :payroll_schedule_id,	:integer
  end
end
