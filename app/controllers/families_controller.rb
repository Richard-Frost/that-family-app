class FamiliesController < ApplicationController

  before_action :logged_in?, :only => [:new, :create, :omniauth_new]
  skip_before_action :my_children, :only => [:new, :create, :omniauth_new]

  def new
    @family = Family.new
    @family.children.build
    @family.users.build
    @titles = ["Parent", "Grandparent", "Babysitter", "Nanny", "Other"]
  end

  def create
    @family = Family.new(family_params)
    @family.email = current_user.email
    binding.pry
    @family.save
    if @family.errors.any?
       render :new 
    else
      session[:user_id] = @family.users.last.id unless current_user
      omnifamuser if current_user.family_id == nil
      omni_redirect and return if omniuser?
  	  redirect_to "/home"
    end
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

  def omniuser?
    current_user.omniuser == true
  end
    
 end


 #current_user.build_family(family_params).save
 #@family = current_user.build_family(family_params)