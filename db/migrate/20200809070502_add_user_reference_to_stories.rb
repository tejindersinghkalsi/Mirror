class AddUserReferenceToStories < ActiveRecord::Migration[5.2]
  def change
    add_reference :stories, :user, foreign_key: true
  end
end
