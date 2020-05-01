class Participant < ApplicationRecord
	belongs_to :child
	belongs_to :playdate

	accepts_nested_attributes_for :playdate
end




#comments - playdate_id - user_id - 