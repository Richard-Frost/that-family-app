class RenameFamilytagsToFamilyTags < ActiveRecord::Migration[5.2]
  def change
    def change
      rename_table :familytags, :family_tags
    end
  end
end
