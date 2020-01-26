module Web::Controllers::Images
  class Update
    include Web::Action
    before :reject_unless_authenticated

    params do
      required(:image).schema do
        required(:title).filled(:str?)
        # required(:image).filled(:file?)
      end
    end

    def call(params)
      image = ImageRepository.new(params[:image])
      Hanami.logger.debug "image: #{image.inspect}"
      if params.valid? && image
        # flash[:notice] = 'logged in.'
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
