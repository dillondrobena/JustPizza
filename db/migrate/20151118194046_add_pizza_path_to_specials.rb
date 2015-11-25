class AddPizzaPathToSpecials < ActiveRecord::Migration
  def change
    add_column :specials, :pizza_path, :string
  end
end
