class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.integer :family_id
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end
