json.extract! concert, :id, :title, :group_id, :venue_id, :date, :created_at, :updated_at
json.url concert_url(concert, format: :json)
