class Order < ActiveRecord::Base
  belongs_to :user
  has_many :pizza_orders
  accepts_nested_attributes_for :pizza_orders
  validates :pizza_orders, presence: true
end
