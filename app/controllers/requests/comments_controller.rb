class Requests::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @request = Request.find(params[:request_id])
    @comment = @request.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      @comment.create_activity :create, owner: current_user
      redirect_to request_path(@request, anchor: "comment_#{@comment.id}")
    else
      redirect_to @request, alert: "Unable to save comment"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
