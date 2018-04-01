Rails.application.routes.draw do

  namespace :admin do
    resources :players
    resources :territories

    root to: "players#index"
  end

  root 'static_pages#home'

  # Redirect default behaviour to show gamepage view instead.
  get '/players/:id', to: redirect('/gamepage/%{id}')
  # Show action defines @player which can be used to access attributes.
  get '/gamepage/:id', to: 'gamepage#show'

  get '/register', to: 'players#new'
  post '/register', to: 'players#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'

  get '/players', to: 'players#list'

  put '/players/achievement_create/:id', to: 'territories#create'
  get 'territories/get/:id', to: 'territories#territories_in_view'
  put '/territories/invade/:id', to: 'territories#invade'
  put '/territories/expand', to: 'territories#expand'

  mount ActionCable.server, at: '/cable'




  resources :players









  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
