class AddDiscountPercentageInProducts < ActiveRecord::Migration
  def change
  	add_column :products, :discount_percentage, :integer, default: 000
  end
end
