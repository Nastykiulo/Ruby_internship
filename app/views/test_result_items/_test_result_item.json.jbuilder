json.extract! test_result_item, :id, :question, :student_answer_id, :test_result_id, :created_at, :updated_at
json.url test_result_item_url(test_result_item, format: :json)
