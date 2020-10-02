class AddLeadToTargets < ActiveRecord::Migration[5.2]
  def change
    add_column :targets, :lead, :integer
  end
end
