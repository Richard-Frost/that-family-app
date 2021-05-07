class FamilyConnection < ApplicationRecord
	belongs_to :family
	belongs_to :famconnect, class_name: "Family"
end



#family
#has_many :family_connections
#has_many :famconnects, through: :family_connections


#Family connection - join table stores "family_id" & "famconnect_id"

