class AddHeadingimgToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :headingimg, :string
  end
end
