json.extract! answer_item, :id, :title, :correct, :created_at, :updated_at
json.url answer_item_url(answer_item, format: :json)
