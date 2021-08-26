class Question < ApplicationRecord
    attr_accessor :title ,:test_id
    #belongs_to :test
    has_many :answer_items
    accepts_nested_attributes_for :answer_items, allow_destroy: true, reject_if: :all_blank
    belongs_to :tests
end
