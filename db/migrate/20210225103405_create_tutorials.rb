class CreateTutorials < ActiveRecord::Migration[5.2]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :description
      t.text :area
      t.string :doc
      t.text :command
      t.string :name
      t.text :function

      t.timestamps
    end
  end
end
