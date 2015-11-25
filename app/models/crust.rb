class Crust < ActiveRecord::Base
  has_many :pizzas
  validates :name, presence: true
end
