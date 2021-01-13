require_relative 'autoload'

library = Library.new
author = Author.new(Faker::Book.author)
book = Book.new(Faker::Book.title, author)
reader = Reader.new(Faker::Name.name,
                    Faker::Internet.email,
                    Faker::Address.city,
                    Faker::Address.street_name,
                    Faker::Number.number(digits: 2))


p library
p author
p book
p reader



