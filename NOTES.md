*** password reset *** 

link on login page - 

sessions/new

new_password_reset_path -

password_resets/new - form - email - password_resets_path 


PasswordResetsController#create -user.send_password_reset


def create 
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to '/login', :alert => "Email sent with password reset instructions."
  end






User.rb
def send_password_reset
  	self.password_reset_token = SecureRandom.urlsafe_base64
    #self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver!
end


password_resets_path, :method => :post



<meta HTTP-EQUIV="REFRESH" content="3; url=http://localhost:3000/home">


omniauth login 


login - 

login or sign up with Twitter link 



