module Web::Controllers::Users
  class New
    include Web::Action
    before :reject_if_authenticated
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
