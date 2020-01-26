module Web::Controllers::Images
  class Create
    include Web::Action
    before :reject_unless_authenticated

    MEGABYTE = 1024 ** 2

    # TODO: params of Images::Create
    # params do
    #   required(:image).schema do
    #     required(:title).filled(:str?)
    #     # required(:image) { size?(1..(5 * MEGABYTE)) }
    #     required(:image)
    #   end
    # end

    def call(params)
      image_params = params[:image]
      Hanami.logger.debug "image_params: #{image_params.inspect}"
      # binding.pry
      image = Image.new(user_id: current_user.id, title: image_params[:title], image: ::File.open(image_params[:image][:tempfile]))
      image = ImageRepository.new.create(image)
      # image = ImageRepository.new.create(params[:image].merge(user_id: current_user.id))
      if params.valid? && image
        flash[:notice] = 'uploaded new image.'
        redirect_to routes.images_path
      else
        Hanami.logger.info "invalid params. errors: #{params.errors}"
        self.status = 400
        flash[:error] = 'invalid params.'
        render :new
      end
    end
  end
end
