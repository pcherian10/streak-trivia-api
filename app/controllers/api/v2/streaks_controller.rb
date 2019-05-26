class Api::V2::StreaksController < ApplicationController

    before_action :set_user, only:[:create]

    def index
        
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
