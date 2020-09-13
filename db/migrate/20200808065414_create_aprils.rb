class CreateAprils < ActiveRecord::Migration[5.2]
  def change
    create_table :aprils do |t|
      t.date :occourance
      t.text :name
      t.text :reason
      t.integer :cost

      t.timestamps
    end
  end
end
