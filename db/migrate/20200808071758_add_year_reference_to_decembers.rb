class AddYearReferenceToDecembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :decembers, :year, foreign_key: true
  end
end
