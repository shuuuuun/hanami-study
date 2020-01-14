module Web
  module Controllers
    module Sessions
      class New
        include Web::Action

        def call(params)
        end

        private

        def authenticate!
          # no-op
        end
      end
    end
  end
end
