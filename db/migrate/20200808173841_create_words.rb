class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :wordtitle
      t.text :meaning

      t.timestamps
    end
  end
end
