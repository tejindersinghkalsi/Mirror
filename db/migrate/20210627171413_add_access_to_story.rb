class AddAccessToStory < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :access, :string, default: "PUBLIC"
  end
end
