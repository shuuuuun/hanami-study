module Web::Controllers::Images
  class New
    include Web::Action
    before :reject_unless_authenticated

    def call(params)
    end
  end
end
