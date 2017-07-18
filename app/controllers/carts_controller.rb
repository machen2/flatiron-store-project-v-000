class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
  #  @cart = Cart.find(params[:id])
  #  @cart.cart_checkout
    current_cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    @current_user.current_cart = nil
    redirect_to cart_path(@current_user.current_cart_id)
  end
end
