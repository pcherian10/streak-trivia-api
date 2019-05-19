class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.integer :answer
      t.integer :right_answer

      t.timestamps
    end
  end
end
