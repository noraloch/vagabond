class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
    end

    def new
        @review = Review.new
        @users = User.all
        @places = Place.all
    end

    def create
        @review = @current_user.reviews.create(review_params)
        redirect_to @reviews
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to @reviews
    end
    
    private

    def review_params
        params.require(:review).permit(:user_id, :place_id, :photo)
    end

end
