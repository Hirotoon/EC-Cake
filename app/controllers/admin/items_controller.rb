class Admin::ItemsController < ApplicationController

	def index
		@items = Item.all
	end 

	def show
		@item=Item.find(params[:id])
	end

	def edit 

	end

	def new
		@item = Item.new
		@genres = Genre.all
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			flash[:notice] = "You have creatad book successfully."
	    	redirect_to admin_item_path(@item.id)
	    else
	    	render :new
	    end
	end

	def update

	end

	private

	def item_params
		params.require(:item).permit(:genre_id,:image,:name,:description,:price_excluding_price,:sale_status)
	end
	
end
