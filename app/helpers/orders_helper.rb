module OrdersHelper

  def users_order?
    @order = Order.find(params[:id])
    if @order.user.id != current_user.id
      redirect_to root_path
    end
  end

end
