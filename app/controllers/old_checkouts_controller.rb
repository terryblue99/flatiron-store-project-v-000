class CheckoutsController < ApplicationController

  def show
    binding.pry
    @current_cart = Cart.find_by(:id => current_user.current_cart_id)
    @current_cart = Cart.cart_checkout(@current_cart)
  end

end
