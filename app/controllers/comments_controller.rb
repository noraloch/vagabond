class CommentsController < ApplicationController
    before_action :find_review
    before_action :find_comment, only: :destroy


    def create
        # @comment = Comment.new(user_id: @current_user.id, review_id: @review.id,  )
        @comment = @review.comments.create(params[:comment].permit(:content))
        @comment.user_id = @current_user.id
        @comment.save
        if @comment.valid?
            @comment.save
            redirect_to review_path(@review)
        else
            flash[:error] = "Comment cannot be empty!"
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

    # def comment_params
    #     params.require(:comment).permit(:content)
    # end

end
