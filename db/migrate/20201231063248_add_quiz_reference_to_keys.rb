class AddQuizReferenceToKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :keys, :quiz, foreign_key: true
  end
end
