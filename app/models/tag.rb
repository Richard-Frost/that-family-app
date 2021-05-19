class Tag < ApplicationRecord
    has_many :family_tags, dependent: :delete_all
    has_many :families, through: :family_tags
    accepts_nested_attributes_for :family_tags
end
