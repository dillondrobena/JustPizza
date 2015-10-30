class ChangeCostToFloatOnSpecial < ActiveRecord::Migration
  def change
    change_column :specials, :cost, :float
  end
end
