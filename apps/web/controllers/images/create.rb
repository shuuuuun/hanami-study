module Web::Controllers::Images
  class Create
    include Web::Action
    before :reject_unless_authenticated

    MEGABYTE = 1024 ** 2

    params do
      required(:image).schema do
        required(:title).filled(:str?)
        required(:image).filled(size?: 1..(3 * MEGABYTE))
      end
    end

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
        redirect_to routes.new_image_path
      end
    end
  end
end
