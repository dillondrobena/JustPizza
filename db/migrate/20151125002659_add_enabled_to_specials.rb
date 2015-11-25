class AddEnabledToSpecials < ActiveRecord::Migration
  def change
    add_column :specials, :enabled, :boolean, default: true
  end
end
