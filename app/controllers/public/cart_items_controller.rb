class Public::CartItemsController < ApplicationController
	def index
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
		@total_price = 0
	end

	def create
		#cart_item では追加した商品が既にカート内商品に存在するか(存在しなかった場合nilを返す)
		cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
		if params[:cart_item][:amount] == ""
			redirect_to item_path(params[:cart_item][:item_id])
		elsif cart_item.present?
			cart_item.add_again_amount(params[:cart_item][:amount])
			redirect_to cart_items_path
		else
			@cart_item = CartItem.new(cart_item_params)
			@cart_item.save
		    flash[:notice] ="You have creatad cart_item successfully."
		    redirect_to cart_items_path
		end

	end

	def update
		cart_item=CartItem.find(params[:id])
		cart_item.update(cart_item_params)
		redirect_to cart_items_path
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items_path
	end

	def destroy_all
		cart_items = CartItem.all
		cart_items.destroy_all
		redirect_to cart_items_path
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:amount, :end_user_id, :item_id)
	end
end
