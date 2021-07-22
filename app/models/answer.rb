class Answer < ApplicationRecord
    belongs_to :student
    belongs_to :test
end
