FactoryBot.define do
  # to_create { |instance| BookRepository.new.create(instance) }

  factory :book do
    title { 'hogehoge' }

    # to_create { |instance| BookRepository.new.create(instance) }
    # to_create { |instance| binding.pry; BookRepository.new.create(instance) }
  end
end
