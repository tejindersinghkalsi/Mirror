class AddDocToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :doc, :string
  end
end
