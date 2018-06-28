Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#index'
  post '/sessions' => 'sessions#create'
  get '/trades' => 'trades#index'
  post '/save_trade' => 'trades#create'
  get '/publicfeed' => 'trades#get_public_feed'
  get '/saved' => 'trades#index'
  get '/logout' => 'sessions#destroy'
end
