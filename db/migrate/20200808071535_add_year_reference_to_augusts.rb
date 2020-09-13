class AddYearReferenceToAugusts < ActiveRecord::Migration[5.2]
  def change
    add_reference :augusts, :year, foreign_key: true
  end
end
