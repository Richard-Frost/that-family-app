class DropFamilytags < ActiveRecord::Migration[5.2]
  def change
    drop_table :familytags
  end
end
