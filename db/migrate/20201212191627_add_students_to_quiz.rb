class AddStudentsToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :students, :integer, array: true, default: []
  end
end
