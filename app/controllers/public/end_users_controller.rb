class Public::EndUsersController < ApplicationController
	def top
	end
	def show
		@user = EndUser.find(params[:id])
	end
end

