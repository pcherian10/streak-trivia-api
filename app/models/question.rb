class Question < ApplicationRecord
    has_many :attempts
    has_many :users, through: :attempts 

    def self.select_question (user)
        # need to find the first question 
                # a) that's not created by the user
                # b) that's not attempted by the user 
                    # check if any attempt has both user and question
        if user.questions
            self.all.find { |q| !user.questions.include?(q) && q.author_id != user.id } 
        else
            self.all.find { |q| q.author_id != user.id }
        end
    end

    


end




