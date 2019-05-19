class CreateStreaks < ActiveRecord::Migration[5.2]
  def change
    create_table :streaks do |t|
      t.date :date
      t.integer :streak_count

      t.timestamps
    end
  end
end
