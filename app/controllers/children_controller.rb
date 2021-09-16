class ChildrenController < ApplicationController

  before_action :logged_in

  def new
    @child = Child.new
  end

  def index
    @ordered_children = Child.all
  end


  def create
    @child = Child.new(child_params)
    @child.save
    redirect_to "/home"
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find_by(id: params[:id])
    @child.update(child_params)
    redirect_to home_path
  end

  def show
    @child = Child.find(params[:id])
  end

  def message
    @child = Child.find(params[:child_id])
    @message = Message.new(message_params)
    @message.save
    redirect_to child_path(@child)
  end

  private

  def child_params
    params.require(:child).permit(:bored, :status, :age, :gender, :first_name, :last_name).merge(family_id: current_user.family.id)
  end

  def message_params
    params.permit(:message, :child_id, :user_id, created_at: DateTime.now)
  end

end