class AddSentToResearches < ActiveRecord::Migration[5.2]
  def change
    add_column :researches, :sent, :integer
  end
end
