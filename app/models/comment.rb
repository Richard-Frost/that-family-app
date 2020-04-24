class Comment < ApplicationRecord
	belongs_to :playdate
	belongs_to :user
end
