class AddPizzaToSpecial < ActiveRecord::Migration
  def change
    add_reference :specials, :pizza, index: true, foreign_key: true
  end
end
