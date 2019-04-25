Rails.application.routes.draw do
  resources :players_tournaments, only: [:new, :create]
  resources :platforms
  resources :games
  resources :typetournaments
  resources :nicknames
  resources :sites
  root 'tournaments#index'
  resources :tournaments do
    resources :comments, only: [:create]
  end
  devise_for :players, controllers: {
    sessions: 'players/sessions',
    :omniauth_callbacks => "players/omniauth_callbacks"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
