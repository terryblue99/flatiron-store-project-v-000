class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout]

  def show   
  end

  def checkout
    session[:checkout] = "no"
    @current_cart.cart_checkout
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path
  end

  private

    def set_cart
      @current_cart = Cart.find_by(:id => params[:id])
    end

end
