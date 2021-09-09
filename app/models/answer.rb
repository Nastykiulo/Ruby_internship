class Answer < ApplicationRecord
    #belongs_to :student
    attr_accessor :question, :question_id
    #belongs_to :test
    belongs_to :question
end
