class AddColumnUserIdToStreaks < ActiveRecord::Migration[5.2]
  def change
    add_column :streaks, :user_id, :integer
  end
end
