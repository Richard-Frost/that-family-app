class Participant < ApplicationRecord
	belongs_to :child
	belongs_to :playdate
	accepts_nested_attributes_for :playdate
	validates :child_id, uniqueness: { scope: :playdate_id }
end




#comments - playdate_id - user_id - 