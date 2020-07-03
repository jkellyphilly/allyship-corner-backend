class CommentsController < ApplicationController

  def create
    new_comment = Comment.create(comment_params)
    render json: CommentSerializer.new(new_comment)
  end

  def destroy
    binding.pry
    comment = Comment.find(params[:id])
    binding.pry
    comment.destroy
    binding.pry
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :event_id, :user_id)
  end
end
