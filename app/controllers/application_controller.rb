class ApplicationController < ActionController::Base
    # def authorize_page
    #     redirect_to new_session_path unless logged_in?
    # end
    before_action :authorized?

    def find_current_user
      @current_user = User.find_by(id: session[:user_id])
    end 
  
    def authorized? 
      # code unless condition
      redirect_to new_session_path unless find_current_user
    end 
end
