class RenameColumnQuestionToQuestionTextInQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :question, :question_text
  end
end
