class Tag < ApplicationRecord
    has_many :familytags
    has_many :families, through: :familytags
end
