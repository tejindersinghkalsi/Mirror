class AddDocToTargets < ActiveRecord::Migration[5.2]
  def change
    add_column :targets, :doc, :string
  end
end
