class UsersController < ApplicationController

	before_action :logged_in?
	skip_before_action :my_children, :only => [:new, :create, :update]

	def home
	end

	def new
		@user = User.new
  end

    def create
    end

	def edit
		@user = current_user
	end

	def update
	  @user = User.find_by_id(params[:id])
  	  current_user.update(user_params)
	  omni_redirect
  	  redirect_to "/home"
	end

	private

	def user_params
	  params.require(:user).permit(:first_name, :last_name, :password, :email, :title)
	end

end
