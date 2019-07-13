module Api
  module Controllers
    module Books
      class Show
        include Api::Action
        expose :book
        accept :json

        def call(params)
          p 'Api::Controllers::Books::Show#call'
          @book = BookRepository.new.find(params[:id])
        end
      end
    end
  end
end
