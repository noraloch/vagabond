class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update]
    skip_before_action :authorized?, only: [:new, :create]
  
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to user_path
    end

    def edit
        @user = @current_user
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@current_user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :date_of_birth, :bio, :city, :profile_picture)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
