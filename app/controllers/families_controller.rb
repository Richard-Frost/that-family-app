class FamiliesController < ApplicationController
 
 def new
	@family = Family.new
	@family.children.build
    @family.users.build
    @titles = ["Parent", "Grandparent", "Babysitter", "Nanny", "Other"]
  end

  def create
  	@family = Family.new(family_params)
  	@family.save
  	redirect_to families_path
  end

  def index
  	@families = Family.all
  end 


  private

  def family_params
    params.require(:family).permit(:email, :password,:name, :zipcode, users_attributes: [:first_name, :last_name, :email,:password, :family_title], children_attributes: [:first_name, :last_name, :age, :gender])
  end

 end
