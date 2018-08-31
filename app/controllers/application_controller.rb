class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protect_from_forgery with: :exception
	rescue_from CanCan::AccessDenied do |exception|
		if current_user.role.eql? 'super_admin'
			redirect_to rails_admin_path, :alert => exception.message
		elsif current_user.role.eql? 'admin'
			redirect_to admin_root_path, :alert => exception.message
		elsif current_user.role.eql? 'member'
			redirect_to members_path, :alert => exception.message
		else
			redirect_to root_path, :alert => exception.message
		end
	end
	def after_sign_in_path_for(resource)
		if resource.role.eql? 'super_admin'
			rails_admin_path
		elsif resource.role.eql? 'admin'
			admin_root_path
		else
			members_path
		end
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :email])
	end

end
