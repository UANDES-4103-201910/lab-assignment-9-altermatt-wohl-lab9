Rails.application.routes.draw do
  devise_for :users,:omniauth_callbacks => "callbacks", :controllers => { :registrations => "users/registrations",
    :sessions => "users/sessions",
    :passwords => "users/passwords" , 
    :confirmations => "users/confirmations" }

  devise_scope :user do 
    get 'signup',  to: 'users/registrations#new'
    get 'signin',  to: 'users/sessions#new'
    delete 'signout', to: 'users/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'

  #post '/login',   to: 'sessions#create', as: :log_in
  #delete '/log_out' => 'sessions#destroy', as: :log_out

  #get '/sign_in' => 'registrations#new', as: :registrations
  #post '/sign_in' => 'registrations#create', as: :sign_in

  #post '/logged_in' => 'users#create', as: :logged_in
  #delete '/logged_out' => 'users#destroy', as: :logged_out

end
