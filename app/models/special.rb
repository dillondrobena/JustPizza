class Special < ActiveRecord::Base
  belongs_to :pizza
  validates :pizza, :presence => true
  validates :cost, :presence => true
  accepts_nested_attributes_for :pizza, allow_destroy: true

  def get_name_and_cost
    "#{pizza.name}: $#{cost}"
  end
end

