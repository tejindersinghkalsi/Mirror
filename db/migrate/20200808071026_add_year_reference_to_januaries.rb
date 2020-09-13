class AddYearReferenceToJanuaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :januaries, :year, foreign_key: true
  end
end
