class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.integer :cost
      t.timestamps null: false
    end
  end
end
