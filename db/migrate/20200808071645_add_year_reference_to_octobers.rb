class AddYearReferenceToOctobers < ActiveRecord::Migration[5.2]
  def change
    add_reference :octobers, :year, foreign_key: true
  end
end
