class AddLattitudeToItenaries < ActiveRecord::Migration[5.2]
  def change
    add_column :itenaries, :lattitude, :decimal
  end
end
