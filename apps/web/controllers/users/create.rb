module Web::Controllers::Users
  class Create
    include Web::Action

    expose :user

    params do
      required(:user).schema do
        required(:email).filled(:str?)
        required(:password).filled(:str?)
        # required(:email).value(:filled?)
        # required(:password).value(:filled?, size?: 8..40, format?: /\A[\w!$%@#123]+\z/).confirmation
        # required(:password_confirmation).filled(:str?)
      end
      # required(:email).filled(:str?, format?: /@/).confirmation
      # required(:password).filled(:str?).confirmation
    end

    def call(params)
      if params.valid?
        @user = UserRepository.new.create(params[:user])

        redirect_to routes.images_path
      else
        self.status = 422
      end
    end
  end
end
