class AddPolymorphicPizzaToPizzaOrder < ActiveRecord::Migration
  def change
    add_belongs_to :pizza_orders, :pizza, :polymorphic => true
  end
end
