class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @manual = Manual.find(params[:manual_id])
    @comment = @manual.comments.create(params[:comment].permit(:body))
    @comment.user = current_user
    @comment.save

    redirect_to manual_path(@manual)
  end

  def destroy
    @manual = Manual.find(params[:manual_id])
    @comment = @manual.comments.find(params[:id])
    @comment.destroy

    redirect_to manual_path(@manual)
  end
end
