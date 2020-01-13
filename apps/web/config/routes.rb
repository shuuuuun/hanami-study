# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/ping', to: ->(env) { [200, {}, ['pong']] }
get '/', to: 'home#index'
get '/users', to: 'users#index'
get '/images', to: 'images#index'
get '/images/:id', to: 'images#show'
get '/images/:id/edit', to: 'images#edit'
get '/images/new', to: 'images#new'
post '/images', to: 'images#create'
get '/users/new', to: 'users#new'
post '/users', to: 'users#create'
