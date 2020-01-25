module Web::Controllers::Users
  class New
    include Web::Action
    before :reject_if_authenticated

    def call(params)
    end
  end
end
