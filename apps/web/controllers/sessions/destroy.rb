module Web::Controllers::Sessions
  class Destroy
    include Web::Action
    before :reject_if_authenticated

    def call(params)
    end
  end
end
