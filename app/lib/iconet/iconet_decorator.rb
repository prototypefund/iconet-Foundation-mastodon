# frozen_string_literal: true

module Iconet::IconetDecorator

  def decorate(status_attributes)
    @attributes = status_attributes

    @attributes.merge(updated_attributes)
  end

  private
  
  def formats
    [
      Iconet::MarkdownFormat,
      Iconet::NativeFormat,
    ]
  end

  def updated_attributes
    formats.each do |format|
      currentFormat = format.new(@attributes)
      return currentFormat.updated_attributes if currentFormat.matches?
    end
    {}
  end
end
