module Admin::Controllers::Users
  class Index
    include Admin::Action
    expose :users

    def call(params)
      # TODO: pagenation
      @users = UserRepository.new.all
    end
  end
end
