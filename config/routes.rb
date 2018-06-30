Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#index'
  post '/login' => 'sessions#create'
  get '/trades' => 'trades#index'
  post '/trades' => 'trades#create'
  get '/publicfeed' => 'trades#get_public_feed'
  get '/logout' => 'sessions#destroy'
  post '/comments' => 'comments#create'
  get '/next' => 'trades#next'

end
