class Tag < ApplicationRecord

    scope :tag_name, -> {order(name: :asc)}

    has_many :family_tags, dependent: :delete_all
    has_many :families, through: :family_tags
    accepts_nested_attributes_for :family_tags

    validates_uniqueness_of :name
    
    

end
