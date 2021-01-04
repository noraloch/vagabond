class ApplicationController < ActionController::Base
    # before_action :authorize_page
    # helper_method :logged_in?
    
    # def find_current_user
    #     @current_user = User.find_by(id: session[user:id])
    # end

    # def logged_in?
    #     !find_current_user.nil?
    # end

    # def authorize_page
    #     redirect_to new_session_path unless logged_in?
    # end
end
