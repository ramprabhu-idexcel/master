class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.text :question
      t.string :answer
      t.string :type
      t.string :question_name
      t.string :option

      t.timestamps
    end
  end
end
