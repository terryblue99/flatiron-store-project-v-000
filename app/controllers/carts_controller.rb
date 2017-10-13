class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout]

  def show
    if !user_session[:checkout]
      user_session[:checkout] = "yes"
    else
      user_session[:checkout] = "no"
    end
  end

  def checkout
    
  end

  private

    def set_cart
      @current_cart = Cart.find_by(:id => current_user.current_cart_id)
    end

end
