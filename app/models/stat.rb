class Stat < ApplicationRecord
    belongs_to :user


    def self.user_ranking (streak)
        ranked_streaks = Stat.all.select {|s| s.user_id != streak.user.id}
        ranked_streaks = ranked_streaks.map{ |s| s.longest_streak }
        #list of all unique streak counts in descending order.
        if ranked_streaks.include?(streak.streak_count)
            return ranked_streaks.index(streak.streak_count) + 1
        end
        ranked_streaks.push(streak.streak_count)
        ranked_streaks.sort.reverse
        ranked_streaks.index(streak.streak_count) + 1
    end

    def self.create_or_update_user_stat_entry(user)
        longest_streak = Streak.find_user_longest_streak (user)
        correct_overall = user.attempts.select{|a| a.right_answer == 4 }.length
        incorrect_overall = user.attempts.select{|a| a.right_answer != 4 }.length
        ranking = Stat.user_ranking(longest_streak)

        if !user.stat
            @stat = Stat.new(user_id: user.id, longest_streak: longest_streak, correct_overall: correct_overall, incorrect_overall: incorrect_overall, ranking: ranking)
            if @stat.valid?
                @stat.save
            end
        else
            user.stat.update_attributes(longest_streak: longest_streak, correct_overall: correct_overall, incorrect_overall: incorrect_overall, ranking: ranking)   
        end

    end


end
