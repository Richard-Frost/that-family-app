class UsersController < ApplicationController

  before_action :logged_in, except: [:new, :create]

  def home
	end

	def new
		@user = User.new
		@family = Family.new
  	end

  def create
	  @user = User.new(user_params)
	  @family = Family.find_by(email: params[:user][:family][:email]).try(:authenticate, params[:user][:family][:password])
	  @user.family_id = @family.id if @family
	  @user.save
	  if @user.errors.any?
		  render :new 
	  else
	    session[:user_id] = @user.id
      redirect_to "/home"
	  end
  end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
	  @user = User.find_by_id(params[:id])
  	@user.update(user_params)
	  if @user.omniuser == true
	  	omni_redirect unless user_complete
	  end
	  redirect_to "/home"
	end
	
	private
	
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :password, :email, :title, family_attributes: [:password, :email])
	end
end


