# frozen_string_literal: true

class Reader
  include Validator

  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    validate(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  private

  def validate(name, email, city, street, house)
    [name, email, city, street].each do |personal_data|
      check_class(personal_data, String)
      check_for_emptiness(personal_data)
    end
    check_class(house, Integer)
    check_positive(house)
  end
end
