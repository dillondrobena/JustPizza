class Pizza < ActiveRecord::Base
  has_and_belongs_to_many :toppings
  belongs_to :crust
  validates :crust, presence: true
end
