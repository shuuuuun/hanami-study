module Api
  module Views
    module Books
      class Index
        include Api::View
        # include Hanami::View
        # layout nil
        # template nil
        format :json

        def render
          p 'Api::Views::Books::Index#render'
          # raw JSON.generate({foo: 'bar'})
          raw books.map(&:to_hash).to_json
        end
      end
    end
  end
end
