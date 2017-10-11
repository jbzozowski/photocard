class AddDetailsToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :photo_data, :text
    add_column :cards, :number, :integer
    add_column :cards, :name, :string
    add_column :cards, :position, :string
    add_column :cards, :info, :text
  end
end
