class MembersController < ApplicationController
    load_and_authorize_resource :class => MembersController
    layout 'members'
    def index
        @user = current_user
    end
end
