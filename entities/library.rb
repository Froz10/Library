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
end