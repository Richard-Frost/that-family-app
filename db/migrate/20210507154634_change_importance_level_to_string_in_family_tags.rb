class ChangeImportanceLevelToStringInFamilyTags < ActiveRecord::Migration[5.2]
  def change
    change_column :family_tags, :importance_level, :string
  end
end
