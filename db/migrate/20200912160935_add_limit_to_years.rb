class AddLimitToYears < ActiveRecord::Migration[5.2]
  def change
    add_column :years, :limit, :integer
  end
end
