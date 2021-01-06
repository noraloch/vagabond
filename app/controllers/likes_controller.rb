class LikesController < ApplicationController
    before_action :find_review
    def create
        # if already_liked?
        #     flash[:errors] = "You've already liked this once."
        # else
        # byebug
            # @review.likes << Like.create(user_id: @current_user.id)

            @like = Like.new(user_id: @current_user.id, review_id: @review.id)

            if @like.save
                redirect_to review_path(@review)
            else
                flash[:errors] = "You have already liked this review"
                redirect_to review_path(@review)
            end 
            
        # end
    end

    private

    def find_review
        @review = Review.find(params[:review_id])
    end

    # def already_liked?
    #     Like.where(user_id: @current_user.id, review_id: params[:review_id]).exists?
    # end
end