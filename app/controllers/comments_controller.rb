class CommentsController < ApplicationController

  def create
    new_comment = Comment.create(comment_params)
    render json: new_comment
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :username, :event_id)
  end
end
