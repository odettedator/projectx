class Admin::DashboardController < ApplicationController
  load_and_authorize_resource :thread, :class => Admin::DashboardController
  def index
    redirect_to new_user_invitation_path
  end
end
