require_relative '../uploaders/image_uploader'

class Image < Hanami::Entity
  include ImageUploader[:image]
end
