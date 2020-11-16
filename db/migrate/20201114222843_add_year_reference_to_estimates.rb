class AddYearReferenceToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_reference :estimates, :year, foreign_key: true
  end
end
