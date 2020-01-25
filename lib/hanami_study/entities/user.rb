class User < Hanami::Entity
  def authenticate(password)
    # BCrypt::Password.new(user.password) == password
    # binding.pry
    # TODO: use BCrypt
    self.password == password
  end
end
