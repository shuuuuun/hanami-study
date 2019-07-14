# bundle exec ruby db/seeds.rb

require_relative '../config/environment'
Hanami.boot

BookRepository.new.create(title: 'hoge')
