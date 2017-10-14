class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout]

  def show
  end

  def checkout
    session[:checkout] = "no"
    @current_cart = Cart.cart_checkout(@current_cart)
    redirect_to cart_path
  end

  private

    def set_cart
      @current_cart = Cart.find_by(:id => current_user.current_cart_id)
    end

end
