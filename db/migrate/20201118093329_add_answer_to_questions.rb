class AddAnswerToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :Answer, :text
  end
end
