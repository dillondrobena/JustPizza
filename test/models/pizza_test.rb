require 'test_helper'

class PizzaTest < ActiveSupport::TestCase

  def setup
    @pizza = Pizza.create(name: "Sample Pizza")
  end
  test "crust should be present" do
    assert_not @pizza.valid?, "Crust should not be empty"
  end
end
