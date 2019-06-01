class Streak < ApplicationRecord
    belongs_to :user

    def self.longest_streak
        return Streak.all.sort_by { |s| s.streak_count}.last
    end

    def self.top_five_streaks
        

    end

end
