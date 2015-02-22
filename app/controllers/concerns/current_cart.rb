module CurrentCart
	extend ActiveSupport::Concern

	private
		def set_cart
			@cart = Cart.find(session[:cart_id])
			@count = session[:count]
		rescue ActiveRecord::RecordNotFound
			# rescue is like catching exception
			@cart = Cart.create
			session[:cart_id] = @cart.id
		end

end