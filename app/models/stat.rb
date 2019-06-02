class Stat < ApplicationRecord
    belongs_to :user


    def self.user_ranking (user_longest_streak)
        ranked_streaks = Stat.all.longest_streak.uniq.sort.reverse
        if ranked_streaks.include(user_longest_streak)
            return ranked_streaks.index(user_longest_streak) + 1
        end
        ranked_streaks.push(user_longest_streak)
        ranked_streaks.sort.reverse
        ranked_streaks.index(user_longest_streak) + 1
    end


end
