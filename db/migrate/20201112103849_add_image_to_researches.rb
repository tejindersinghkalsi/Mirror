class AddImageToResearches < ActiveRecord::Migration[5.2]
  def change
    add_column :researches, :Image, :string
    add_column :researches, :string, :string
  end
end
