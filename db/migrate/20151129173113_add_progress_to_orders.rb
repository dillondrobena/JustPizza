class AddProgressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :progress, :integer, default: 0
  end
end
