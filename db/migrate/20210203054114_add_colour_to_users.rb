class AddColourToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :colour, :string, :default => "blue"
  end
end
