class FamiliesController < ApplicationController

  before_action :logged_in?
  skip_before_action :my_children, :only => [:new, :create, :omniauth_new]

  def new
    @family = Family.new
    @family.children.build
    @family.users.build
    @titles = ["Parent", "Grandparent", "Babysitter", "Nanny", "Other"]
  end

  def create
    @family = Family.create(family_params)
    binding.pry
    #@family = current_user.build_family(family_params)
    omnifamuser if current_user.omniuser
    omni_redirect and return if current_user.omniuser
  	redirect_to "/home"
  end

  def omniauth_new
    @user = User.find_by(id: session[:user_id])
    @family = Family.new
    @child = Child.new
    @titles = ["Parent", "Grandparent", "Babysitter", "Nanny", "Other"]
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

  def omnifamuser
    current_user.family_id = @family.id
    current_user.save
  end

    
 end


 #current_user.build_family(family_params).save