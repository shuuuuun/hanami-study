module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        before :authenticate!
        expose :current_user
      end
    end

    private

    def login(user)
      session[:user_id] = user.id
    end

    def logout
      session[:user_id] = nil
    end

    def authenticate!
      halt 401 unless authenticated?
    end

    def authenticated?
      !!current_user
    end

    def current_user
      @current_user ||= UserRepository.new.find(session[:user_id])
    end

    def reject_if_authenticated
        redirect_to routes.root_path if authenticated?
    end

    def reject_unless_authenticated
        redirect_to routes.root_path unless authenticated?
    end
  end
end
