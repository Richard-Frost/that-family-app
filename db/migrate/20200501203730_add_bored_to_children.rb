class AddBoredToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :bored, :boolean, :default => false
  end
end
