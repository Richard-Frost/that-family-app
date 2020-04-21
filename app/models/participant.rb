class Participant < ApplicationRecord
	belongs_to :child
	belongs_to :playdate
end
	