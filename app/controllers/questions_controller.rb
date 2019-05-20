class Api::V2::QuestionsController < ApplicationController

    before_action :set_user, only:[:create, :update, :destroy]
  
    def index
      @questions = Question.all.sort_by{|q| q.id}
      render json: @questions
    end
  
    def show
      @question = Question.find(params[:id])
      render json: @question
    end
  
    def create
      @question = @user.questions.build(question_params)
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
      params.require(:question).permit(:author_id, :question, :first_choice, :second_choice,
        :third_choice, :correct_answer)
    end
  
  
  end