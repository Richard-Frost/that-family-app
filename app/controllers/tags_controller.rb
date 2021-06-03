class TagsController < ApplicationController

  before_action :logged_in

    def new
      @family = Family.find_by(id: params[:family_id])
      @tag = Tag.new
      @familytag = FamilyTag.new
      @importance_level = ["1", "2", "3", "4", "5"]
    end

    def create
      Tag.create(tag_params)
      redirect_to '/home'
    end

    def index
      @family = Family.find_by(id: params[:family_id])
      @tags = @family.tags
    end

    def destroy
      current_user.family.tags.find(params[:id]).family_tags.destroy_all
      redirect_to '/settings'
    end
   
private 

  def tag_params
    params.require(:tag).permit(:name, family_tags_attributes: [:importance_level, :family_id])
  end
end