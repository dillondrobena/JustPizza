class AddCostToTopping < ActiveRecord::Migration
  def change
    add_column :toppings, :cost, :int
  end
end
