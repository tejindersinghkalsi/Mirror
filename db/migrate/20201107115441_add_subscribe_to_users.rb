class AddSubscribeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscribe, :string
  end
end
