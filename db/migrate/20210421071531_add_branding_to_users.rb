class AddBrandingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :branding, :string, default: "MIRROR"
  end
end
