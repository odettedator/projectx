class HomeController < ApplicationController
  #before_action :authenticate_user!
  #authorize_resource :class => HomeController
  layout 'home'
  def index
  end
end
