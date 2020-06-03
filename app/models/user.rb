class User < ApplicationRecord
	
	has_secure_password
	
	belongs_to :family
	has_many :comments

def send_password_reset
    generate_token
    UserMailer.password_reset(self).deliver_now!
  end

  def generate_token
      self.password_reset_token = SecureRandom.urlsafe_base64
      self.save!
  end 
 

end
