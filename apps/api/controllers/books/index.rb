module Api
  module Controllers
    module Books
      class Index
        include Api::Action
        expose :books
        accept :json

        def call(params)
          p 'Api::Controllers::Books::Index#call'
          # puts format, accept?('text/html'), accept?('application/png'), accept?('application/json')
          @books = BookRepository.new.all
          # self.body = 'OK'
        end
      end
    end
  end
end
