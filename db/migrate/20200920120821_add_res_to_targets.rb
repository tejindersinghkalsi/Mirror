class AddResToTargets < ActiveRecord::Migration[5.2]
  def change
    add_column :targets, :res, :text, array: true, default: []
  end
end
