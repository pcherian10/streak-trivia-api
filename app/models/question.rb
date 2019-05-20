class Question < ApplicationRecord
    has_many :users, through: :attempts 


    def self.select_question (user)
        # need to find the first question 
                # a) that's not created by the user
                # b) that's not attempted by the user 
                    # check if any attempt has both user and question
        self.all.find { |q| !user.attempts.questions.include?(q) && q.author_id != user.user_id }
    end


end




