# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/', to: 'home#index', as: :root
get '/home', to: 'home#index'

# get '/users', to: 'users#index'
# get '/users/:id', to: 'users#show'
# get '/users/new', to: 'users#new'
# get '/users/:id/edit', to: 'users#edit'
# post '/users', to: 'users#create'
# patch '/users/:id', to: 'users#update'
# get '/users/delete', to: 'users#delete'
resources :users

# resources :images
# resources :books
