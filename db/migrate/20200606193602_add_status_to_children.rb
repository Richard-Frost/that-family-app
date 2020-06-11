class AddStatusToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :status, :string
  end
end
