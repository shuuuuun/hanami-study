module Web::Controllers::Sessions
  class Create
    include Web::Action
    before :reject_if_authenticated

    def call(params)
    end
  end
end
