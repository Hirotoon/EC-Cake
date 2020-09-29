class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
    	added_attrs = [ :first_name, :last_name,:kana_first_name,:kana_last_name,:postal_code,:address,:phone_number,:email, :password, :password_confirmation ]
    	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	end

	private

	def after_sign_in_path_for(resource_or_scope)
		if resource_or_scope.is_a?(Admin)
			admin_root_path
		else
			end_user_path(resource)
		end
	end

	def after_sign_out_path_for(resource_or_scope)
		if resource_or_scope==:end_user
			root_path
		else
			new_admin_admin_session_path
		end
	end
end
