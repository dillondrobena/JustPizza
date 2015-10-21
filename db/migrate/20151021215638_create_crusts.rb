class CreateCrusts < ActiveRecord::Migration
  def change
    create_table :crusts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
