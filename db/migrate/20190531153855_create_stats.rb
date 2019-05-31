class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :longest_streak
      t.integer :correct_overall
      t.integer :incorrect_overall
      t.integer :ranking
      t.integer :user_id
      t.timestamps
    end
  end
end
