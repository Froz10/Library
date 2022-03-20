# frozen_string_literal: true

class Library
  include Uploader

  attr_reader :authors, :readers, :books, :orders, :statistics

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
    @statistics = []
    load_db.each { |entity| add(entity) }
  end

  def add(entity)
    case entity
    when Author then @authors << entity
    when Book then @books << entity
    when Reader then @readers << entity
    when Order then @orders << entity
    when Statistics then @statistics << entity
    else raise 'Undefined library entity'
    end
  end

  def save
    data = [@authors, @books, @readers, @orders, @statistics]
    save_to_db(data)
  end
end
