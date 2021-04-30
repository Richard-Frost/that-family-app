class AddOmniuserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :omniuser, :boolean, :default => false
  
  end
end
