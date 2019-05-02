Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :platforms
  resources :games
  resources :typetournaments
  resources :nicknames
  resources :sites
  resources :billings, only: [:index] do
    collection do
      get 'pre_pay'
    end
  end
  root 'tournaments#index'
  resources :tournaments do
    resources :players_tournaments, only: [:create]
    resources :comments, only: [:create, :new]
  end
  devise_for :players, controllers: {
    sessions: 'players/sessions',
    :omniauth_callbacks => "players/omniauth_callbacks"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
