class AddUserReferenceToYears < ActiveRecord::Migration[5.2]
  def change
    add_reference :years, :user, foreign_key: true
  end
end
