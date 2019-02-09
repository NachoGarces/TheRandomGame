json.extract! tournament, :id, :player_id, :description, :bet_amounts, :winner, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
