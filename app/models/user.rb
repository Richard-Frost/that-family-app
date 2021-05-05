class User < ApplicationRecord
	
	has_secure_password 
	belongs_to :family, optional: true
	has_many :comments

	#accepts_nested_attributes_for :family


  validates :email, uniqueness: true

def send_password_reset
    generate_token
    UserMailer.password_reset(self).deliver_now!
  end

  def generate_token
      self.password_reset_token = SecureRandom.urlsafe_base64
      self.save!
  end 
 
private

def password_required
  return true unless auth[hash] 
end
end
