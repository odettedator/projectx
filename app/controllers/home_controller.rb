class HomeController < ApplicationController
  before_action :authenticate_user!
  authorize_resource :class => HomeController
  def index
  end
end
