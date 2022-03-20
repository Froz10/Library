# frozen_string_literal: true

require_relative 'autoload'

library = Library.new
author = Author.new(Faker::Book.author)
book = Book.new(Faker::Book.title, author)
reader = Reader.new(Faker::Name.name,
                    Faker::Internet.email,
                    Faker::Address.city,
                    Faker::Address.street_name,
                    Faker::Number.number(digits: 2))
order = Order.new(book, reader, Faker::Time.forward(days: 23, period: :morning))

library.add(author)
library.add(book)
library.add(reader)
library.add(order)

statistics = Statistics.new(library.orders)
statistics.top_readers
statistics.top_books
statistics.number_of_readers_of_top_books

library.add(statistics)

library.save
