class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :ques
      t.text :optionone
      t.text :optiontwo
      t.text :optionthree
      t.text :optionfour

      t.timestamps
    end
  end
end
