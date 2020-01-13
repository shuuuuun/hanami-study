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

get '/signup', to: 'users#new', as: :signup
post '/signup', to: 'users#create', as: :signup

get '/login', to: 'sessions#new', as: :login
post '/login', to: 'sessions#create', as: :login
delete '/logout', to: 'sessions#destroy', as: :logout
