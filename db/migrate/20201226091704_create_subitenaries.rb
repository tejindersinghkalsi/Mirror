class CreateSubitenaries < ActiveRecord::Migration[5.2]
  def change
    create_table :subitenaries do |t|
      t.date :begin
      t.text :activity
      t.string :modeoftravel
      t.integer :distance
      t.integer :stay

      t.timestamps
    end
  end
end
