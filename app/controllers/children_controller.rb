class ChildrenController < ApplicationController

	def edit
  end

  def update
    @child = Child.find_by(id: params[:id])
    @child.update(child_params)
    redirect_to home_path
  end

  def show
    @child = Child.find(params[:id])
    @messages = @child.messages
  end

  def message
    @child = Child.find(params[:child_id])
    @message = Message.new(message_params)
    @message.save
    redirect_to child_path(@child)
  end


  private

  def child_params
    params.require(:child).permit(:bored)
  end

  def message_params
    params.permit(:message, :child_id, :user_id, created_at: DateTime.now)
  end



end

	