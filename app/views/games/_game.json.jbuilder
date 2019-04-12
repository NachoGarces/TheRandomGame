json.extract! game, :id, :namegame, :maxplayers, :description, :year, :developer, :logo, :created_at, :updated_at
json.url game_url(game, format: :json)
