class ChangeAgeToBeDateInChildren < ActiveRecord::Migration[5.2]
  
  def change
    change_column :children, :age, :date
  end

end
