class UserRepository < Hanami::Repository
  associations do
    has_many :images
  end
end
