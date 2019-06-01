class Api::V2::StatsController < ApplicationController

    before_action :set_user, only:[:index, :create, :question, :destroy]

    def index
      
    end
  
    def create
      
    end
  
    def destroy
      
    end
  
    private
  
    def set_user
      @user = User.find_by(id: params[:user_id])
    end
  
    def question_params
      params.require(:question)
        .permit(
          :user_id,
          :longest_streak,
          :correct_overall, 
          :incorrect_overall, 
          :ranking)
    end

  

  end