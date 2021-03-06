TravelTime::Application.routes.draw do

  resources :comments

  root 'sessions#home' , as: 'home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :photos

  get '/home/login' => 'home#login'
  post '/home/add/' => 'photos#add'
  get  '/home/add/' => 'photos#add'
  get '/users/:id/add' => 'users#add_photo', as: 'adding_photo'
  get '/sign-up' => 'sessions#sign_up', as: 'sign_up'
  get '/users/:id/gallery' => 'users#gallery', as: 'loading_gallery'



  get '/test'  => 'photos#test'
  get '/ppal' => 'users#ppal'
  get '/ajax' => 'users#ajax'


  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'   # Request HTTP
  match '/sessions', to: 'sessions#create',     via: 'get'

end
