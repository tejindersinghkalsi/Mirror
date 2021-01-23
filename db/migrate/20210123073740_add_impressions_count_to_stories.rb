class AddImpressionsCountToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :impressions_count, :integer, default: 0
  end
end
