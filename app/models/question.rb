class Question < ApplicationRecord
    attr_accessor :title ,:test_id
    belongs_to :test
    #has_many :answer
end
