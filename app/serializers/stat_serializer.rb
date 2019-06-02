class StatSerializer < ActiveModel::Serializer
  attributes :id, :longest_streak, :user_longest_streak, :correct_answer, :incorrect_answer, :ranking
