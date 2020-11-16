class AddLinkToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :Link, :string
  end
end
