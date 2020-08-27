Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/dashboard', to: 'dashboard#show'

  get '/discover', to: 'discover#show'

  post '/friendships', to: 'friendships#create'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'

  get '/viewing-party/new/:id', to: 'parties#new'

  post '/viewing-party', to: 'parties#create'
end
