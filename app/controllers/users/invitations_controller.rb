class Users::InvitationsController < Devise::InvitationsController
  # before_action configure_permitted_parameters, :if => devise_controller?
  def create
    binding.pry
    # super
    # @user = resource
    # @user.update(first_name: params[:user][:first_name], last_name: params[:user][:last_name])
    @user = User.invite!(user_invitable_params)
    if @user.save
      redirect_to admin_root_path
    end
  end

  # def configure_permitted_parameters(resource)
  #   devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name]
  #   devise_parameter_sanitizer.for(:accept_invitation) do |user|
  #     user.permit(:first_name, :last_name)
  #   end
  # end

  private
    def user_invitable_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end