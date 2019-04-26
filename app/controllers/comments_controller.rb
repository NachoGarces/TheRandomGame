class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :tournament_id)
  end
end