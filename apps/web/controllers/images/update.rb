module Web::Controllers::Images
  class Update
    include Web::Action
    before :reject_unless_authenticated

    MEGABYTE = 1024 ** 2

    params do
      required(:image).schema do
        optional(:title).filled(:str?)
        optional(:image).filled(size?: 1..(3 * MEGABYTE))
      end
    end

    def call(params)
      image_params = params[:image]
      Hanami.logger.debug "image_params: #{image_params.inspect}"
      image_params = image_params.merge(image: ::File.open(image_params[:image][:tempfile])) if image_params[:image]
      image = Image.new(image_params)
      image = ImageRepository.new.update(params[:id], image)
      if params.valid? && image
        flash[:notice] = 'edited image.'
        redirect_to routes.image_path(image.id)
      else
        Hanami.logger.info "invalid params. errors: #{params.errors}"
        self.status = 400
        flash[:error] = 'invalid params.'
        redirect_to routes.image_path(image.id)
      end
    end
  end
end
