class AddEnabledToToppings < ActiveRecord::Migration
  def change
    add_column :toppings, :enabled, :boolean, default: true
  end
end
