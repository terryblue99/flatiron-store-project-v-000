module SessionHelper	

	def set_session
		if !session[:here_again]
		  session[:here_again] = "yes"
		  session[:items_in_cart] = 0
		  session[:checkout] = nil
	 	end
	end	

end