class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout]

  def show

  end

  def checkout

    @current_cart.cart_checkout
    current_user.current_cart.update(:status => 'submitted')
    current_user.current_cart = nil
    
    current_user.save

    session[:items_in_cart] = 0
    session[:checkout] = "no"

    redirect_to cart_path  

  end

  private

    def set_cart

      @current_cart = Cart.find_by(:id => params[:id])

    end

end
