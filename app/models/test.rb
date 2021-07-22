class Test < ApplicationRecord
    belongs_to :user
    #belongs_to :student
    has_many :question
    enum status: [:published, :future, :draft, :pending, :trash]
end
