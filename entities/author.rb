# frozen_string_literal: true

class Author
  include Validator

  attr_reader :name, :biography

  def initialize(name, biography = '')
    validate(name, biography)
    @name = name
    @biography = biography
  end

  private

  def validate(name, biography)
    check_class(name, String)
    check_class(biography, String)
    check_for_emptiness(name)
  end
end
