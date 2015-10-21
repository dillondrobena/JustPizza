class CreatePizzaOrder < ActiveRecord::Migration
  def change
    create_table :pizza_orders do |t|
      t.belongs_to :pizza, index: true, foreign_key: true
      t.belongs_to :order, index: true, foreign_key: true
    end
  end
end
