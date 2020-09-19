json.extract! feedback, :id, :date, :uipoints, :usability, :improvement, :comments, :addfeatures, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
