class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.integer :namec
      t.integer :multiplier

      t.timestamps
    end
  end
end
