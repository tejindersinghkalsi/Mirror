class CreateItenaries < ActiveRecord::Migration[5.2]
  def change
    create_table :itenaries do |t|
      t.date :start
      t.string :planname

      t.timestamps
    end
  end
end
