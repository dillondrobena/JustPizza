class AddEnabledToCrusts < ActiveRecord::Migration
  def change
    add_column :crusts, :enabled, :boolean, default: true
  end
end
