class Test < ApplicationRecord
    #belongs_to :student, optional: true
    belongs_to :teacher
    #has_and_belongs_to_many :students
    has_many :questions, foreign_key: :test_id
    accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
    enum status: [:published, :future, :draft, :pending, :trash]

    #attr_accessible :title, :questions_attributes
end
