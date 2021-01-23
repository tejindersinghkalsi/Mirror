class AddStToItenary < ActiveRecord::Migration[5.2]
  def change
    add_column :itenaries, :st, :string
  end
end
