class ChangeDatatypeOfProfitPercentage < ActiveRecord::Migration
  def change
  	change_column :products, :profit_percentage, :decimal
  end
end
