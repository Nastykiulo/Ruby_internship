json.extract! test_result, :id, :assignment_id, :pass, :created_at, :updated_at
json.url test_result_url(test_result, format: :json)
