require_relative '../uploaders/image_uploader'

class ImageRepository < Hanami::Repository
  prepend ImageUploader.repository(:image)

  associations do
    belongs_to :user
  end
end
