class ShoppingCartsController < ApplicationController
	def new
		@shop_cart = ShoppingCart.new
	end

	def create
		@shop_cart = ShoppingCart.new(shop_cart_params)
		respond_to do |format|
	      		if @shop_cart.save
				format.html { redirect_to "/", notice: 'Added to the cart' }
				format.json { render :show, status: :created, location: @shop_cart }
			else
				format.html { render :new }
				format.json { render json: @shop_cart.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@shop_cart = ShoppingCart.find_by(:user_name)
		respond_to do |format|
      			if @shop_cart.update(edit_params)
				format.html { redirect_to "/", notice: 'Cart modified' }
				format.json { render :show, status: :ok, location: @shop_cart }
			else
				format.html { render :edit }
				format.json { render json: @shop.errors, status: :unprocessable_entity }
			end
	        end
	end
	
	def shop_cart_params
		@user_name = current_user.name + " " + current_user.last_name		
		params.require(:shopping_cart).permit(user_name: @user_name, :order_date, :ticket_quantity, :total_paid)
	end

	def edit_params
		params.require(:shopping_cart).permit(:order_date, :ticket_quantity, :total_paid)
	end
end
