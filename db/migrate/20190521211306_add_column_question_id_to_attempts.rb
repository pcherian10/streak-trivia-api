class AddColumnQuestionIdToAttempts < ActiveRecord::Migration[5.2]
  def change
    add_column :attempts, :question_id, :integer
  end
end
