class TagsController < ApplicationController

  before_action :logged_in

  def new
    @family = Family.find_by(id: params[:family_id])
    @tag_name = Tag.tag_name
    @tag = Tag.new
    @familytag = FamilyTag.new
    @importance_level = ["1", "2", "3", "4", "5"]
  end

  def create
    if Tag.exists?(name: tag_params[:name])
      tag = Tag.find_by(name: tag_params[:name])
      FamilyTag.create(tag_id: tag.id, family_id:  my_family, importance_level: tag_params[:family_tags_attributes]["0"][:importance_level] )
    else 
      Tag.create(tag_params)
    end
    redirect_to '/home'
  end

  def index
    @family = Family.find_by(id: params[:family_id])
    @tags = @family.tags
  end

  def show
    @tag = Tag.find_by(id: params[:id])
  end
  
  def destroy
    current_user.family.tags.find(params[:id]).family_tags.destroy_all
    redirect_to '/settings'
  end
  
private 

  def tag_params
    params.require(:tag).permit(:name, :family_tags, family_tags_attributes: [:importance_level, :family_id])
  end
end