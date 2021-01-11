class Author
  attr_reader :name, :biography
  def initialize(name, biography = nil)
    @name = name
    @biography = biography
  end
end