class AddScheduleToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :schedule, :date
  end
end
