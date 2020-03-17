json.extract! trip, :id, :origin, :destination, :departure, :arrival, :created_at, :updated_at
json.url trip_url(trip, format: :json)
