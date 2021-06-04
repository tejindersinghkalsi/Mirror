class AddUserReferenceToVisits < ActiveRecord::Migration[5.2]
  def change
    add_reference :visits, :user, foreign_key: true
  end
end
