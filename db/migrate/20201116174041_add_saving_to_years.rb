class AddSavingToYears < ActiveRecord::Migration[5.2]
  def change
    add_column :years, :Saving, :integer
  end
end
