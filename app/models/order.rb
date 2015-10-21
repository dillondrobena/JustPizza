class Order < ActiveRecord::Base
  belongs_to :user
  has_many :pizza_orders
end
