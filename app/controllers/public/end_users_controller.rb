class Public::EndUsersController < ApplicationController
	
	def top
	end

	def show
		@user = EndUser.find(params[:id])
	end

	def edit
		@user = EndUser.find(params[:id])
	end

	def update
		@user=EndUser.find(params[:id])
		if @user.update(end_user_params)
			flash[:notice]="You have updated user successfully."
			redirect_to end_user_path(current_end_user.id)
		else
			render 'edit'
		end
	end

	def unsubscribe

	end

	def withdraw
		@user = EndUser.find(current_end_user.id)
		@user.is_active_member_status = false
		@user.save
		@user.destroy
		redirect_to new_end_user_session_path
	end

	private

	def end_user_params
		params.require(:end_user).permit(:first_name,:last_name,:kana_last_name,:kana_first_name,:email,:postal_code,:address,:phone_number)
	end
end

