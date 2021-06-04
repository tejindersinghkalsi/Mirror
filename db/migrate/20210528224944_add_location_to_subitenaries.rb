class AddLocationToSubitenaries < ActiveRecord::Migration[5.2]
  def change
    add_column :subitenaries, :location, :string
  end
end
