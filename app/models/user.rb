class User < ApplicationRecord
	
	has_secure_password
	
	belongs_to :family
	has_many :comments


end
