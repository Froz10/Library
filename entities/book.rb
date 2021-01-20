# frozen_string_literal: true

class Book
  include Validator

  attr_reader :title, :author

  def initialize(title, author)
    validate(title, author)
    @title = title
    @author = author
  end

  private

  def validate(title, author)
    check_for_emptiness(title)
    check_class(title, String)
    check_class(author, Author)
  end
end
