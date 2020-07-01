class CommentsController < ApplicationController

  def create
    new_comment = Comment.create(comment_params)
    render json: new_comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :username, :event_id)
  end
end
