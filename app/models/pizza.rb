class Pizza < ActiveRecord::Base
  has_and_belongs_to_many :toppings
  has_many :pizza_orders
  belongs_to :crust
  validates :crust, presence: true
end
