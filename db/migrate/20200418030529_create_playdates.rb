class CreatePlaydates < ActiveRecord::Migration[5.2]
  def change
    create_table :playdates do |t|
      t.string :playdate_title
      t.string :location
      t.string :description
      t.datetime :datetime
      t.integer :originator
      t.integer :zipcode

      t.timestamps
    end
  end
end
