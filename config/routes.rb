TravelTime::Application.routes.draw do

  resources :photos

  root 'home#index' , as: 'home'
  resources :users
  resources :photos

  get '/home/login' => 'home#login'
  post '/home/add/' => 'photos#add'
  get  '/home/add/' => 'photos#add'
  get '/users/:id/add' => 'users#add_photo', as: 'adding_photo'


end
