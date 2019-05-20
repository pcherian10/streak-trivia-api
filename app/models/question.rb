class Question < ApplicationRecord
    has_many :users, through: :attempts 
end
