class AddYearReferenceToSeptembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :septembers, :year, foreign_key: true
  end
end
