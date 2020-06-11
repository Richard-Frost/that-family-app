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





/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 * Any CSS and SCSS file within this directory, lib/assets/stylesheets, or any plugin's
 * vendor/assets/stylesheets directory can be referenced here using a relative path.
 *
 * You're free to add application-wide styles to this file and they'll appear at the bottom of the
 * compiled file so the styles you add here take precedence over styles defined in any other CSS/SCSS
 * files in this directory. Styles in this file should be added after the last require_* statement.
 * It is generally better to create a new file per style scope.
 *
*= require flatpickr
 */

@import "bootstrap";


.content {
	background-color: white;
  float: none; 
  padding-top: none;
  padding-bottom: 1%;
  margin-bottom: 1%;
  overflow-x: hidden; 
  -moz-box-shadow: 0 0 10px rgba(0,0,0,.9);
  
}

.right a { 
	float: right;
}

.title {
	background-color: #e6ffe6;
	margin-top: 5px;
	
}



hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #ccc;
    margin: 1em 0;
    padding: 0;
}

.navbar {
	background-color: #9be881 !important;
	border-color: white !important;
}
.navbar-brand {
	color: #00a18a !important;
}

.nav-link {
  color: white !important;
}

p {
    margin: 1;
    padding: 1;
    margin-bottom: 1px;
}

b {
	color :#0FE1F5;
}

.small-left{
  font-size: 60%;
}
.comment {
  line-height: 85%;
}

.comment2 {
  background-color: #e6ffe6;
  padding-top: 10px;
  padding-bottom: 10px;
  border-radius: 10px;
  }

.comment a {
  color: green;
}

.participants {
  background-color: #ccffff;
  border-radius: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
  width: 20%;
  text-align: center;
}

.participants a {
color: purple;
  
}

@media (min-width: 992px) { 

.container {
  width: 50%;
  min-height: 100vh;
  height: 100%;
  
  padding: 0 !important;
  margin-right: none !important;
  margin-left: none !important;
  
}

.background {
	background-color: #cbdbca;
	min-height: 100vh;
  height: 100%;
}


}




<meta HTTP-EQUIV="REFRESH" content="3; url=http://localhost:3000/home">

