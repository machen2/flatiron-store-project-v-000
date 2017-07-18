class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.available_items
    @user = current_user
  end
end
