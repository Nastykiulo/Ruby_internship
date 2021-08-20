class TestResult < ApplicationRecord
  belongs_to :assignment
  has_many :test_result_items
end
