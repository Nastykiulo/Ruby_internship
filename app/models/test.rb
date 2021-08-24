class Test < ApplicationRecord
    #belongs_to :student, optional: true
    #belongs_to :teacher
    has_and_belongs_to_many :students
    enum status: [:published, :future, :draft, :pending, :trash]

    #attr_accessible :title, :questions_attributes
    #accepts_nested_attributes_for :question, allow_destroy: true
end
