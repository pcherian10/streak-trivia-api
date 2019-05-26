class Attempt < ApplicationRecord
    belongs_to :user
    belongs_to :question


    def self.current_streak (user)
        attempts_array = user.attempts
        streak_count = 0
        # 4 is the chosen code of the correct_answer
        #find all user's attempts, 
        #reverse them, 
        #and count the number of the right_answer column in a row, until there's not a 4 as value
        attempts_array.reverse.each_with_index do |att, idx|
                if att.right_answer == 4
                    if attempts_array[idx + 1].right_answer && attempts_array[idx + 1].right_answer == 4
                        streak_count += 1
                    end
                else
                    return streak_count
                end
            end
        streak_count
    end
    



end

