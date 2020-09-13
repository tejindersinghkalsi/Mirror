json.extract! word, :id, :wordtitle, :meaning, :created_at, :updated_at
json.url word_url(word, format: :json)
