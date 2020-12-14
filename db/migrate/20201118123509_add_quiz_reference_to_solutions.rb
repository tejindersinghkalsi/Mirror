class AddQuizReferenceToSolutions < ActiveRecord::Migration[5.2]
  def change
    add_reference :solutions, :quiz, foreign_key: true
  end
end
