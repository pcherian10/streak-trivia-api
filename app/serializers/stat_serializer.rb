class StatSerializer < ActiveModel::Serializer
  attributes :id, :longest_streak, :correct_overall, :incorrect_overall, :ranking
  belongs_to :user
end
