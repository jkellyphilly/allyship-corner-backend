class CommentsController < ApplicationController

  def create
    new_comment = Comment.create(comment_params)
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
