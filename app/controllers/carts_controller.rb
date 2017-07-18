class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.cart_checkout

    redirect_to cart_path(@current_cart)
  end
end
