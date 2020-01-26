module Web::Controllers::Images
  class Show
    include Web::Action
    before :reject_unless_authenticated

    def call(params)
      # TODO: show image
    end
  end
end
