class Api::SessionsController < ApplicationController

    def create
        @user = User.find_by_credentals(params[:user][:username], params[:user][:password])
        login(@user)
    end

    def destroy
        if logout!
            render '{}'
        elsif !current_user
            flash[:errors] = ['404']
        end
    end
end
