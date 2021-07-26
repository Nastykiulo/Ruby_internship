class Item < ApplicationRecord
    belongs_to :test
    has_one :question
    has_one :answer
end
