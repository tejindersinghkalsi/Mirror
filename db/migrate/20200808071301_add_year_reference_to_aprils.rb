class AddYearReferenceToAprils < ActiveRecord::Migration[5.2]
  def change
    add_reference :aprils, :year, foreign_key: true
  end
end
