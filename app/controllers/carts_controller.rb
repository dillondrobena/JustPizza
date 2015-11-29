class CartsController < ApplicationController
  def index
    @orders = current_user.orders.where(progress: 0)
    if @orders.length == 0
      flash[:danger] = "No current orders exist"
      redirect_to new_order_path
    end
    @grandTotal = @orders.sum :cost
  end

  def confirm
    @orders = current_user.orders.where(progress: 0)
    @orders.each do |order|
      order.progress = "completed"
      order.save
    end
    flash[:success] = "Orders successfully placed"
    redirect_to orders_path
  end
end
