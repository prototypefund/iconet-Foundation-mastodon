# frozen_string_literal: true

class Iconet::Format

  def initialize(attributes)
    @attributes = attributes
  end

  def matches?
    raise NotImplementedError
  end

  def updated_attributes
    raise NotImplementedError
  end
end
