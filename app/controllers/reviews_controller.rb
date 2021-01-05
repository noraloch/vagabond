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

        #added validation
        #changed redirect to reviews to redirect to current user review path 
        if @review.valid?
            redirect_to review_path(@current_user)
          else 
            flash[:errors] = @review.errors.full_messages
            redirect_to new_review_path
          end 

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
