class User < ApplicationRecord
	
	has_secure_password 

	belongs_to :family, optional: true
	has_many :comments

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_uniqueness_of :email

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
