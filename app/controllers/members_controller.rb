class MembersController < ApplicationController
    load_and_authorize_resource :class => MembersController
    def index
        @user = current_user
    end
end
