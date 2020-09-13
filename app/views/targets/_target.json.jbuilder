json.extract! target, :id, :name, :description, :begin, :end, :created_at, :updated_at
json.url target_url(target, format: :json)
