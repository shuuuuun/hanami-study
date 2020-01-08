module Web
  module Controllers
    module Home
      class Index
        include Web::Action
        expose :users

        def call(params)
          @users = UserRepository.new.all
        end
      end
    end
  end
end
