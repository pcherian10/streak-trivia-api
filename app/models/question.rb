class Question < ApplicationRecord
    has_many :users, through: :attempts 
    belongs_to :user
end
