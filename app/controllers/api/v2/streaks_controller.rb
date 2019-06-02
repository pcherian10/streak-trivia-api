class Api::V2::StreaksController < ApplicationController

    before_action :set_user, only:[:index, :current_streak]

    def current_streak 
        if @user.streaks.length > 0
            last_streak_count = @user.streaks.last.streak_count
            puts "last_streak_count: #{last_streak_count}"
        else
            last_streak_count = 0
        end
        render json: { 'current_streak': last_streak_count}
    end

    def index
        @streaks = @user.streaks 
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
