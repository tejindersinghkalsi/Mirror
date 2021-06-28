class RenameLattitudeToLatitude < ActiveRecord::Migration[5.2]
  def change
  	rename_column :itenaries, :lattitude, :latitude
  end
end
