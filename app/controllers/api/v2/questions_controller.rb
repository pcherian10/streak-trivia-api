class Api::V2::QuestionsController < ApplicationController

    before_action :set_user, only:[:index, :create, :question, :destroy]

    def index

    end

    def question #custom method created to return one question that meets specific criteria.
      @question = Question.select_question(@user)
      if @question
        render json: @question
      else 
        render json: {message: 'All questions have been attempted!'}
      end   
    end
  
    def create
      @question = Question.new(question_params)
      if @question.valid?
        @question.save
        render json: @question
      else
        #render json: {errors: @question.errors.full_messages}, status: 500
        render json: {errors:"uh oh can't create you"}
      end
    end
  
    def update
        @question = Question.find(params[:id])
        @question.update(question_params)
      if (@question.valid?)
          @question.save
        render json: @question
      else
        render json: {errors:"Couldn't update the question."}
      end
    end
  
  
    def destroy
      @question = Question.find(params[:id])
      @question.destroy
    end
  
    private
  
    def set_user
      @user = User.find_by(id: params[:user_id])
    end
  
    def question_params
      params.require(:question)
        .permit(
          :author_id, 
          :question, 
          :first_choice, 
          :second_choice,
          :third_choice, 
          :correct_answer)
    end
  

  end