Rails.application.routes.draw do
  resources :tournaments
  devise_for :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
