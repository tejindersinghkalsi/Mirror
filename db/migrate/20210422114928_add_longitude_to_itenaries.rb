class AddLongitudeToItenaries < ActiveRecord::Migration[5.2]
  def change
    add_column :itenaries, :longitude, :decimal
  end
end
