class ChangeCostToFloatOnTopping < ActiveRecord::Migration
  def change
    change_column :toppings, :cost, :float
  end
end
