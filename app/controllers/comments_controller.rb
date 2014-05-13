class CommentsController < ApplicationController

  def index

  end

  def create

    @comment = current_user.comments.new(comment_params)
    @comment.spot_id = params[:spot_id]

    if @comment.save
      redirect_to spot_url(@comment.spot_id)

    else
      render text: "nope"
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :spot_id, :content)
  end
end
