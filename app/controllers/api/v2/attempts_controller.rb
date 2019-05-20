class Api::V2::AttemptsController < ApplicationController

    def create
        @attempt = Attempt.new(attempt_params)
        if @attempt.valid?
            @attempt.save
        else
            render json: {errors: "Something went wrong"}
        end
    end


    def attempt_params
        params.require(:attempt)
        .permit(
            :user_id, 
            :question_id,
            :answer,
        )
    end


end