class AddEmailToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :email, :string
  end
end
