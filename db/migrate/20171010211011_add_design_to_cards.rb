class AddDesignToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :design, :string
  end
end
