json.extract! quiz, :id, :name, :result, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
