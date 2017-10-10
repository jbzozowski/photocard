class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :photo_data
      t.integer :number
      t.string :name
      t.string :position
      t.text :info

      t.timestamps
    end
  end
end
