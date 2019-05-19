class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :first_choice
      t.string :second_choice
      t.string :third_choice
      t.integer :correct_answer

      t.timestamps
    end
  end
end
