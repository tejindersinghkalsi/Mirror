class AddYearReferenceToMarches < ActiveRecord::Migration[5.2]
  def change
    add_reference :marches, :year, foreign_key: true
  end
end
