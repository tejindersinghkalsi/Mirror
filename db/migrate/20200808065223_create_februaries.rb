class CreateFebruaries < ActiveRecord::Migration[5.2]
  def change
    create_table :februaries do |t|
      t.date :occourance
      t.text :name
      t.text :reason
      t.integer :cost

      t.timestamps
    end
  end
end
