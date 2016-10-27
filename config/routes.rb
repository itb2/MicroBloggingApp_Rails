Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  resources :users

  resources :posts

  resources :comments

  post '/login' => 'home#login'

  get '/sign-out' => 'home#logout'

  get '/home/feed' => 'home#feed'

  post 'users/:id/edit' => 'users#editing'


end
