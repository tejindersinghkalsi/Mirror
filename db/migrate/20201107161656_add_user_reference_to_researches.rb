class AddUserReferenceToResearches < ActiveRecord::Migration[5.2]
  def change
    add_reference :researches, :user, foreign_key: true
  end
end
