module Web::Controllers::Images
  class Create
    include Web::Action
    before :reject_unless_authenticated

    MEGABYTE = 1024 ** 2

    params do
      required(:image).schema do
        required(:title).filled(:str?)
        required(:image)  { size?(1..(5 * MEGABYTE)) }
      end
    end

    def call(params)
      # TODO: uplaod image
      image = ImageRepository.new.create(params[:image].merge(user_id: current_user.id))
      # Hanami.logger.debug "image: #{image.inspect}"
      if params.valid? && image
        # flash[:notice] = 'logged in.'
        redirect_to routes.images_path
      else
        Hanami.logger.info "invalid params. errors: #{params.errors}"
        self.status = 400
        # flash[:error] = 'invalid params.'
        render :new
      end
    end
  end
end
