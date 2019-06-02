class Streak < ApplicationRecord
    belongs_to :user

    def self.find_user_longest_streak (user)
       if user.streaks.length > 0
            return user.streaks.select {|str| str.streak_count!= nil}.sort_by { |s| s.streak_count }.reverse.first
       end
    #    #create a streak of zero if the user has no streaks/ has not played a game
    #    date = Time.now.strftime("%d/%m/%Y %H:%M")
    #    @streak = Streak.create(user_id: user.id, date: date, streak_count: 0)
    end

    def self.ranked_streak
        ranked_streak=Array.new
        User.all.each do |user|
            ranked_streak.push(Streak.find_user_longest_streak(user).streak_count)
        end  
        ranked_streak = ranked_streak.uniq.sort.reverse
    end



end
