module OrdersHelper

  def users_order?
    @order = Order.find(params[:id])
    @order.user.id == current_user.id
  end

end
