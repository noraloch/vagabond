class SessionsController < ApplicationController
    skip_before_action :authorized?, only: [:new, :create]
    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = "Username or Password is incorrect"
            redirect_to new_session_path
        end
    end
    
    def log_out
        session[:user_id] = nil
        redirect_to new_session_path
    end
end
