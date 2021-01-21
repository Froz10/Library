# frozen_string_literal: true

module Validator
  include Errors

  def check_for_emptiness(str)
    raise EmptyStringError if str.empty?
  end

  def check_class(entity, obj)
    raise WrongClassError unless entity.is_a? obj
  end

  def check_positive(obj)
    raise NumberHouseError unless obj.positive?
  end
end
