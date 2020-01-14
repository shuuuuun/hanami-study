module Web
  module Controllers
    module Users
      class New
        include Web::Action
        expose :users

        def call(params)
          @user = UserRepository.new
        end

        private

        def authenticate!
          # no-op
        end
      end
    end
  end
end
