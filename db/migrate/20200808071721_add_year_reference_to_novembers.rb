class AddYearReferenceToNovembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :novembers, :year, foreign_key: true
  end
end
