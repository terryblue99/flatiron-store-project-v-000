class LineItemsController < ApplicationController

	def create
		if user_signed_in?
			if !current_user.current_cart
				current_user.current_cart = current_user.carts.create
				current_user.save
			end
			l_item = current_user.current_cart.add_item(params[:item_id])
			l_item.save
			redirect_to cart_path(current_user.current_cart)
		else
			redirect_to store_path
		end
	end

end
