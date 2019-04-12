Rails.application.routes.draw do
  resources :platforms
  resources :games
  resources :typetournaments
  resources :nicknames
  resources :sites
  root 'tournaments#index'
  resources :tournaments
  devise_for :players, controllers: {
    sessions: 'players/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
