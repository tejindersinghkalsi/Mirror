class AddAttachmentToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :Attachment, :string
    add_column :stories, :string, :string
  end
end
