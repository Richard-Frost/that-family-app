class TagsController < ApplicationController

    def new
      @family = Family.find_by(id: params[:family_id])
      @tag = Tag.new
      @familytag = FamilyTag.new
      @importance_level = ["1", "2", "3", "4", "5"]
    end

    def create
      current_user.family.tags.create(tag_params)
      binding.pry

      redirect_to '/home'
    end


private 

def tag_params
  params.require(:tag).permit(:name, family_tags_attributes: [:importance_level, :family_id])
end


end