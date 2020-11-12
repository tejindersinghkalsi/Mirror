class AddImgToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :Img, :string
  end
end
