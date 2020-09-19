class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.date :date
      t.integer :uipoints
      t.integer :usability
      t.integer :improvement
      t.text :comments
      t.text :addfeatures

      t.timestamps
    end
  end
end
