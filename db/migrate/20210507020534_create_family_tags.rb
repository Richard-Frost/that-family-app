class CreateFamilyTags < ActiveRecord::Migration[5.2]
  def change
    create_table :family_tags do |t|
      t.integer :family_id
      t.integer :tag_id
      t.integer :importance_level

      t.timestamps
    end
  end
end

