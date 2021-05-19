class Participant < ApplicationRecord
	belongs_to :child
	belongs_to :playdate
	validates :child_id, uniqueness: { scope: :playdate_id }
end