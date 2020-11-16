class AddRecommendationToEstimate < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :Recommendation, :text
  end
end
