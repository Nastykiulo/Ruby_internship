class Question < ApplicationRecord
    attr_accessor :title ,:test_id
    #belongs_to :test
    has_many :answer, dependent: :destroy
    has_many :test_result, dependent: :destroy
end
