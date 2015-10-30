class ChangeCostOnOrdersToFloat < ActiveRecord::Migration
  def change
    change_column :orders, :cost, :float
  end
end
