Rails.application.routes.draw do
  devise_for :users, :controllers => { sessions: 'sessions', registrations: 'registrations', 						omniauth_callbacks: "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :tickets
  resources :events
  resources :user_tickets
  resources :shopping_carts
  resources :places

  root :to => 'home#index'

  #post '/login',   to: 'sessions#create', as: :log_in
  #delete '/log_out' => 'sessions#destroy', as: :log_out

  #get '/sign_in' => 'registrations#new', as: :registrations
  #post '/sign_in' => 'registrations#create', as: :sign_in

end
