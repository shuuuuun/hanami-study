module Web::Controllers::Images
  class Index
    include Web::Action
    before :reject_unless_authenticated
    expose :images

    def call(params)
      @images = ImageRepository.new.all
    end
  end
end
