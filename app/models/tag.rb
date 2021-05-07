class Tag < ApplicationRecord
    has_many :family_tags
    has_many :families, through: :family_tags
    accepts_nested_attributes_for :family_tags
    
end
