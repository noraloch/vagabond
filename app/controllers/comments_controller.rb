class CommentsController < ApplicationController
    before_action :find_review
    before_action :find_comment, only: :destroy
    def create
        @comment = @review.comments.create(params[:comment].permit(:content))
        @comment.user_id = @current_user.id
        # @comment.save
        if @comment.valid?
            @comment.save
            redirect_to review_path(@review)
        else
            flash[:errorz] = "You must write something!"
            redirect_to review_path(@review)
        end
    end

    def destroy
        @comment.destroy
        redirect_to review_path(@review)
    end

    private

    def find_review
        @review = Review.find(params[:review_id])
    end

    def find_comment
        @comment = @review.comments.find(params[:id])
    end

end
