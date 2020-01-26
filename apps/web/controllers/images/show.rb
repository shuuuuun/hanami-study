module Web::Controllers::Images
  class Show
    include Web::Action
    before :reject_unless_authenticated
    expose :_image

    def call(params)
      # imgタグのヘルパーと衝突するためアンスコを付けてる
      # ref. https://guides.hanamirb.org/helpers/assets/#image
      @_image = ImageRepository.new.find(params[:id])
    end
  end
end
