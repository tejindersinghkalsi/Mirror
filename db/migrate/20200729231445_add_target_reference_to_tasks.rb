class AddTargetReferenceToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :target, foreign_key: true
  end
end
