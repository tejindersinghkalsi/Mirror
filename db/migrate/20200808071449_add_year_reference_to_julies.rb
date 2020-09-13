class AddYearReferenceToJulies < ActiveRecord::Migration[5.2]
  def change
    add_reference :julies, :year, foreign_key: true
  end
end
