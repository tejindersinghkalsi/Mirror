class AddRelatedToItenaries < ActiveRecord::Migration[5.2]
  def change
    add_column :itenaries, :related, :integer
  end
end
