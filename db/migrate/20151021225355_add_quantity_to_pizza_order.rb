class AddQuantityToPizzaOrder < ActiveRecord::Migration
  def change
    add_column :pizza_orders, :quantity, :int
  end
end
