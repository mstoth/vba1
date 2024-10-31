json.extract! venue, :id, :name, :contact, :phone, :email, :address, :created_at, :updated_at
json.url venue_url(venue, format: :json)
