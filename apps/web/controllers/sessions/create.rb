module Web::Controllers::Sessions
  class Create
    include Web::Action
    before :reject_if_authenticated

    params do
      required(:user).schema do
        required(:email).filled(:str?, format?: /@/)
        required(:password).filled(:str?, size?: 8..32)
      end
    end

    def call(params)
      # Hanami.logger.debug "params: #{params.inspect}"
      # user = UserRepository.new.find(params[:user])
      user = UserRepository.new.find_by_email(params[:user][:email])
      Hanami.logger.debug "user: #{user.inspect}"
      if params.valid? && user&.authenticate(params[:user][:password])
        login user

        flash[:notice] = 'logged in.'
        redirect_to routes.images_path
      else
        Hanami.logger.info "invalid params. errors: #{params.errors}"
        self.status = 400
        flash[:error] = 'invalid params.'
      end
    end
  end
end
