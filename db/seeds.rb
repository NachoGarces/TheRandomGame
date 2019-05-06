# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  Player.create!({name: "Player#{n}", last_name: "#{n}player", email: "player#{n}@gmail.com", rags: "10000", password: "123456", password_confirmation: "123456"})
end

Typetournament.create!({typetournamentname: 'Star'}, {typetournamentname: 'Sudden Death'}, {typetournamentname: 'PvP'})

Site.create!({namesite: 'Steam'}, {namesite: 'Xbox Live'}, {namesite: 'Playstation Now'}, {namesite: 'Discord'}, {namesite: 'Nintendo'}, {namesite: 'Epic Games'}, {namesite: 'Blizzard'})

# PC Gamer es el año en que sale el mitico juego Buscaminas
Platform.create!({nameplatform: 'Xbox One', year: 2013 }, {nameplatform: 'Playstation 4', year: 2013 }, {nameplatform: 'Switch', year: 2017 }, {nameplatform: 'PC Gamer', year: 1989 }, {nameplatform: 'Mobile', year: 2008 })

Game.create!({namegame: "splatoon 2", maxplayers: "5", year: "2017", developer: "nintendo", logo: "", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."})
Game.create!({namegame: "Rocket League", maxplayers: "5", year: "2015", developer: "Psyonix", logo: "", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."})
Game.create!({namegame: "League Of Legends", maxplayers: "5", year: "2009", developer: "Riot Games", logo: "", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."})
Game.create!({namegame: "Overwatch", maxplayers: "5", year: "2016", developer: "Blizzard Entertainment", logo: "", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."})
Game.create!({namegame: "Paladins", maxplayers: "5", year: "2016", developer: "Hi-Rez Studios, Evil Mojo Games", logo: "", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."})
Game.create!({namegame: "Rainbow Six Siege", maxplayers: "5", year: "2015", developer: "Ubisoft", logo: "", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."})
Game.create!({namegame: "Hearthstone", maxplayers: "5", year: "2014", developer: "Blizzard Entertainment", logo: "", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."})
Game.create!({namegame: "Clash Royale", maxplayers: "5", year: "2016", developer: "Supercell", logo: "", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."})
