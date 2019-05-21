class Api::V2::UsersController < ApplicationController

    before_action :set_user, only: [:show, :update, :destroy]
  
    def index
      @users = User.all
      render json:@users
    end
 
    def show
      @user = User.find(params[:id])
      render json: @user
    end
  
    def create
     @user = User.new(user_params)
      if @user.valid?
        @user.save
        render json: @user
      else
        render json: {errors:"Could not create user."}
      end
    end
  
    def update
      @user.update(user_params)
      if @user.valid?
        @user.save
        render json: @user
      else
        render json: {errors: "Could not update user."}
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end
  
    private
  
    def set_user
      @user = User.find_by(id: params[:id])
    end
  
    def user_params
      params.require(:user)
      .permit(
        :username,
        :email,
        :password
      )
    end
  
  
  end