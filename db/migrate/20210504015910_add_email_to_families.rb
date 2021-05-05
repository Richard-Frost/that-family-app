class AddEmailToFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :email, :string
  end
end
