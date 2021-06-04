class AddHeadingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :heading, :string, default: "MY BUCKET LIST"
  end
end
