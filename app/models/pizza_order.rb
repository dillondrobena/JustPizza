class PizzaOrder < ActiveRecord::Base
  belongs_to :pizza, polymorphic: true
  belongs_to :order
  accepts_nested_attributes_for :pizza, allow_destroy: true
  validates :quantity, numericality: {greater_than_or_equal_to: 1}
  validates :pizza, presence: true

  def build_pizza(params)
    self.pizza = Pizza.new(params)
  end

  def has_pizza?
    not self.pizza.nil?
  end

end
