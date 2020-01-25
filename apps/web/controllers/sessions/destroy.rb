module Web::Controllers::Sessions
  class Destroy
    include Web::Action
    before :reject_unless_authenticated

    def call(params)
      Hanami.logger.debug "current_user: #{current_user.inspect}"
      logout
      flash[:notice] = 'logged out.'
      redirect_to routes.root_path
    end
  end
end
