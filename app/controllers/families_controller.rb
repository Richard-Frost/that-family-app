class FamiliesController < ApplicationController

  skip_before_action :my_children, :only => [:new, :create]

 
  def new
    @family = Family.new
    @family.children.build
    @family.users.build
    @titles = ["Parent", "Grandparent", "Babysitter", "Nanny", "Other"]
  end

  def create
  	@family = Family.new(family_params)
    @family.users.last.parent = true if params[:family][:users_attributes]["0"][:title] == "Parent"
  	@family.save
    session[:user_id] = @family.users.last.id
    binding.pry
  	redirect_to "/home"
  end

  def index
  	@families = Family.all
  end 

  def show
    @family = Family.find(params[:id])
    @request = Request.new
  end

  def edit
    @family = my_family
  end

  private

  def geo
    Geocoder.search(11215).first
  end

  def family_params
    params.require(:family).permit(:email, :password, :family_title, :zipcode, users_attributes: [:first_name, :last_name, :email,:password, :title], children_attributes: [:first_name, :last_name, :age, :gender]).merge(latitude: geo.latitude, longitude: geo.longitude)
  end

  def parent
    user = @family.users.last
    user.parent == true if params[:family][:users_attributes]["0"][:title] == "Parent"
    user.save
  end

 end
