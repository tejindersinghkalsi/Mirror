class AddYearReferenceToFebruaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :februaries, :year, foreign_key: true
  end
end
