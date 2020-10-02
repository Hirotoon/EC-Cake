class Admin::EndUsersController < ApplicationController
	def index
		@end_users=EndUser.with_deleted
	end
end
