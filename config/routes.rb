Rails.application.routes.draw do
  root 'tournaments#index'
  resources :tournaments
  devise_for :players, controllers: {
    sessions: 'players/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
