class LikesController < ApplicationController
    before_action :find_review
    def create
        if already_liked?
            flash[:errors] = "You've already liked this once."
        else
            @review.likes.create(user_id: current_user.id)
        end
        redirect_to review_path(@review)
    end

    private

    def find_review
        @review = Review.find(params[:review_id])
    end

    def already_liked?
        Like.where(user_id: @current_user.id, review_id: params[:review_id]).exists?
    end
end