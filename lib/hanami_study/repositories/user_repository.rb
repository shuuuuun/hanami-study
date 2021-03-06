class UserRepository < Hanami::Repository
  # TODO: encrypt password/email
  # TODO: mask password/email values on logging

  associations do
    has_many :images
  end

  def find_by_email(email)
    users.where(email: email).first
  end

  def create_or_nil(attributes)
    create(attributes)
  rescue Hanami::Model::UniqueConstraintViolationError => err
    Hanami.logger.debug err # Hanami::Model::UniqueConstraintViolationError: Mysql2::Error: Duplicate entry 'hoge@example.com' for key 'email'
    nil
  end
end
