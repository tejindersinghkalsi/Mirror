class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.text :correctanswer

      t.timestamps
    end
  end
end
