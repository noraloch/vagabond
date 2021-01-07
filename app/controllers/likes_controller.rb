class LikesController < ApplicationController
    before_action :find_review
    def create
        @like = Like.new(user_id: @current_user.id, review_id: @review.id)
            if @like.save
                redirect_to review_path(@review)
            else
                flash[:errors] = "You have already liked this review"
                redirect_to review_path(@review)
            end 
    end

    private

    def find_review
        @review = Review.find(params[:review_id])
    end
end