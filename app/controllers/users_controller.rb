class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update]
    # skip_before_action :authorized?, only: [:new, :create]
  
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        # added validation 
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end

    end

    def edit
        @user = @current_user
    end

    def update
        @current_user.update(user_params)

        # added validation 
        if @user.valid?
            redirect_to user_path(@current_user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_userr_path(@current_user)
        end

    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :date_of_birth, :bio, :city, :image)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
