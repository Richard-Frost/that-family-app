class Family < ApplicationRecord
	
	has_many :children
	has_many :users

	accepts_nested_attributes_for :users
  accepts_nested_attributes_for :children

end
