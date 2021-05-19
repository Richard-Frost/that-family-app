class OmniauthCallbacksController < ApplicationController
   
  def twitter
    @user = User.find_or_create_by(email: auth_hash['info']['email'])
    if @user.family 
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      user_attributes 
      session[:user_id] = @user.id
      omni_redirect
    end
  end

  def omniuser
    @user = User.find_by(id: current_user.id)
  end

  def omnifamily
    @user = User.find_by(id: current_user.id)
    @family = Family.new
    @titles = ["Parent", "Grandparent", "Babysitter", "Nanny", "Other"]
  end

  def omnichild
    @user = User.find_by(id: current_user.id)
    @child = Child.new
  end
 
private

  def auth_hash
    request.env['omniauth.auth']
  end

  def split_name
    auth_hash['info']['name'].split()
  end 

  def user_attributes
    if @user.first_name == nil
       @user.first_name = split_name[0]
       @user.last_name = split_name[1]
       @user.password = SecureRandom.urlsafe_base64
       @user.omniuser = true
       @user.save!
    end
  end 
end

