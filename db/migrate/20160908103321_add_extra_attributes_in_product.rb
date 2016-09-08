class AddExtraAttributesInProduct < ActiveRecord::Migration
  def change
  	add_column	:products, :profit, :integer
  	add_column	:products, :profit_percentage, :integer
  end
end
