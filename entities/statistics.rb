# frozen_string_literal: true

class Statistics

  attr_reader :top_readers, :top_books, :number_of_readers_of_top_books

  def initialize(orders)
    @orders = orders
    @top_readers = top_readers
    @top_books = top_books
    @number_of_readers_of_top_books = number_of_readers_of_top_books
  end

  def top_readers(quantity = 1)
    @orders.group_by(&:reader).sort_by { |_reader, order| -order.size }.to_h.keys.first(quantity)
  end

  def top_books(quantity = 1)
    @orders.group_by(&:book).sort_by { |_book, order| -order.size }.to_h.keys.first(quantity)
  end

  def number_of_readers_of_top_books(quantity = 3)
    @orders.group_by(&:book)
          .sort_by { |_book, order| -order.size }
          .first(quantity).to_h.values.flatten.uniq(&:reader).size
  end
end
