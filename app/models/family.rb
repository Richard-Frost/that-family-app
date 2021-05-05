class Family < ApplicationRecord
 
	has_secure_password validations: false

	has_many :children
	has_many :users #, inverse_of: :user

	has_many :requests
	has_many :family_connections
  has_many :famconnects, through: :family_connections

  has_many :familytags
  has_many :tags, through: :familytags


	accepts_nested_attributes_for :users
  accepts_nested_attributes_for :children

  geocoded_by :zip_code
  after_validation :geocode

  
  def zip_code
    zipcode
  end
  
end
# Family has_many :children
# Child belongs_to :family

# Family has_many :users
# User belongs_to :family

# Family has_many :requests
# Request belongs_to :family

# Family has_many :family_connections
# FamilyConnection belongs_to :family

# Family has_many :famconnects, through: :family_connections
# FamilyConnection belongs_to :famconnect, class_name: "Family"

# Child has_many :participants
# Participant belongs_to :child
# Playdates has_many :participants
# Participant	belongs_to :playdate 

# Child has_many :playdates, through: :participants
# Playdates has_many :children, through: :participants

# Playdates has_many :comments
# User has_many :comments



