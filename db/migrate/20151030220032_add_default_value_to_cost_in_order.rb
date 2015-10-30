class AddDefaultValueToCostInOrder < ActiveRecord::Migration
  def change
    change_column_default :orders, :cost, 0
  end
end
