class UserRepository < Hanami::Repository
  # TODO: encrypt password/email
  # TODO: mask password/email values on logging
  # TODO: make email unique

  associations do
    has_many :images
  end

  def find_by_email(email)
    users.where(email: email).first
  end
end
