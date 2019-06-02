class Api::V2::StatsController < ApplicationController

    before_action :set_user, only:[:index, :create, :destroy, :show]

    def index
       @stats = Stat.all.sort_by{ |s| s.ranking }.reverse
       render json: @stats
    end            
  
    def create
        longest_streak = Streak.find_user_longest_streak (@user) 
        correct_overall = @user.attempts.select{|a| a.right_answer == 4 }.length
        incorrect_overall = @user.attempts.select{|a| a.right_answer != 4 }.length
        ranking = Stat.user_ranking(user_longest_streak)
        @stat = Stat.new(stat_params)
        if @stat.valid?
          @stat.save
          render json: @stat
        else
          render json: {message: 'The stats could not be created.'}
        end
    end

    def update
        longest_streak = Streak.find_user_longest_streak (@user)
        correct_overall = @user.attempts.select{|a| a.right_answer == 4 }.length
        incorrect_overall = @user.attempts.select{|a| a.right_answer != 4 }.length
        ranking = Stat.user_ranking(longest_streak)
        @stat = Stat.update(stat_params)
        if @stat.valid?
          @stat.save
          render json: @stat
        else
          render json: {message: 'The stats could not be updated.'}
        end
    end

    def show
      @stat = @user.stat
      render json: @stat
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