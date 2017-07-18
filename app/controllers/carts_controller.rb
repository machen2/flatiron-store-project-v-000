class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    current_cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    @cart = Cart.find_by(id: @current_user.current_cart_id)
    @cart.destroy
    #redirect_to cart_path(@current_user.current_cart_id)
    redirect_to root_path
  end
end
