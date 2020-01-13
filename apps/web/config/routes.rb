# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/ping', to: ->(env) { [200, {}, ['pong']] }

get '/', to: 'home#index'

# get '/images', to: 'images#index'
# get '/images/:id', to: 'images#show'
# get '/images/new', to: 'images#new'
# post '/images', to: 'images#create'
# get '/images/:id/edit', to: 'images#edit'
# patch '/images/:id', to: 'images#update'
resources :images, only: [:index, :show, :new, :create, :edit, :update]

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'
