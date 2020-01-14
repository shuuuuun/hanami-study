module Web::Controllers::Users
  class Create
    include Web::Action

    expose :user

    params do
      required(:user).schema do
        required(:email).filled(:str?, format?: /@/).confirmation
        required(:password).filled(:str?, size?: 8..32).confirmation
        # required(:password_confirmation).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @user = UserRepository.new.create(params[:user])
        session[:user_id] = @user.id

        redirect_to routes.images_path
      else
        self.status = 400
        # self.status = 422
      end
    end
  end
end
