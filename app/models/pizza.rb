class Pizza < ActiveRecord::Base
  has_and_belongs_to_many :toppings
  has_many :pizza_orders, as: :pizza
  belongs_to :crust
  validates :crust, presence: true
  validates :name, presence: true

  def unique_pizza?
    pizza = Pizza.joins(:toppings).where(crust: self.crust_id)
    self.toppings.each do |topping|
      pizza = pizza.where(:toppings => {id: topping.id})
    end
    pizza.empty?
  end
end
