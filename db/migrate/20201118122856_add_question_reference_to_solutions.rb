class AddQuestionReferenceToSolutions < ActiveRecord::Migration[5.2]
  def change
    add_reference :solutions, :question, foreign_key: true
  end
end
