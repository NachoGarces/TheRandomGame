# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  Player.create!({name: "player#{n}", last_name: "#{n}player", email: "player#{n}@gmail.com", rags: "10000", password: "123456", password_confirmation: "123456"})
end

Typetournament.create!({typetournamentname: 'Star'})
Typetournament.create!({typetournamentname: 'Sudden Death'})
Typetournament.create!({typetournamentname: 'PvP'})

g1 = Game.create!({namegame: "splatoon 2", maxplayers: "5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", year: "2017", developer: "nintendo", logo: ""})
g1 = Game.create!({namegame: "Rocket League", maxplayers: "5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", year: "2015", developer: "Psyonix", logo: ""})
g1 = Game.create!({namegame: "League Of Legends", maxplayers: "5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", year: "2009", developer: "Riot Games", logo: ""})
g1 = Game.create!({namegame: "Overwatch", maxplayers: "5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", year: "2016", developer: "Blizzard Entertainment", logo: ""})
g1 = Game.create!({namegame: "Paladins", maxplayers: "5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", year: "2016", developer: "Hi-Rez Studios, Evil Mojo Games", logo: ""})
g1 = Game.create!({namegame: "Rainbow Six Siege", maxplayers: "5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", year: "2015", developer: "Ubisoft", logo: ""})
g1 = Game.create!({namegame: "Hearthstone", maxplayers: "5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", year: "2014", developer: "Blizzard Entertainment", logo: ""})
g1 = Game.create!({namegame: "Clash Royale", maxplayers: "5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", year: "2016", developer: "Supercell", logo: ""})

10.times do |n|
  "t#{n}" = Tournament.create!({description: "comentario#{n}", bet_amounts: "10", typetournament_id: "0", maxteam: "2", maxplayers: "2"})
end
