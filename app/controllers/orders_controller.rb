class OrdersController < ApplicationController
  before_filter :logged_in_user?
  before_filter :users_order?, :only => :show
  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    @orders = current_user.orders.where(progress: 1)
  end

  def new
    @order = Order.new
    @specials = Special.all
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.pizza_orders.each do |order|
      if not order.pizza_id.nil?
        order.pizza_type = "Special"
        @order.cost += (order.pizza.cost * order.quantity) unless order.pizza.nil?
      elsif order.has_pizza?
        order.pizza.name = "Custom"
        @order.cost += (10.99 * order.quantity)
        order.pizza.toppings.each do |topping|
          @order.cost += (topping.cost * order.quantity)
        end
      end
    end
    if @order.save
      redirect_to cart_path
    else
      @specials = Special.all
      render 'new'
    end
  end

  def show
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to cart_path
  end

  private

  def order_params
    params.require(:order).permit(:cost, :pizza_orders_attributes => [:quantity, :pizza_id, {:pizza_attributes => [:crust_id, :topping_ids => []]}, :_destroy])
    #params.require(:pizza).permit(:crust_id, toppings: [])
  end

  def logged_in_user?
    unless logged_in?
      store_location
      flash[:danger] = "Login in order to continue"
      redirect_to login_path
    end
  end

  def unique_pizza?(pi)
    pizza = Pizza.joins(:toppings).where(crust: pi.crust_id).where(:toppings => {id: pi.topping_ids})
    pizza.nil?
  end
end
