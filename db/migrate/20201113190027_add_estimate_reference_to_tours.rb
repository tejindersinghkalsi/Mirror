class AddEstimateReferenceToTours < ActiveRecord::Migration[5.2]
  def change
    add_reference :tours, :estimate, foreign_key: true
  end
end
