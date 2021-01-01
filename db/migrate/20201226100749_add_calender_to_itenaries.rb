class AddCalenderToItenaries < ActiveRecord::Migration[5.2]
  def change
    add_column :itenaries, :calender, :string
  end
end
