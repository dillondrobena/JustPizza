class Topping < ActiveRecord::Base
  has_and_belongs_to_many :pizzas

  def get_name_and_cost
    "#{self.name}: $#{self.cost}"
  end

end
