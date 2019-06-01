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
        if attempts_array.length > 0
            attempts_array.reverse.each_with_index do |att, idx|
                    puts "attempt_id: #{att.question.id} and attempt_right_answer: #{att.right_answer}"
                        if att.right_answer == 4
                            streak_count += 1
                        else
                        puts "STREAK_COUNT RETURN OF streak_count in block"
                            return streak_count
                        end
                end
        else
           puts "STREAK_COUNT RETURN OF streak_count = 0"
           return streak_count = 0
        end
        puts "STREAK_COUNT AT END OF METHOD"
        streak_count
    end

    def self.correct_overrall

    end


    def self.incorrect_overrall

    end

    

end

