class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.string :name
      t.text :description
      t.string :share

      t.timestamps
    end
  end
end
