module Web::Controllers::Sessions
  class New
    include Web::Action
    before :reject_if_authenticated

    def call(params)
    end

    private

    def authenticate!
      # no-op
    end
  end
end
