module Web::Controllers::Images
  class Edit
    include Web::Action
    before :reject_unless_authenticated

    def call(params)
      # TODO: edit image
    end
  end
end
