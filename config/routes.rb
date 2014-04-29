TravelTime::Application.routes.draw do

  resources :photos
  resources :sessions, only: [:new, :create, :destroy]
  root 'sessions#new' , as: 'home'
  resources :users


  get '/home/login' => 'home#login'
  post '/home/add/' => 'photos#add'
  get  '/home/add/' => 'photos#add'
  get '/users/:id/add' => 'users#add_photo', as: 'adding_photo'
  get '/test'  => 'photos#test'
  get '/galery' => 'users#galery'
  get '/index' => 'sessions#index'


  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'   # Request HTTP
  match '/sessions', to: 'sessions#create',     via: 'get'

end
