class CreateResearches < ActiveRecord::Migration[5.2]
  def change
    create_table :researches do |t|
      t.text :mainheading
      t.text :subheading
      t.date :contributed
      t.text :body

      t.timestamps
    end
  end
end
