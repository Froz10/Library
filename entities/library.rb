# frozen_string_literal: true

class Library
  include Uploader

  attr_reader :authors, :readers, :books, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
    load_db.each { |entity| add(entity) }
  end

  def add(entity)
    case entity
    when Author then @authors << entity
    when Book then @books << entity
    when Reader then @readers << entity
    when Order then @orders << entity
    else raise 'Undefined library entity'
    end
  end

  def save
    data = [@authors, @books, @readers, @orders]
    save_to_db(data)
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
