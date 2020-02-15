module Web::Controllers::Users
  class Create
    include Web::Action
    handle_exception Hanami::Model::UniqueConstraintViolationError => 400
    before :reject_if_authenticated
    expose :user

    params do
      required(:user).schema do
        required(:email).filled(:str?, format?: /@/)
        required(:password).filled(:str?, size?: 8..32).confirmation
        # required(:password_confirmation).filled(:str?)
      end
    end

    def call(params)
      # Hanami.logger.debug "params: #{params.inspect}"
      @user = UserRepository.new.create_or_nil(params[:user])
      if params.valid? && @user
        # @user = UserRepository.new.create(params[:user])
        login @user

        flash[:notice] = 'signed up.'
        redirect_to routes.root_path
      else
        Hanami.logger.info "invalid params. errors: #{params.errors}"
        self.status = 400
        flash[:error] = 'invalid params.'
        redirect_to routes.signup_path
      end
    end
  end
end
