# bundle exec ruby db/seeds.rb

require_relative '../config/environment'
Hanami.boot

BookRepository.new.create(title: 'hoge')
UserRepository.new.create(email: 'hoge@example.com', password: 'password')
UserRepository.new.create(email: 'fuga@example.com', password: 'password')
UserRepository.new.create(email: 'piyo@example.com', password: 'password')
UserRepository.new.create(email: 'poyo@example.com', password: 'password')
UserRepository.new.create(email: 'moga@example.com', password: 'password')
