class AddDnameToBookmark < ActiveRecord::Migration[5.2]
  def change
    add_column :bookmarks, :dname, :string
  end
end
