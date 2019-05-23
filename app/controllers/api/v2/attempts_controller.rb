class Api::V2::AttemptsController < ApplicationController

    def create
        @attempt = Attempt.new(attempt_params)
        if(@attempt.right_answer == nil)
            @attempt.right_answer = @attempt.question.correct_answer == @attempt.answer ? 1 : 0;
        end
        if @attempt.valid?
            @attempt.save
        else
            render json: {errors: "Something went wrong"}
        end
    end

    private

    def attempt_params
        params.require(:attempt)
        .permit(
            :user_id, 
            :question_id,
            :answer,
        )
    end


end