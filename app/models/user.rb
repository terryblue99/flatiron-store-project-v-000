class User < ActiveRecord::Base
  has_secure_password
  has_many :carts
  belongs_to :current_cart, class_name: "Cart", foreign_key: "current_cart_id"

  def current_cart=(cart)
    self.current_cart_id = cart.id if @current_cart = cart
    self.save
  end

  def current_cart
    @current_cart = Cart.find_by(:id => self.current_cart_id)
  end

end
