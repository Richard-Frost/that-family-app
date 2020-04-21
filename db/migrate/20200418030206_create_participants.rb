class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.integer :child_id
      t.integer :playdate_id

      t.timestamps
    end
  end
end
