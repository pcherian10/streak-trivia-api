class Api::V2::StatsController < ApplicationController

    before_action :set_user, only:[:index, :destroy, :show]

    def index
       @stats = Stat.all.sort_by{ |s| s.ranking }
       render json: @stats 
    end            
  
    def show
      render json: @user.stat
    end
  
    private
  
    def set_user
      @user = User.find_by(id: params[:user_id])
    end
  
    def stat_params
      params.require(:stat)
        .permit(
          :user_id,
          :longest_streak,
          :correct_overall, 
          :incorrect_overall, 
          :ranking)
    end

  

  end