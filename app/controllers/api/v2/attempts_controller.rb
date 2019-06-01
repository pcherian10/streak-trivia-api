class Api::V2::AttemptsController < ApplicationController

    before_action :set_user, only:[:create]

    def create
        @attempt = Attempt.new(attempt_params)

        if(@attempt.right_answer == nil)
            correct_answer_code = @attempt.question.correct_answer == @attempt.answer ? 4 : @attempt.question.correct_answer
            @attempt.right_answer = correct_answer_code
        end

        if @attempt.valid?
            @attempt.save

            streak_count = Attempt.current_streak(@user)
            puts "streak_count: #{streak_count}"
            date = Time.now.strftime("%d/%m/%Y %H:%M")
            @streak = Streak.new(user_id: params[:user_id], date: date, streak_count: streak_count)
            
            if @streak.valid?
                puts "streak is valid: #{@streak}"
                @streak.save
            end 

            #@longest_streak = Streak.longest_streak
            render json: { 'correct_answer': @attempt.right_answer, 'current_streak': @streak.streak_count}
        else
            render json: { 'error': "Something went wrong"}
        end
    end

    private

    def set_user
        @user = User.find_by(id: params[:user_id])
    end

    def attempt_params
        params.require(:attempt)
        .permit(
            :user_id, 
            :question_id,
            :answer,
            :right_answer
        )
    end


end