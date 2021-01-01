class AddItenaryReferenceToSubitenaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :subitenaries, :itenary, foreign_key: true
  end
end
