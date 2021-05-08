# frozen_string_literal: true

class BasePolicy
  def loudly
    raise ArgumentError unless block_given?
    return true if yield

    raise PolicyException
  end
end
