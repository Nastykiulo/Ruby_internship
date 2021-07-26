class Test < ApplicationRecord
    belongs_to :student, optional: true
    belongs_to :teacher
    has_many :question
    has_many :items, class_name: "Items"
    enum status: [:published, :future, :draft, :pending, :trash]

    attr_accessor :title, :fields_attributes
    accepts_nested_attributes_for :items, allow_destroy: true
end
