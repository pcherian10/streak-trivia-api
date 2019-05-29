class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :author_id, :question_text, :first_choice, :second_choice, :third_choice, :correct_answer
end
