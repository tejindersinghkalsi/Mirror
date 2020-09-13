class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.string :name
      t.text :description
      t.date :begin
      t.date :end

      t.timestamps
    end
  end
end
