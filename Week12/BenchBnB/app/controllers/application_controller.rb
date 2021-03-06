class ApplicationController < ActionController::Base
    helper_method :current_user, :is_logged_in?

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def is_logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil 
    end

    def login!(user)
        @current_user = user
        session[:session_token] = user.session_token
    end

    def require_logged_in
        redirect_to new_session_url unless is_logged_in?
    end


end
