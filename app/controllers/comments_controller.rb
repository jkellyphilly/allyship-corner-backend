class CommentsController < ApplicationController

  def create
    new_comment = Comment.create(comment_params)

    # If the new comment is not valid, send the first error message
    # back in the response with a key of :message
    if new_comment.valid?
      render json: CommentSerializer.new(new_comment), status: :created
    else
      render json: { message: new_comment.errors.full_messages[0] }, status: :not_acceptable
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :event_id, :user_id)
  end
end
