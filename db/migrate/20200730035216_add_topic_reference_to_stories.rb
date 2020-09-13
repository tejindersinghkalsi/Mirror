class AddTopicReferenceToStories < ActiveRecord::Migration[5.2]
  def change
    add_reference :stories, :topic, foreign_key: true
  end
end
