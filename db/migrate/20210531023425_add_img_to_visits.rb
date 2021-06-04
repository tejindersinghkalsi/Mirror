class AddImgToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :img, :string
  end
end
