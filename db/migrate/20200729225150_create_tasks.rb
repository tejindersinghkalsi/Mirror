class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :dateofcompletion
      t.integer :point
      t.integer :progress

      t.timestamps
    end
  end
end
