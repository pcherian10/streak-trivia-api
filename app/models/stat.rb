class Stat < ApplicationRecord
    belongs_to :user


    def self.user_ranking (streak)
        new_ranked_streaks = Streak.ranked_streak
        return new_ranked_streaks.index(streak.streak_count) + 1
    end

    def self.create_or_update_user_stat_entry(user)
        longest_streak = Streak.find_user_longest_streak (user)
        correct_overall = user.attempts.select{|a| a.right_answer == 4 }.length
        incorrect_overall = user.attempts.select{|a| a.right_answer != 4 }.length
        ranking = Stat.user_ranking(longest_streak)

        if !user.stat
            @stat = Stat.new(user_id: user.id, longest_streak: longest_streak.streak_count, correct_overall: correct_overall, incorrect_overall: incorrect_overall, ranking: ranking)
            if @stat.valid?
                @stat.save
            end
        else
            user.stat.update_attributes(longest_streak: longest_streak.streak_count, correct_overall: correct_overall, incorrect_overall: incorrect_overall, ranking: ranking)   
        end

    end


end
