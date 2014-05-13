TravelTime::Application.routes.draw do



  root 'sessions#home' , as: 'home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :photos
  resources :comments

  get '/home/login' => 'home#login'
  post '/home/add/' => 'photos#add'
  get  '/home/add/' => 'photos#add'
  post '/users/:id/add' => 'users#add_photo', as: 'adding_photo'
  get '/sign-up' => 'sessions#sign_up', as: 'sign_up'
  get '/users/:id/gallery' => 'users#gallery', as: 'loading_gallery'
  get '/users/:id/maps' => 'users#maps', as: 'loading_maps'
  get '/users/:id/destroy' => 'users#destroy' , as: 'user_destroy'




  get '/test'  => 'photos#test'
  get '/ppal' => 'users#ppal'
  get '/ajax' => 'users#ajax'


  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'   # Request HTTP
  match '/sessions', to: 'sessions#create',     via: 'get'

end
