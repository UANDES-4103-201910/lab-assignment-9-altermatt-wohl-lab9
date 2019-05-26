class ShoppingCartsController < ApplicationController
	def index
		@shop_cart = ShoppingCart.all
	end		
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
				format.html { redirect_to "/", notice: 'Add to the cart' }
				format.json { render :show, status: :ok, location: @shop_cart }
			else
				format.html { render :edit }
				format.json { render json: @shop_cart.errors, status: :unprocessable_entity }
			end
	        end
	end

	def remove
		@shop_cart = ShoppingCart.find_by(:user_name)
		respond_to do |format|
      			if @shop_cart.update(remove_params)
				format.html { redirect_to "/", notice: 'Remove from the cart' }
				format.json { render :show, status: :ok, location: @shop_cart }
			else
				format.html { render :edit }
				format.json { render json: @shop_cart.errors, status: :unprocessable_entity }
			end
	        end
	end
	
	def shop_cart_params
		@order_date = DateTime.now
		@user_name = current_user.name + " " + current_user.last_name		
		params.require(:shopping_cart).permit(user_name: @user_name, order_date: @order_date, :ticket_quantity, :total_paid)
	end

	def edit_params
		@tic_quantity = @shop_cart.ticket_quantity + 1
		@ticket_payment = UserTickets.find_by(:user_id).paid + @shop_cart.total_paid
		params.require(:shopping_cart).permit(:order_date, ticket_quantity: @tic_quantity, total_paid: @ticket_payment)
	end

	def remove_params
		@tic_quantity = @shop_cart.ticket_quantity - 1
		@ticket_payment = @shop_cart.total_paid - UserTickets.find_by(:user_id).paid
		if @ticket_payment >= 0		
			params.require(:shopping_cart).permit(:order_date, ticket_quantity: @tic_quantity, total_paid: @ticket_payment)
		else
			flash[:error] = 'An error with the carts amount happen, try again'
			redirect_to :back
		end
	end
end
