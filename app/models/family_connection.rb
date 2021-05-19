class FamilyConnection < ApplicationRecord
	belongs_to :family
	belongs_to :famconnect, class_name: "Family"
end



