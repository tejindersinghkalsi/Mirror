class AddYearReferenceToJunes < ActiveRecord::Migration[5.2]
  def change
    add_reference :junes, :year, foreign_key: true
  end
end
