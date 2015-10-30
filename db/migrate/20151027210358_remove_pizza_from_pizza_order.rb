class RemovePizzaFromPizzaOrder < ActiveRecord::Migration
  def change
    remove_belongs_to :pizza_orders, :pizza
  end
end
