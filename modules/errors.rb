# frozen_string_literal: true

module Errors
  class WrongClassError < StandardError
    def initialize
      super('Invalid data type entered!')
    end
  end

  class EmptyStringError < StandardError
    def initialize
      super('Data should not be empty!')
    end
  end
end
