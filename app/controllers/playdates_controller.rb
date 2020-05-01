class PlaydatesController < ApplicationController

  #before_action :require_login

  def new 
    @playdate = Playdate.new
    @family = current_user.family
  end

  def create 
    @playdate = Playdate.new(playdate_params)
    @playdate.save
    redirect_to playdate_path(@playdate)
  end

  def show
  	@playdate = Playdate.find(params[:id])
    @originator = User.find(@playdate.originator)
    @family = current_user.family
  end

  def index
    @playdates = Playdate.all
  end

  def edit
  	@playdate = Playdate.find(params[:id])
  	@family = current_user.family
  end

  def update 
    @playdate = Playdate.find(params[:id])
    @playdate.update(playdate_params)
    redirect_to playdate_path(@playdate.id)
  end

  def join
   add_participants(params)
   redirect_to playdates_path
  end


  private

  def playdate_params
    params.require(:playdate).permit(:playdate_title, :datetime, :location, :description, :originator, child_ids:[])
  end

   def add_participants(params)
   	
   	params[:playdate][:child_ids].each do |child_id|
   		Participant.create(child_id: child_id, playdate_id: params[:playdate][:playdate_id]) if !child_id.empty?
   	end
   end


end