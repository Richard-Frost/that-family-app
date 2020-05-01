class Family < ApplicationRecord

	has_many :children
	has_many :users

	has_many :requests
	has_many :family_connections
  has_many :famconnects, through: :family_connections


	accepts_nested_attributes_for :users
  accepts_nested_attributes_for :children
end
