class CommentsController < ApplicationController

  def create
    binding.pry
    new_comment = Comment.create(comment_params)
    binding.pry
    render json: new_comment
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
    params.require(:comment).permit(:content, :username, :event_id)
  end
end
