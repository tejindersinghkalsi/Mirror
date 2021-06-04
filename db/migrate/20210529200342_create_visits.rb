class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.string :country
      t.text :description
      t.date :schedule

      t.timestamps
    end
  end
end
