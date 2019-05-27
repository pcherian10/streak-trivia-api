class Api::V2::StreaksController < ApplicationController

    before_action :set_user, only:[:index, :current_streak]

    def current_streak 
        last_streak_count = @user.streaks.last.streak_count
        render json: { 'current_streak': last_streak_count}
    end

    def index
        @streaks = @user.streaks.reverse()  
    end

    private

    def set_user
        @user = User.find_by(id: params[:user_id])
    end

    def streak_params
        params.require(:streak)
        .permit(
            :user_id,
            :streak_count,
            :date
        )

    end



end
