class AddMemberToTargets < ActiveRecord::Migration[5.2]
  def change
    add_column :targets, :member, :integer, array: true, default: []
  end
end
