class CommentsController < ApplicationController

	def create
    Comment.create(comment_params)
    redirect_to playdate_path(params[:playdate_id])
  end 

  def edit
    @playdate = Playdate.find(params[:playdate_id])
    @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id 
    redirect_to playdate_path(params[:playdate_id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to playdate_path(params[:playdate_id])
  end

private

  def comment_params
    params.require(:comment).permit(:comment, :playdate_id, :user_id)
  end
end




