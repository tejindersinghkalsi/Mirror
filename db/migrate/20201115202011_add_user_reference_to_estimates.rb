class AddUserReferenceToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_reference :estimates, :user, foreign_key: true
  end
end
