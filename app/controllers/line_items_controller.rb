class LineItemsController < ApplicationController
  def create
    if current_user && current_user.current_cart
      current_user.current_cart.add_item(params[:item_id])
    elsif current_user
      current_user.current_cart = current_user.carts.create
      current_user.current_cart.add_item(params[:item_id]).save
    end
    current_user.save
    if current_user.current_cart.save
      redirect_to cart_path(current_user.current_cart_id)
    else
      redirect_to store_path
    end
  end
end
