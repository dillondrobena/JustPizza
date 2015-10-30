class ChangePizzaRelationshipOnSpecial < ActiveRecord::Migration
  def change
    remove_reference :specials, :pizza
    add_belongs_to :specials, :pizza
  end
end
