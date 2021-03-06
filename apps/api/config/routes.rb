# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

namespace 'v1' do
  get '/books', to: 'books#index'
  get '/books/:id', id: /\d+/, to: 'books#show'
end
