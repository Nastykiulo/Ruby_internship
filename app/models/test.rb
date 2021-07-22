class Test < ApplicationRecord
    belongs_to :student
    belongs_to :teacher
    has_many :question
    enum status: [:published, :future, :draft, :pending, :trash]
end
