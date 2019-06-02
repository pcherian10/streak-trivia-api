class Streak < ApplicationRecord
    belongs_to :user

    def self.find_user_longest_streak (user)
        longest_streak = user.streaks.sort_by { |s| s.streak_count }.reverse.first
    end


end
