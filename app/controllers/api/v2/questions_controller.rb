class Api::V2::QuestionsController < ApplicationController

    before_action :set_user, only:[:index, :create, :question, :destroy]

    def index
      @questions = Question.all.select{ |q| q.author_id == @user.id}
      if @questions
        render json: @questions
      else 
        render json: {message: "Could not get the questions."}
      end
    end

    def question #custom method created to return one question that meets specific criteria.
      @question = Question.select_question(@user)
      if @question
        render json: {id: @question.id, question: @question.question_text, first_choice: @question.first_choice, second_choice: @question.second_choice, third_choice: @question.third_choice }
      else 
        render json: {message: 'All questions have been attempted!'}
      end   
    end
  
    def create
      @question = Question.new(question_params)
      if @question.valid?
        @question.save
        render json: {message: 'Question successfully created!'}
      else
        render json: {errors:"Something went wrong, question could not be created!"}
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
          :user_id,
          :author_id,
          :question_text, 
          :first_choice, 
          :second_choice,
          :third_choice, 
          :correct_answer)
    end

  

  end